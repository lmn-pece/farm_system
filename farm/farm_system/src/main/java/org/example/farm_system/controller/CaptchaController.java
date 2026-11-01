package org.example.farm_system.controller;

import jakarta.servlet.http.HttpSession;
import org.example.farm_common.result.BaseResult;
import org.example.farm_common.util.CaptchaUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 生成验证码控制器
 */

@RestController
@RequestMapping("/captcha")
public class CaptchaController {
    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    /**
     * @param session 会话对象
     * @return Base64 编码的验证码图片
     */
    // Base64 字符串型的图片（本质是将图片编码为字符串存起来）
    @RequestMapping("/generate")
    public BaseResult<String> generateCaptcha(HttpSession session) {

        // 生成验证码
        Map<String,Object> captcha = CaptchaUtils.generateCaptcha();
        // 将验证码保存到 Redis 中
        String key = "captcha:" + session.getId();
        String value = (String) captcha.get("code");
        // 保存到 Redis ，5分钟过期
        redisTemplate.opsForValue().set(key,value,5, TimeUnit.MINUTES);
        // 返回验证码图片
        String image = (String) captcha.get("image");
        return BaseResult.ok(image);
    }

}
