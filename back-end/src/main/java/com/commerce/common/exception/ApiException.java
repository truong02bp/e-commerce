package com.commerce.common.exception;

import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;

@NoArgsConstructor
@Getter
public class ApiException extends RuntimeException {

    private String message;

    private HttpStatus httpStatus;

    public static ApiException builder(){
        return new ApiException();
    }

    public ApiException httpStatus(HttpStatus status){
        this.httpStatus = status;
        return this;
    }

    public ApiException message(String message){
        this.message = message;
        return this;
    }

}
