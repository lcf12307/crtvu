package com.crtvu.dto;

/**
 * Created by yangming on 2017/3/25/0025.
 */

//将所有的ajax请求返回类型，全部封装成json数据
public class courseResult<T> {

    //请求是否成功
    private boolean success;
    private T data;
    private String error;

    public courseResult() {
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public courseResult(boolean success, String error) {

        this.success = success;
        this.error = error;
    }

    public courseResult(boolean success, T data) {

        this.success = success;
        this.data = data;
    }
}
