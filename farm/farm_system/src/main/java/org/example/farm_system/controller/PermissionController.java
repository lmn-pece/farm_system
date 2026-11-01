package org.example.farm_system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import org.example.farm_common.result.BaseResult;
import org.example.farm_system.entity.Permission;
import org.example.farm_system.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    /**
     * 分页查询权限详情
     * @param pageNum 当前页，默认为1
     * @param pageSize 每页显示条数，默认为10
     * @param permissionName 权限名
     * @return 权限详情分页列表
     */
    @GetMapping("/list")
    public BaseResult<IPage<Permission>> getPermissionList(
            @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize",defaultValue = "10") int pageSize,
            @RequestParam(value = "permissionName",required = false) String permissionName) {
        IPage<Permission> result = permissionService.findPermissionPage(pageNum,pageSize,permissionName);
        return BaseResult.ok(result);
    }

    /**
     * 根据Id查询权限详情
     * @param id 权限id
     * @return 权限详情
     */
    @GetMapping("/getPermissionById")
    public BaseResult<Permission> findById(@RequestParam("id") Long id) {
        Permission permission = permissionService.findById(id);
        return BaseResult.ok(permission);
    }

    /**
     * 获取所有权限详情
     * @return 权限详情列表
     */
    @GetMapping("/all")
    public BaseResult<List<Permission>> getAllPermissions() {
        List<Permission> permissionList = permissionService.findAllPermission();
        return BaseResult.ok(permissionList);
    }


    /**
     * 获取权限下拉列表，这里的权限只包含权限ID和权限名
     * @return 权限下拉列表
     */
    @GetMapping("/selectList")
    public BaseResult<List<Permission>> selectList() {
        List<Permission> permissionList = permissionService.getPermissionSelectList();
        return BaseResult.ok(permissionList);
    }


    /**
     * 新增权限
     * @param permission 权限详情
     * @return 操作结果
     */
    @PostMapping("/addPermission")
    public BaseResult addPermission(@RequestBody Permission permission) {
        permissionService.addPermission(permission);
        return BaseResult.ok();
    }


    /**
     * 修改权限
     * @param permission 权限详情
     * @return 操作结果
     */
    @PutMapping("/updatePermission")
    public BaseResult updatePermission(@RequestBody Permission permission) {
        permissionService.updatePermission(permission);
        return BaseResult.ok();
    }

    /**
     * 删除权限
     * @param ids 权限id列表，多个id以“,”分割
     * @return 操作结果
     */
    @DeleteMapping("/deletePermission")
    public BaseResult deletePermission(@RequestParam("ids") String ids) {
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .collect(Collectors.toList());
        permissionService.deletePermission(idList);
        return BaseResult.ok();
    }


}
