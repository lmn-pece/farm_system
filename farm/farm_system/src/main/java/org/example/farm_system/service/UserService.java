package org.example.farm_system.service;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.example.farm_common.exception.BusException;
import org.example.farm_common.util.SecurityUtil;
import org.example.farm_system.entity.Permission;
import org.example.farm_system.entity.Role;
import org.example.farm_system.entity.User;
import org.example.farm_system.mapper.PermissionMapper;
import org.example.farm_system.mapper.RoleMapper;
import org.example.farm_system.mapper.UserMapper;
import org.example.farm_common.result.CodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.List;


@Service
@Transactional  // 方法内多条数据库操作要么全部提交，抛出异常就全部回滚，防止出现中间状态脏数据。 防止前面的数据库操作生效而后面的数据库操作异常导致不同步问题
public class UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private PermissionMapper permissionMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;


    /**
     * 根据id查询用户
     *
     * @return 用户
     * @Param id
     */

    public User findById(Long id) {
        // 查询用户基本信息
        User user = userMapper.selectById(id);
        if (user != null) {
            // 查询用户的角色Id列表
            List<Long> roleIds = userMapper.selectUserRoleIds(id);
            if (roleIds != null & !roleIds.isEmpty()) {
                // 查询角色详细信息
                List<Role> roles = roleMapper.selectBatchIds(roleIds);

                // 为每个角色查询权限信息
                for (Role role : roles) {
                    List<Long> permissionIds = roleMapper.selectRolePermissionIds(role.getRoleId());
                    if (permissionIds != null && !permissionIds.isEmpty()) {
                        List<Permission> permissions = permissionMapper.selectBatchIds(permissionIds);
                        role.setPermissions(permissions);
                    }
                }
                user.setRoles(roles);

            }
        }
        return user;
    }


    /**
     * 添加用户
     *
     * @return T/F
     * @Param user
     */
    public boolean addUser(User user) {

        // 检查用户是否存在
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_name", user.getUserName());
        User existUser = userMapper.selectOne(queryWrapper);
        if (existUser != null) {
            throw new BusException(CodeEnum.SYS_USER_EXIST);
        }

        // 设置默认值
        user.setCreateTime(LocalDateTime.now());            //创建时间
        user.setStatus("0");                                //用户状态

        if (!StringUtils.hasText(user.getPassword())) {      // StringUtils.hasText 用于判断字符串是否包含至少一个非空字符
            user.setPassword("123456");
        }

        // 密码加密
        String password = passwordEncoder.encode(user.getPassword());
        user.setPassword(password);
        // 保存用户
        return userMapper.insert(user) > 0;

    }


    /**
     * 修改用户
     *
     * @return 是否成功
     * @Param user
     */
    public boolean updateUser(User user) {

        // 检查用户名是否重复
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_name", user.getUserName())
                .ne("user_id", user.getUserId());
        User existUser = userMapper.selectOne(queryWrapper);
        if (existUser != null) {
            throw new BusException(CodeEnum.SYS_USER_EXIST);
        }

        // 设置更新时间
        user.setUpdateTime(LocalDateTime.now());

        // 如果密码为空，则不更新
        if (!StringUtils.hasText(user.getPassword())) {
            user.setPassword(null);
        } else {
            String password = passwordEncoder.encode(user.getPassword());
            user.setPassword(password);
        }

        return userMapper.updateById(user) > 0;
    }


    /**
     * 重置用户密码
     *
     * @return 操作结果
     * @Param userId, 用户ID
     * @Param newPassword 新密码
     */
    public boolean resetPassword(Long userId, String newPassword) {
        User user = new User();
        user.setUserId(userId);
        user.setPassword(newPassword);
        user.setPwdUpdateDate(LocalDateTime.now());
        user.setUpdateTime(LocalDateTime.now());
        return userMapper.updateById(user) > 0;
    }


    /**
     * 更新用户状态
     *
     * @return 操作结果
     * @Param userId ，用户ID
     * @Param newStatus, 新状态
     */
    public boolean changeStatus(Long userId, String newStatus) {
        User user = new User();
        user.setUserId(userId);
        user.setStatus(newStatus);
        user.setUpdateTime(LocalDateTime.now());
        return userMapper.updateById(user) > 0;
    }


    /**
     * 删除用户
     *
     * @param ids 用户ID列表
     * @return 操作结果
     */
    public boolean deleteUser(List<Long> ids) {

        // 删除用户角色关联
        userMapper.deleteUserRoleByUserIds(ids);

        // 删除用户
        return userMapper.deleteByIds(ids) > 0;

    }


    /**
     * 分页查询用户
     *
     * @param page     当前页
     * @param size     每页大小
     * @param userName 用户名
     * @param status   用户状态
     * @return 分页结果
     */
    public IPage<User> findUserPage(int page, int size, String userName, String status) {
        Page<User> pageObj = new Page<>(page, size);

        // 条件构造器
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();

        if (StringUtils.hasText(userName)) {
            queryWrapper
                    .like("user_name", userName)
                    .or()
                    .like("nick_name", userName);
        }

        if (StringUtils.hasText(status)) {
            queryWrapper.eq("status", status);
        }
        queryWrapper.orderByDesc("create_time");
        return userMapper.selectPage(pageObj, queryWrapper);
    }


    /**
     * 给用户分配角色
     *
     * @param userId  用户Id
     * @param roleIds 角色Id列表
     * @return
     */
    public boolean assignRoles(Long userId, List<Long> roleIds) {
        // 删除用户已有的角色关联
        userMapper.deleteUserRoleByUserIds(List.of(userId));  // List.of() 快速创建一个只读数组,返回一个List
         /*
            等价于
            List<User> userIds = new ArrayList<>();
            userIds.add(userId);
          */

        // 添加新的角色关联
        if (roleIds != null && !roleIds.isEmpty()) {
            userMapper.insertUserRoles(userId, roleIds);
        }

        return true;
    }


    /**
     * 根据用户名查找用户详情
     *
     * @param userName 用户名
     * @return 用户详情
     */
    public User findByUserName(String userName) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_name", userName);
        return userMapper.selectOne(queryWrapper);
    }


    /**
     * 根据用户名查询权限详情列表
     *
     * @param userName 用户名
     * @return 权限详情列表
     */
    public List<Permission> findAllPermission(String userName) {
        return userMapper.selectUserPermissions(userName);
    }


    /**
     * 根据用户名修改当前登录用户个人信息
     *
     * @param user 用户信息
     * @return 修改结果
     */
    public boolean updateCurrentUserInfo(User user) {
        // 根据用户名查询当前用户
        User currentUser = findByUserName(user.getUserName());
        if (currentUser == null) {
            throw new BusException(CodeEnum.PERSONAL_USER_NOT_FOUND);
        }
        // 修改数据
        if (user.getUserName() != null) {
            currentUser.setNickName(user.getNickName());
        }

        if (user.getPhonenumber() != null) {
            currentUser.setPhonenumber(user.getPhonenumber());
        }

        if (user.getEmail() != null) {
            currentUser.setEmail(user.getEmail());
        }

        if (user.getSex() != null) {
            currentUser.setSex(user.getSex());
        }
        currentUser.setUpdateBy(user.getUserName());
        currentUser.setUpdateTime(LocalDateTime.now());
        // 执行更新
        return userMapper.updateById(currentUser) > 0;

    }


    /**
     * 修改当前登录用户的密码
     *
     * @param currentPassword 当前密码
     * @param newPassword     新密码
     * @param confirmPassword 确认密码
     * @param currentUserName 当前用户名
     * @return
     */
    public boolean updateCurrentUserPassword(String currentPassword, String newPassword, String confirmPassword, String currentUserName) {
        // 参数校验
        if (!StringUtils.hasText(currentPassword) || !StringUtils.hasText(newPassword)) {
            throw new BusException(CodeEnum.PERSONAL_PASSWORD_EMPTY);
        }

        if (!newPassword.equals(confirmPassword)) {
            throw new BusException(CodeEnum.PERSONAL_PASSWORD_NOT_MATCH);
        }
        // 根据用户名查询用户信息
        User user = findByUserName(currentUserName);
        if (user == null) {
            throw new BusException(CodeEnum.PERSONAL_USER_NOT_FOUND);
        }
        // 验证当前密码是否正确
        if (!passwordEncoder.matches(currentPassword, user.getPassword())) {
            throw new BusException(CodeEnum.PERSONAL_PASSWORD_ERROR);
        }
        // 更新新密码
        String encodeNewPassword = passwordEncoder.encode(newPassword);
        user.setPassword(encodeNewPassword);

        user.setPwdUpdateDate(LocalDateTime.now());
        user.setUpdateTime(LocalDateTime.now());
        user.setUpdateBy(currentUserName);

        return userMapper.updateById(user) > 0;
    }

}
