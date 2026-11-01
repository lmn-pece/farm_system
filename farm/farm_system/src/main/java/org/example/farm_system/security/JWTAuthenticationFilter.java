package org.example.farm_system.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.farm_common.exception.BusException;
import org.example.farm_common.result.CodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;


/**
 *  JWT 认证过滤器
 *  拦截请求，验证 JWT 令牌并设置用户认证信息
 */
@Component
public class JWTAuthenticationFilter extends OncePerRequestFilter {

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private MyUserDetailService myUserDetailService;


    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        try {
            // 获取请求头中的 JWT 令牌
            String jwt = getJwtFromRequest(request);
            // 非空 &&  格式正确 && 未过期
            if(StringUtils.hasText(jwt) && jwtUtil.isValidToken(jwt) && !jwtUtil.isTokenExpired(jwt)) {
                // 获取用户名
                String username = jwtUtil.getUsernameFromToken(jwt);
                if(username != null && SecurityContextHolder.getContext().getAuthentication() == null) {

                    // 获取用户详情
                    UserDetails userDetails = myUserDetailService.loadUserByUsername(username);

                    // 从 JWT 中获取权限信息
                    List<String> authorities = jwtUtil.getAuthoritiesFromToken(jwt);
                    List<SimpleGrantedAuthority> generatedAuthorities = authorities.stream()
                            .map(SimpleGrantedAuthority::new)
                            .collect(Collectors.toList());

                    // 创建认证对象
                    UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDetails,null,generatedAuthorities);

                    authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));


                    // 将用户认证信息设置到 SecurityContextHolder 中
                    SecurityContextHolder.getContext().setAuthentication(authenticationToken);

                }
            }
        }catch (Exception e) {
            throw new BusException(CodeEnum.UNAUTHORIZED);
        }

        filterChain.doFilter(request,response);

    }

    private String getJwtFromRequest(HttpServletRequest request) {
        String authorization = request.getHeader("Authorization");

         if(authorization != null && authorization.startsWith("Bearer ")) {
             return authorization.substring(7);
         }
         return null;
    }
}
