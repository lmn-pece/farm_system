package org.example.farm_common.exception;

// 同一异常处理器

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.farm_common.result.BaseResult;
import org.example.farm_common.result.CodeEnum;
import org.springframework.lang.NonNull;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;



@RestControllerAdvice   // 返回 json 格式响应数据
public class GlobalExceptionHandler {

    // 系统异常
    @ExceptionHandler(Exception.class)
    public BaseResult defaultExceptionHandle(HttpServletRequest req, HttpServletResponse resp,Exception e) {
        e.printStackTrace();
        return BaseResult.error(CodeEnum.SYSTEM_ERROR,e.getMessage());

    }

    // 业务异常
    @ExceptionHandler(BusException.class)
    public BaseResult defaultExceptionHandle(@NonNull BusException e) {
        return BaseResult.error(e.getCodeEnum());
    }


    // 处理权限不足异常,捕捉到异常后再次抛出，交给 AccessDeniedHandler 处理
    @ExceptionHandler(AccessDeniedException.class)
    public void defaultExceptionHandle(AccessDeniedException e) throws AccessDeniedException {
        throw e;
    }

}
