package org.example.farm_system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.example.farm_system.entity.Permission;

import java.util.List;

public interface PermissionMapper extends BaseMapper<Permission> {

    /**
     * 根据权限Id列表批量删除角色权限关联
     * @param permissionIds 权限Id
     */
    void deleteRolePermissionByPermissionIds(@Param("permissionIds") List<Long> permissionIds);

}
