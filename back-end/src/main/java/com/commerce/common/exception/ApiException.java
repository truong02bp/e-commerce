package com.commerce.common.exception;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.http.HttpStatus;

@NoArgsConstructor
@Getter
public class ApiException extends RuntimeException {

    private String message;

    private HttpStatus httpStatus;

    public static ApiException from(HttpStatus status){
        ApiException exception = new ApiException();
        exception.httpStatus = status;
        return exception;
    }

    public ApiException message(String message){
        this.message = message;
        return this;
    }

}
