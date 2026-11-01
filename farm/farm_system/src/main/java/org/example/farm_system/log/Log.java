package org.example.farm_system.log;

import java.lang.annotation.*;

/**
 * 操作日志记录注解
 */

@Target({ElementType.METHOD})   // 该注解标注在方法上
@Retention(RetentionPolicy.RUNTIME) // 注解在运行时生效
@Documented // 此注解会被 javadoc 记录
public @interface Log {

    // 模块标题
    String title() default "";

    // 业务类型（0其他，1新增，2修改，3删除）
    BusinessType businessType() default BusinessType.OTHER;
}
