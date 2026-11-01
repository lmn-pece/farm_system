package org.example.farm_system.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.example.farm_common.exception.BusException;
import org.example.farm_common.result.CodeEnum;
import org.example.farm_system.entity.Permission;
import org.example.farm_system.mapper.PermissionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    /**
     * 分页查询权限
     * @param page 当前页
     * @param size 每页显示条数
     * @param permissionName 权限名称
     * @return 权限分页列表
     */
    public IPage<Permission> findPermissionPage(int page,int size,String permissionName) {
        Page<Permission> pageObj = new Page<>(page,size);

        QueryWrapper<Permission> queryWrapper =  new QueryWrapper<>();
        if(StringUtils.hasText(permissionName)) {
            queryWrapper.like("permission_name",permissionName);
        }
        queryWrapper.orderByDesc("permission_id");
        return permissionMapper.selectPage(pageObj,queryWrapper);
    }


    /**
     * 根据Id查询权限详情
     * @param permissionId 权限Id
     * @return 权限详情
     */
    public Permission findById(Long permissionId) {
        return permissionMapper.selectById(permissionId);
    }

    /**
     * 获取所有权限详情
     * @return 权限详情列表
     */
    public List<Permission> findAllPermission() {

        QueryWrapper<Permission> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("permission_id");

        return permissionMapper.selectList(queryWrapper);
    }


    /**
     * 获取权限下拉列表，这里的权限只包含权限ID和权限名
     * @return 权限下拉列表
     */
    public List<Permission> getPermissionSelectList() {
        QueryWrapper<Permission> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("permission_id","permission_name");
        queryWrapper.orderByDesc("permission_id");

        return permissionMapper.selectList(queryWrapper);
    }

    /**
     * 新增权限
     * @param permission 权限详情
     * @return true 成功， false 失败
     */
    public boolean addPermission(Permission permission) {
        // 检查权限名是否存在
        QueryWrapper<Permission> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("permission_name",permission.getPermissionName());
        Permission existPermission = permissionMapper.selectOne(queryWrapper);
        if(existPermission != null) {
            throw new BusException(CodeEnum.SYS_PERMISSION_EXIST);
        }

        permission.setCreateTime(LocalDateTime.now());

        return permissionMapper.insert(permission) > 0;
    }


    /**
     * 修改权限
     * @param permission 权限详情
     * @return true 成功， false 失败
     */
    public boolean updatePermission(Permission permission) {
        // 检查权限是否存在（排除自己）
        QueryWrapper<Permission> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("permission_name",permission.getPermissionName())
                .ne("permission_id",permission.getPermissionId());
        Permission existPermission = permissionMapper.selectOne(queryWrapper);
        if(existPermission != null) {
            throw new BusException(CodeEnum.SYS_PERMISSION_EXIST);
        }
        permission.setUpdateTime(LocalDateTime.now());

        return permissionMapper.updateById(permission) > 0;
    }


    /**
     * 删除权限
     * @param permissionIds 权限Id列表
     * @return true 成功， false 失败
     */
    public boolean deletePermission(List<Long> permissionIds) {
        // 删除角色权限关联
        permissionMapper.deleteRolePermissionByPermissionIds(permissionIds);
        // 删除权限
        return permissionMapper.deleteBatchIds(permissionIds) > 0;

    }

}
