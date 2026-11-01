package org.example.farm_system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import org.example.farm_common.result.BaseResult;
import org.example.farm_system.entity.Permission;
import org.example.farm_system.entity.Role;
import org.example.farm_system.entity.User;
import org.example.farm_system.log.BusinessType;
import org.example.farm_system.log.Log;
import org.example.farm_system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    /**
     * 分页查询角色
     * @param pageNum 当前页面，默认为1
     * @param pageSize 每页显示条数，默认为10
     * @param roleName 角色名称
     * @param status 角色状态
     * @return 角色分页数据
     */
    @GetMapping("/list")
    @PreAuthorize("hasAnyAuthority('/role/list')")  // 鉴权（需要有 '/role/list' 权限才能访问该 uri
    public BaseResult<IPage<Role>>  getRoleList(
            @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize",defaultValue = "10") int pageSize,
            @RequestParam(value = "roleName",required = false) String roleName,
            @RequestParam(value = "status",required = false) String status) {

        IPage<Role> result = roleService.findRolePage(pageNum,pageSize,roleName,status);

        return BaseResult.ok(result);
    }

    /**
     * 根据角色Id查询角色信息
     * @param Id 角色Id
     * @return 角色信息
     */
    @GetMapping("getRoleById")
    public BaseResult<Role> findById(@RequestParam("id") Long Id) {
        Role role = roleService.findById(Id);
        return BaseResult.ok(role);
    }


    /**
     * 添加角色
     * @param role 角色信息
     * @return 操作结果
     */
    @Log(title = "角色管理",businessType = BusinessType.INSERT)
    @PostMapping("/addRole")
    public BaseResult addRole(@RequestBody Role role) {

        roleService.addRole(role);
        return BaseResult.ok("角色添加成功");
    }


    /**
     * 修改角色
     * @param role 角色信息
     * @return 操作结果
     */
    @PutMapping("/updateRole")
    public BaseResult updateRole(@RequestBody Role role) {

        roleService.updateRole(role);

        return BaseResult.ok();
    }


    /**
     * 删除角色
     * @param ids 角色id字符串，以“,”分割
     * @return 操作结果
     */
    @Log(title = "角色管理",businessType = BusinessType.DELETE)
    @DeleteMapping("/deleteRole")
    public BaseResult deleteRole( String ids) {
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .collect(Collectors.toList());
        roleService.deleteRole(idList);
        return BaseResult.ok();
    }


    /**
     * 获取角色下拉列表
     * @return 角色
     */
    @GetMapping("/selectList")
    public BaseResult<List<Role>> getRoleSelectList() {
        List<Role> roles = roleService.getRoleSelectList();
        return BaseResult.ok(roles);
    }


    /**
     * 修改角色状态
     * @param roleId 角色Id
     * @param status 角色目标状态
     * @return 操作结果
     */
    @PutMapping("/changeStatus")
    public BaseResult changeStatus(@RequestParam("roleId") Long roleId,
                                   @RequestParam("status") String status) {
        roleService.updateStatus(roleId,status);

        return BaseResult.ok();
    }

    /**
     * 分页查询已分配角色的用户列表
     * @param roleId 角色Id
     * @param pageNum 当前页，默认为1
     * @param pageSize 每页显示条数，默认为10
     * @param userName 用户名
     * @return 已分配角色的用户分页数据
     */
    @GetMapping("/getAssignUsers")
    public BaseResult<IPage<User>> getAssignUsers(
            @RequestParam("roleId") Long roleId,
            @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize",defaultValue = "10") int pageSize,
            @RequestParam(value = "userName",required = false) String userName) {
        IPage<User> result = roleService.getAssignedUsers(roleId,pageNum,pageSize,userName);
        return BaseResult.ok(result);
    }


    /**
     * 分页查询未分配角色的用户列表
     * @param roleId 角色Id
     * @param pageNum 当前页，默认为1
     * @param pageSize 每页显示条数，默认为10
     * @param userName 用户名
     * @return 未分配角色的用户分页数据
     */
    @GetMapping("/getUnassignUsers")
    public BaseResult<IPage<User>> getUnassignUsers(
            @RequestParam("roleId") Long roleId,
            @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize",defaultValue = "10") int pageSize,
            @RequestParam(value = "userName",required = false) String userName) {
        IPage<User> result = roleService.getUnAssignedUsers(roleId,pageNum,pageSize,userName);
        return BaseResult.ok(result);
    }


    /**
     * 批量选择用户取消角色
     * @param roleId 角色Id
     * @param userIds 用户Id列表
     * @return 操作结果
     */
    @DeleteMapping("/cancelRoleFromUsers")
    public BaseResult cancelRoleFromUsers(
            @RequestParam("roleId") Long roleId,
            @RequestParam("userIds") String userIds) {

        List<Long> userIdList = Arrays.stream(userIds.split(","))
                .map(Long::parseLong)
                .toList();

        roleService.cancelRoleFromUsers(roleId,userIdList);
        return BaseResult.ok();
    }


    /**
     * 批量选择用户分配角色
     * @param roleId 角色Id
     * @param userIds 用户Id列表
     * @return 操作结果
     */
    @PostMapping("/assignRoleToUsers")
    public BaseResult assignRoleToUsers(
            @RequestParam("roleId") Long roleId,
            @RequestParam("userIds") String userIds) {

        List<Long> userIdList = Arrays.stream(userIds.split(","))
                .map(Long::parseLong)
                .collect(Collectors.toList());

        roleService.assignRoleToUsers(roleId,userIdList);
        return BaseResult.ok();
    }


    /**
     * 给角色批量设置权限
     * @param roleId 角色Id
     * @param permissionIds 权限Id列表
     * @return 操作结果
     */
    @PutMapping("/assignPermissions")
    public BaseResult assignPermissions(
            @RequestParam("roleId") Long roleId,
            @RequestParam("permissionIds") String permissionIds) {

        List<Long> permissionIdList = Arrays.stream(permissionIds.split(","))
                .filter(str -> !StringUtils.isEmpty(str))
                .map(Long::parseLong)
                .collect(Collectors.toList());

        roleService.assignPermissions(roleId,permissionIdList);
        return BaseResult.ok();

    }

    @GetMapping("/getRolePermissions")
    public BaseResult<List<Permission>> getRolePermissions(@RequestParam("roleId") Long roleId) {
        List<Permission> permissions = roleService.getRolePermissions(roleId);
        return BaseResult.ok(permissions);
    }

}
