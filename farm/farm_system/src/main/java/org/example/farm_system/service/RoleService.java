package org.example.farm_system.service;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.example.farm_common.exception.BusException;
import org.example.farm_common.result.CodeEnum;
import org.example.farm_common.util.SecurityUtil;
import org.example.farm_system.entity.Permission;
import org.example.farm_system.entity.Role;
import org.example.farm_system.entity.User;
import org.example.farm_system.mapper.PermissionMapper;
import org.example.farm_system.mapper.RoleMapper;
import org.example.farm_system.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@Service
@Transactional
public class RoleService {


    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private PermissionMapper permissionMapper;

    /**
     * 分页查询角色
     * @param page 当前页
     * @param size 每页显示条数
     * @param roleName 角色名
     * @param status 角色状态
     * @return 角色分页数据
     */
    public IPage<Role> findRolePage(int page, int size, String roleName, String status) {
        Page<Role> pageObj = new Page<>(page,size);
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();

        // 模糊查询角色名
        if(StringUtils.hasText(roleName)) {
            queryWrapper.like("role_name",roleName);
        }

        // 精确匹配角色状态
        if(StringUtils.hasText(status)) {
            queryWrapper.eq("status",status);
        }

        // 按 role_sort 降序排序
        queryWrapper.orderByDesc("role_sort");

        return roleMapper.selectPage(pageObj,queryWrapper);
    }


    /**
     * 根据Id查询角色(含权限信息)
     * @param Id 角色Id
     * @return 角色详细信息
     */
    public Role findById(Long Id) {

        // 查询角色基本信息
        Role role = roleMapper.selectById(Id);
        if(role != null) {
            // 查询角色对应的权限 Id 列表
            List<Long> permissionIds = roleMapper.selectRolePermissionIds(Id);
            // 查询权限对象 并 放入 角色的权限对象列表中
            if(permissionIds != null && permissionIds.size() > 0) {
                List<Permission> permissions = permissionMapper.selectBatchIds(permissionIds);
                role.setPermissions(permissions);
            }
            return role;
        }
        return null;
    }


    /**
     * 新增角色
     * @param role 角色
     * @return true 成功， false 失败
     */
    public boolean addRole(Role role) {
        // 检查角色名是否存在
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("role_name",role.getRoleName());
        Role existRole = roleMapper.selectOne(queryWrapper);

        if(existRole != null) {
            throw new BusException(CodeEnum.SYS_ROLE_EXIST);
        }

        role.setStatus("0");        // 确保正常状态


        // 添加创建人，创建时间，修改人，修改时间

        String username = SecurityUtil.getUserName();
        role.setCreateBy(username);
        role.setUpdateBy(username);
        role.setCreateTime(LocalDateTime.now());
        role.setUpdateTime(LocalDateTime.now());

        return roleMapper.insert(role) > 0;
    }


    /**
     * 修改角色
     * @param role 角色
     * @return true 成功， false 失败
     */
    public boolean updateRole(Role role) {  // 这里的 role 表示已更新的 role ，而不是待更新的
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        // 查询除了该 Id 外是否有其他角色为该名称
        queryWrapper.eq("role_name",role.getRoleName())
                .ne("role_id",role.getRoleId());
        Role existRole = roleMapper.selectOne(queryWrapper);

        if(existRole != null) {
            // 角色的目标名称已存在
            throw new BusException(CodeEnum.SYS_ROLE_EXIST);
        }

        // 修改人，修改时间
        String username = SecurityUtil.getUserName();
        role.setUpdateBy(username);
        role.setUpdateTime(LocalDateTime.now());
        return roleMapper.updateById(role) > 0;

    }


    /**
     * 删除角色
     * @param Ids 角色Id列表
     * @return true 成功， false 失败
     */
    public boolean deleteRole(List<Long> Ids) {
        // 删除角色权限关联
        roleMapper.deleteRolePermissionByRoleIds(Ids);
        // 删除用户角色关联
        roleMapper.deleteUserRolesByRoleIds(Ids);
        // 删除角色
        return roleMapper.deleteBatchIds(Ids) > 0;

    }


    /**
     * 获取角色下拉列表
     * @return 正常状态的角色列表
     */
    public List<Role> getRoleSelectList() {
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        // 获取所有未禁用的状态
        queryWrapper.eq("status","0");
        // 降序排序
        queryWrapper.orderByDesc("role_sort");
        // 只显示 id 和 name
        queryWrapper.select("role_id","role_name");

        return roleMapper.selectList(queryWrapper);

    }


