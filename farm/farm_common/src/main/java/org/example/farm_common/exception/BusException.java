package org.example.farm_common.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.example.farm_common.result.CodeEnum;

/**
 * 自定义业务异常
 */

@Data
@AllArgsConstructor
public class BusException extends RuntimeException {

    private CodeEnum codeEnum;



}
