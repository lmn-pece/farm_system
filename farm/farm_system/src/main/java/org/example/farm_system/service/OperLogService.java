package org.example.farm_system.service;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.example.farm_system.entity.OperLog;
import org.example.farm_system.log.BusinessType;
import org.example.farm_system.mapper.OperLogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;

@Transactional
@Service
public class OperLogService {

    @Autowired
    private OperLogMapper operLogMapper;

    /**
     * 记录操作日志
     * @param operLog 操作日志详情
     */
    public void insert(OperLog operLog) {
        operLogMapper.insert(operLog);
    }

    /**
     *  分页查询操作日志详情
     * @param pageNum 当前页
     * @param pageSize 每页大小
     * @param title 模块标题
     * @param businessType 业务类型
     * @param operName 操作人员
     * @param requestMethod 请求方式
     * @param operIp 操作Ip地址
     * @param status 操作状态
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return 分页结果
     */
    public Page<OperLog> selectOperLogList(Integer pageNum,
                                           Integer pageSize,
                                           String title,
                                           BusinessType businessType,
                                           String operName,
                                           String requestMethod,
                                           String operIp,
                                           Integer status,
                                           LocalDateTime startTime,
                                           LocalDateTime endTime)  {
        Page<OperLog> pageObj = new Page<>(pageNum,pageSize);
        QueryWrapper<OperLog> queryWrapper = new QueryWrapper<>();

        // 模块标题， 模糊查询
        if(StringUtils.hasText(title)) {
            queryWrapper.like("title",title);
        }


        // 业务类型，精确查询
        if(businessType != null) {
            queryWrapper.like("business_type",businessType);
        }

        // 操作人员，模糊查询
        if(StringUtils.hasText(operName)) {
            queryWrapper.like("oper_name",operName);
        }

        // 请求方式，精确查询
        if(StringUtils.hasText(requestMethod)) {
            queryWrapper.eq("request_method",requestMethod);
        }

        // 主机地址，模糊查询
        if(StringUtils.hasText(operIp)) {
            queryWrapper.like("oper_ip",operIp);
        }

        // 操作状态精确查询
        if(status != null) {
            queryWrapper.eq("status",status);
        }

        // 时间范围查询，
        if(startTime != null) {
            queryWrapper.ge("oper_time",startTime);
        }
        if(endTime != null) {
            queryWrapper.le("oper_time",endTime);
        }
        queryWrapper.orderByDesc("oper_time");

        return operLogMapper.selectPage(pageObj,queryWrapper);
    }

    public OperLog selectOperLogById(Long operId) {
        return operLogMapper.selectById(operId);
    }


}
