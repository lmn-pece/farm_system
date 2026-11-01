package org.example.farm_system.controller;

import org.example.farm_common.result.BaseResult;
import org.example.farm_common.util.SecurityUtil;
import org.example.farm_system.entity.User;
import org.example.farm_system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 个人中心控制器
 * 提供用户个人信息管理的相关接口
 */
@RestController
@RequestMapping("/personal")
public class PersonalController {

    @Autowired
    private UserService userService;

    /**
     * 查询当前用户的个人信息
     * @return 用户详情
     */
    @GetMapping("/info")
    public BaseResult<User> getUserInfo() {
        // 获取当前登录用户名
        String userName = SecurityUtil.getUserName();
        // 根据用户名查询用户信息
        User user = userService.findByUserName(userName);
        // 返回用户信息
        return  BaseResult.ok(user);
    }


    /**
     * 修改用户信息
     * @param user 用户详情
     * @return 操作结果
     */
    @PutMapping("update")
    public BaseResult updateUserInfo(@RequestBody User user) {
        // 获取当前登陆用户名
        user.setUserName(SecurityUtil.getUserName());

        // 修改用户信息
        userService.updateCurrentUserInfo(user);
        return BaseResult.ok();
    }

    @PutMapping("/password")
    public BaseResult updateUserPassword(
            @RequestParam String currentPassword,
            @RequestParam String newPassword,
            @RequestParam String confirmPassword){
        String userName = SecurityUtil.getUserName();
        userService.updateCurrentUserPassword(currentPassword,newPassword,confirmPassword,userName);
        return BaseResult.ok();
    }


}
