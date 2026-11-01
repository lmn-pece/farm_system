package org.example.farm_common.util;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class SecurityUtil {

    /**
     * 获取登录用户名
     *
     */
    public static String getUserName() {
        // 获取会话对象
        SecurityContext context = SecurityContextHolder.getContext();
        // 获取认证对象
        Authentication authentication = context.getAuthentication();

        if(authentication != null && authentication.getName() != null ) {
            return authentication.getName();
        } else {
            return "unknown";
        }



    }
}
