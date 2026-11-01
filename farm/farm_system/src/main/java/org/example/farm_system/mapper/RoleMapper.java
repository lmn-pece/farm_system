package org.example.farm_system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.example.farm_system.entity.Permission;
import org.example.farm_system.entity.Role;

import java.util.List;

public interface RoleMapper extends BaseMapper<Role> {


    /**
     * 根据角色Id查询权限Id列表
     * @param roleId 角色Id
     * @return 权限Id列表
     */
    List<Long> selectRolePermissionIds(@Param("roleId") Long roleId);


    /**
     * 根据角色Id列表删除角色与权限关联
     * @param roleIds 角色Id列表
     */
    void  deleteRolePermissionByRoleIds(@Param("roleIds")List<Long> roleIds);


    /**
     * 批量插入角色与权限关联
     * @param roleId 角色Id
     * @param permissionIds 权限Id列表
     */
    void insertRolePermissions(@Param("roleId")Long roleId,@Param("permissionIds")List<Long> permissionIds);



    /**
     * 根据角色Id列表删除用户与角色关联
     * @param roleIds 角色Id列表
     */
    void  deleteUserRolesByRoleIds(@Param("roleIds")List<Long> roleIds);



    /**
     * 根据角色Id查询用户Id列表
     * @param roleId 角色Id
     * @return 角色Id列表
     */
    List<Long> selectRoleUserIds(@Param("roleId") Long roleId);


    /**
     * 根据角色Id和用户Id列表删除用户与角色关联
     * @param roleId 角色Id
     * @param userIds 用户Id列表
     */
    void deleteRoleUserByRoleIdAndUserIds(@Param("roleId")Long roleId,@Param("userIds") List<Long> userIds);


    /**
     * 检查用户与角色之间是否存在关联
     * @param roleId 角色Id
     * @param userId 用户Id
     * @return 关联数量
     */
    int countUserRoleExists(@Param("roleId")Long roleId,@Param("userId")Long userId);


    /**
     * 插入用户角色关联
     * @param roleId 角色Id
     * @param userId 用户Id
     */
    void insertUserRole(@Param("roleId")Long roleId,@Param("userId")Long userId);

}
