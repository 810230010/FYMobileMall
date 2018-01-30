package com.fy.mobile.entity.common;

import lombok.Data;

@Data
public class RestResult<T> {
    private static final String SUCCESS_MSG = "success";
    private static final int ERROR_CODE = -1;
    private static final int SUCCESS_CODE = 0;
    private int code;
    private String msg;
    private T data;
    public RestResult(){
        this.code = SUCCESS_CODE;
        this.msg = SUCCESS_MSG;
    }
    public RestResult(int code){
        this.code = code;
    }
    public RestResult(int code, String message){
        this.code = code;
        this.msg = message;
    }
    public RestResult(int code, T data, String message){
        this.code = code;
        this.data = data;
        this.msg = message;
    }
    public RestResult ok(){
        return new RestResult();
    }
    public RestResult ok(String message, T data){
        return new RestResult(SUCCESS_CODE, data, message);
    }
    public RestResult ok(T data){
        return new RestResult(SUCCESS_CODE, data, SUCCESS_MSG);
    }
    public RestResult error(String message){
        this.code = -1;
        this.msg = message;
        return new RestResult(ERROR_CODE, message);
    }
    public RestResult error(){
        return new RestResult(ERROR_CODE, "服务器异常!");
    }

}
