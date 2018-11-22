package com.xm.shop.persistence;

import lombok.Data;

@Data
public class Result {
    public static final int ERROR_STATUS=500;//失败的状态

    public static final int SUCCESS_STATUS=200;//成功的状态

    private int status=SUCCESS_STATUS;//处理结果是否成功

    private String message;//返回的信息

    private Object data;//返回的数据


    /**
     * 出错时用
     * @param message
     * @return
     */

    public static Result fail(String message){
        Result result = new Result();
        result.setMessage(message);
        result.setStatus(ERROR_STATUS);
        return result;
    }

    /**
     * 成功时用
     * @param message
     * @param data
     * @return
     */
    public static Result success(String message,Object data){
        Result result = new Result();
        result.setMessage(message);
        result.setData(data);
        result.setStatus(SUCCESS_STATUS);
        return result;
    }


}
