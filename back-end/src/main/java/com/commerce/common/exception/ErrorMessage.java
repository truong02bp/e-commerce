package com.commerce.common.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ErrorMessage {

    private int statusCode;

    private String message;

    public static ErrorMessage fromApiException(ApiException exception){
        ErrorMessage errorMessage = new ErrorMessage();
        errorMessage.message = exception.getMessage();
        errorMessage.statusCode = exception.getHttpStatus().value();
        return errorMessage;
    }

}
