package org.example.farm_main;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;

/**
 * 智慧农场管理系统主启动类
 * 统一启动所有模块
 */


@SpringBootApplication(scanBasePackages = {
        "org.example.farm_common",
        "org.example.farm_system",
        "org.example.farm_warehousing",
        "org.example.farm_plant"
})
@MapperScan(basePackages = {
        "org.example.farm_system.mapper",
        "org.example.farm_warehousing.mapper",
        "org.example.farm_plant.mapper"
})
// 启用 @PreAuthorize 鉴权配置
@EnableGlobalMethodSecurity(prePostEnabled = true)
// 启动 AOP
@EnableAspectJAutoProxy
public class FarmMainApplication {

    public static void main(String[] args) {
        SpringApplication.run(FarmMainApplication.class, args);
    }

    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor () {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        // 添加分页插件
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));

        return interceptor;
    }
}
