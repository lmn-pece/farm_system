package org.example.farm_system.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import org.example.farm_common.util.SecurityUtil;
import org.example.farm_system.entity.User;
import org.example.farm_system.service.UserService;
import org.example.farm_common.result.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RestController         // 返回 json 数据
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;


    /**
     * 根据Id查找用户
     * @param id 用户Id
     * @return 用户详情
     */

    @GetMapping("/getUserById")
    public BaseResult<User> findById(Long id) {
        User user = userService.findById(id);
        return BaseResult.ok(user);
    }


    /**
     * 根据用户名分页查询用户详情
     * @param pageNum 当前页面，默认为1
     * @param pageSize 每页显示条数，默认为10
     * @param userName 用户名
     * @param status 用户状态
     * @return 用户详情分页列表
     */
    @GetMapping("/list")
    @PreAuthorize("hasAnyAuthority('/user/list')")
    public BaseResult<IPage<User>> getUserList(
            @RequestParam(value = "pageNum", defaultValue = "1")int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "10")int pageSize,
            @RequestParam(value = "userName", required = false)String userName,
            @RequestParam(value = "status", required = false)String status){
        IPage<User> userPage = userService.findUserPage(pageNum,pageSize,userName,status);

        return BaseResult.ok(userPage);

    }

    /**
     * 添加用户
     * @param user 用户
     * @return 操作结果
     */
    @PostMapping("/addUser")
    public BaseResult<User> addUser(@RequestBody User user) { // @RequestBody 从请求体中获取 json 数据并构建 User 对象
        boolean isSuccess = userService.addUser(user);

        return BaseResult.ok();

    }


    /**
     * 修改用户
     * @param user 用户
     * @return 操作结果
     */
    @PutMapping("/updateUser")
    public BaseResult<User> updateUser(@RequestBody User user) {
        userService.updateUser(user);
        return BaseResult.ok();
    }


    /**
     * 重置用户密码
     * @param userId 用户Id
     * @param newPassword 新密码
     * @return 操作结果
     */
    @PutMapping("/resetPassword")
    public BaseResult<User> resetPassword(Long userId,String newPassword) {
        userService.resetPassword(userId,newPassword);
        return BaseResult.ok();
    }


    /**
     * 更新用户状态
     * @param userId 用户Id
     * @param newStatus 新状态
     * @return 操作结果
     */
    @PutMapping("/changeStatus")
    public BaseResult<User> changeStatus(Long userId,String newStatus) {
        userService.changeStatus(userId,newStatus);
        return BaseResult.ok();
    }


    /**
     * 根据用户Id列表删除用户
     * @param ids 用户列表
     * @return 操作结果
     */
    @DeleteMapping("/deleteUser")
    public BaseResult deleteUser(String ids) {
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .collect(Collectors.toList());
        userService.deleteUser(idList);
        return BaseResult.ok();
    }


    /**
     * 根据用户Id分配角色
     * @param userId 用户Id
     * @param roleIds 角色Id列表
     * @return 操作结果
     */
    @PutMapping("/assignRoles")
    public BaseResult assignRoles(@RequestParam("userId") Long userId,
                                  @RequestParam(value = "roleIds",required = false) List<Long> roleIds) {
        userService.assignRoles(userId,roleIds);
        return BaseResult.ok();
    }

    /**
     * 获取当前登录用户名
     * @return 用户名
     */
    @GetMapping("getUsername")
    public BaseResult<String> getUsername() {
        String userName = SecurityUtil.getUserName();
        return BaseResult.ok(userName);
    }

}
