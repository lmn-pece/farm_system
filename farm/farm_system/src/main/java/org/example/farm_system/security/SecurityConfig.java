package org.example.farm_system.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

/**
 * Spring Security 核心配置类
 */

@Configuration
public class SecurityConfig {

    @Autowired
    private CaptchaFilter captchaFilter;
    @Autowired
    private JWTAuthenticationFilter jwtAuthenticationFilter;
    @Autowired
    private MyLoginFailureHandler myLoginFailureHandler;
    @Autowired
    private MyLoginSuccessHandler myLoginSuccessHandler;
    @Autowired
    private MyAccessDeniedHandler myAccessDeniedHandler;
    @Autowired
    private MyLogoutSuccessHandler myLogoutSuccessHandler;

    // Spring Security 配置
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        // 自定义表单登录
        http.formLogin(
                form -> {
                    form.usernameParameter("username")  // 用户名项
                            .passwordParameter("password")  // 密码项
                            .loginProcessingUrl("/user/login")  // 登陆处理器
                            .successHandler(myLoginSuccessHandler)    // 登陆成功处理
                            .failureHandler(myLoginFailureHandler);    // 登录失败处理
                }
        );

        // 权限拦截配置
        http.authorizeHttpRequests(
                resp -> {
                    resp.requestMatchers("/user/login","/captcha/generate").permitAll();  // 登录，验证码生成接口放行
                    resp.anyRequest().authenticated();  // 其他接口需要认证
                }
        );

        // 退出登录配置
        http.logout(
                logout -> {
                    logout.logoutUrl("/user/logout")    // 退出登录接口
                            .logoutSuccessHandler(myLogoutSuccessHandler); //推出成功处理
//                            .clearAuthentication(true)  // 退出成功后清除认证信息
//                            .invalidateHttpSession(true);    // 退出成功后清除 session
                }
        );

        // 设置 Session 管理策略为无状态
        http.sessionManagement(session ->
                session.sessionCreationPolicy(SessionCreationPolicy.STATELESS));

        // 异常处理
        http.exceptionHandling(
                exception -> {
                    exception.authenticationEntryPoint(new MyAuthenticationEntryPoint())    // 未登录处理
                            .accessDeniedHandler(myAccessDeniedHandler);   // 权限不足处理
                }
        );

        // 关闭 csrf 防护

        http.csrf(csrf -> csrf.disable());




        // 跨域配置
        http.cors(cors -> cors.configurationSource(corsConfigurationSource()));


        /**
         * 添加验证码过滤器
         * 配置验证码过滤器要先于用户名和密码执行
         * 添加 JWT 过滤器
         */
        http.addFilterBefore(captchaFilter, UsernamePasswordAuthenticationFilter.class);
        http.addFilterBefore(jwtAuthenticationFilter,UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }


    // 跨域配置对象
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        corsConfiguration.addAllowedOrigin("*");    // 允许所有来源
        corsConfiguration.addAllowedHeader("*");    // 允许所有请求头
        corsConfiguration.addAllowedMethod("*");    // 允许所有请求方法
        corsConfiguration.setAllowCredentials(false);    // 不允许 cookie 跨域

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**",corsConfiguration);  // 应用于所有路径

        return source;

    }


}