    /**
     * 修改角色状态
     * @param roleId 角色Id
     * @param status 角色状态
     * @return true 成功， false 失败
     */
    public boolean updateStatus(Long roleId,String status) {
        Role role = new Role();
        role.setRoleId(roleId);
        role.setStatus(status);
        role.setUpdateTime(LocalDateTime.now());
        return roleMapper.updateById(role) > 0;

    }


    /**
     * 查询已分配该角色的用户列表
     * @param roleId 角色Id
     * @param page 当前页
     * @param size 每页显示条数
     * @param userName 用户名
     * @return 已分配该角色的用户分页数据
     */
    public IPage<User> getAssignedUsers(Long roleId, int page, int size, String userName) {

        Page<User> pageObj = new Page<>(page,size);

        // 查询已分配该角色的用户Id列表
        List<Long> userIds = roleMapper.selectRoleUserIds(roleId);

        if(userIds.isEmpty()) {
            return pageObj; // 返回空页面
        }

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();

        queryWrapper.in("user_id",userIds);

        // 查询具体用户的角色Id
        if(StringUtils.hasText(userName)) {
            queryWrapper.and(w->w.like("user_name",userName)
                    .or()
                    .like("nick_name",userName));
        }
        // 查询正常状态的用户
        queryWrapper.eq("status","0");
        // 根据创建时间降序排序
        queryWrapper.orderByDesc("create_time");

        return userMapper.selectPage(pageObj,queryWrapper);

    }


    /**
     * 查询未分配该角色的用户列表
     * @param roleId 角色Id
     * @param page 当前页
     * @param size 每页显示条数
     * @param userName 用户名
     * @return 未分配该角色的用户分页数据
     */
    public IPage<User> getUnAssignedUsers(Long roleId,int page,int size,String userName) {
        Page<User> pageObj = new Page<>(page,size);

        // 查询以分配该角色的用户Id列表
        List<Long> userIds = roleMapper.selectRoleUserIds(roleId);

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();

        if(!userIds.isEmpty()) {
            queryWrapper.notIn("user_id",userIds);
        }

        if(StringUtils.hasText(userName)) {
            queryWrapper.and(w -> w.like("user_name",userName)
                    .or()
                    .like("nick_name",userName));
        }
        // 查询正常状态的用户
        queryWrapper.eq("status","0");
        // 根据创建时间降序排序
        queryWrapper.orderByDesc("create_time");

        return userMapper.selectPage(pageObj,queryWrapper);

    }

    /**
     * 批量选择用户取消角色
     * @param roleId 角色Id
     * @param userIds 用户Id列表
     * @return true 成功， false 失败
     */
    public boolean cancelRoleFromUsers(Long roleId,List<Long> userIds) {

        if(userIds == null || userIds.isEmpty()) {
            return false;
        }

        // 删除用户与角色关联
        roleMapper.deleteRoleUserByRoleIdAndUserIds(roleId,userIds);

        return true;

    }

    /**
     * 批量选择用户分配角色
     * @param roleId 角色Id
     * @param userIds 用户Id列表
     * @return true 成功， false 失败
     */
    public boolean assignRoleToUsers(Long roleId,List<Long> userIds) {

        if(userIds == null || userIds.isEmpty()) {
            return false;
        }

        // 检查当前用户与角色是否存在关联
        for(Long userId : userIds) {
            // 若不存在则创建关联
            if(roleMapper.countUserRoleExists(roleId,userId) ==  0) {
                roleMapper.insertUserRole(roleId,userId);
            }
        }

        return true;

    }


    /**
     * 给角色批量分配权限
     * @param roleId 角色Id
     * @param permissionIds 权限Id列表
     * @return true 成功， false 失败
     */
    public boolean assignPermissions(Long roleId,List<Long> permissionIds) {

        // 删除角色的所有权限
        roleMapper.deleteRolePermissionByRoleIds(List.of(roleId));
        // 如果权限列表不为空则插入新的权限关联
        if(permissionIds != null && !permissionIds.isEmpty()) {
            roleMapper.insertRolePermissions(roleId,permissionIds);
        }
        return true;
    }


    /**
     * 获取角色权限对象列表
     * @param roleId 角色Id
     * @return true 成功， false 失败
     */
    public List<Permission> getRolePermissions(Long roleId) {
        // 查询权限id列表
        List<Long> permissionIds = roleMapper.selectRolePermissionIds(roleId);

        // 获取权限对象
        if(permissionIds != null && !permissionIds.isEmpty()) {
            return permissionMapper.selectBatchIds(permissionIds);
        }

        return Arrays.asList();

    }

}
