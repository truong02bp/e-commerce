//package com.commerce.core.config;
//
//import com.commerce.common.exception.ApiException;
//import com.commerce.common.exception.ErrorMessage;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.ResponseStatus;
//import org.springframework.web.bind.annotation.RestControllerAdvice;
//
//@RestControllerAdvice
//public class ExceptionHandlerConfig {
//
//    @ExceptionHandler(Exception.class)
//    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
//    public ErrorMessage handleAllException(Exception e){
//        return new ErrorMessage(500,e.getMessage());
//    }
//
//    @ExceptionHandler(ApiException.class)
//    public ResponseEntity<ErrorMessage> apiException(ApiException e)
//    {
//        return ResponseEntity.ok(ErrorMessage.fromApiException(e));
//    }
//
//}
