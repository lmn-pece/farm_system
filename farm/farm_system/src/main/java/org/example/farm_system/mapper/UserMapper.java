package org.example.farm_system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.example.farm_system.entity.Permission;
import org.example.farm_system.entity.User;

import java.util.List;


public interface UserMapper extends BaseMapper<User> {

    /**
     * 根据用户Id列表批量删除用户角色关联
     * @param userIds 用户Id列表
     */
     void deleteUserRoleByUserIds(@Param("userIds") List<Long> userIds);


    /**
     * 根据用户Id批量插入用户角色关联
     * @param userId 用户Id
     * @param roleIds 角色id列表
     */
     void insertUserRoles(@Param("userId") Long userId,@Param("roleIds") List<Long> roleIds);

    /**
     * 根据用户Id查询角色Id列表
     * @param userId 用户Id
     * @return 角色Id列表
     */
     List<Long> selectUserRoleIds(@Param("userId") Long userId);


    /**
     * 根据用户名查询权限详情列表
     * @param userName 用户名
     * @return 权限详情列表
     */
     List<Permission> selectUserPermissions(@Param("userName") String  userName);

}

