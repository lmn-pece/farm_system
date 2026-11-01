package org.example.farm_system.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.example.farm_common.result.BaseResult;
import org.example.farm_system.entity.OperLog;
import org.example.farm_system.log.BusinessType;
import org.example.farm_system.service.OperLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

@RestController
@RequestMapping("/operlog")
public class OperLogController {

    @Autowired
    private OperLogService operLogService;

    /**
     * 分页查询操作日志详情
     * @param pageNum 当前页
     * @param pageSize 每页大小
     * @param title 模块标题
     * @param businessType 业务类型
     * @param operName 操作人员
     * @param requestMethod 请求方式
     * @param operIp 操作Ip地址
     * @param status 操作状态
     * @param startTime 操作开始时间
     * @param endTime 操作结束时间
     * @return 分页结果
     */
    @GetMapping("/list")
    public BaseResult<Page<OperLog>> selectOperLogList(
            @RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize,
            @RequestParam(value = "title",required = false) String title,
            @RequestParam(value = "businessType",required = false) BusinessType businessType,
            @RequestParam(value = "operName",required = false) String operName,
            @RequestParam(value = "requestMethod",required = false)String requestMethod,
            @RequestParam(value = "operIp",required = false) String operIp,
            @RequestParam(value = "status",required = false) Integer status,
            @RequestParam(value = "startTime",required = false)
            @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
            LocalDateTime startTime,
            @RequestParam(value = "endTime",required = false)
            @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
            LocalDateTime endTime) {
        Page<OperLog> operLogPage = operLogService.selectOperLogList(pageNum, pageSize, title, businessType, operName, requestMethod, operIp, status, startTime, endTime);

        return BaseResult.ok(operLogPage);
    }


    /**
     * 根据 Id 查询操作日志详情
     * @param operId 操作日志 Id
     * @return 操作日志详情
     */
    @GetMapping("/getOperLogById")
    public BaseResult<OperLog> selectOperLogById(Long operId) {
        OperLog operLog = operLogService.selectOperLogById(operId);
        return BaseResult.ok(operLog);
    }

}
