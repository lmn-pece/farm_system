package org.example.farm_system.controller;



import com.baomidou.mybatisplus.core.metadata.IPage;
import org.example.farm_common.result.BaseResult;
import org.example.farm_system.entity.LoginInfo;
import org.example.farm_system.service.LoginInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/loginInfo")
public class LoginInfoController {

    @Autowired
    private LoginInfoService loginInfoService;

    /**
     * 获取登录信息详情
     * @param id 登录信息 Id
     * @return 登录信息详情
     */
    @GetMapping("/getLoginInfoById")
    public BaseResult<LoginInfo> findById(Long id) {
        LoginInfo loginInfo = loginInfoService.getLoginInfo(id);

        return BaseResult.ok(loginInfo);

    }

    /**
     * 分页显示登录信息详情
     * @param pageNum 当前页
     * @param pageSize 每页显示条数
     * @param userName 用户名
     * @param status 登陆状态
     * @param ipaddr 登录 IP 地址
     * @return 分页显示登录信息详情
     */
    @GetMapping("/list")
    public BaseResult<IPage<LoginInfo>> getLoginInfoList(
            @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize",defaultValue = "10") int pageSize,
            @RequestParam(value = "userName",required = false) String userName,
            @RequestParam(value = "status",required = false) String status,
            @RequestParam(value = "ipaddr",required = false) String ipaddr,
            @RequestParam(value = "beginTime",required = false) String beginTime,
            @RequestParam(value = "endTime",required = false) String endTime) {
        IPage<LoginInfo> loginInfoList = loginInfoService.getLoginInfoList(pageNum, pageSize, userName, status, ipaddr,beginTime,endTime);
        return BaseResult.ok(loginInfoList);
    }


}
