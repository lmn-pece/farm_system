package org.example.farm_common.result;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 统一结果集返回结果
 *
 */

@Data
@AllArgsConstructor
public class BaseResult<T> {

    // 状态码 （成功200，失败其他）
    private Integer code;
    // 提示信息
    private String msg;
    // 返回数据
    private T data;

    // 构建成功结果
    public static <T> BaseResult<T> ok() {
        return new BaseResult<>(CodeEnum.SUCCESS.getCode(), CodeEnum.SUCCESS.getMessage(), null);
    }

    public static <T> BaseResult<T> ok(T data) {
        return new BaseResult<>(CodeEnum.SUCCESS.getCode(),CodeEnum.SUCCESS.getMessage(),data);
    }

    public static <T> BaseResult<T> error(CodeEnum codeEnum) {
        return new BaseResult<>(codeEnum.getCode(), codeEnum.getMessage(), null);
    }

    public static <T> BaseResult<T> error(CodeEnum codeEnum,T data) {
        return new BaseResult<>(codeEnum.getCode(),codeEnum.getMessage(),data);
    }

    /**
     * 关于 这个 静态方法的 <T> 由于泛型实在实例化时被确定类型，而静态方法的调用本身不存在实例化的过程，导致泛型 T 对静态方法不可见
     * 所以我们需要在方法的返回值前通过 <T> 占位符来声明泛型参数，让编译器自主推断 <T> 的类型
     */

}
