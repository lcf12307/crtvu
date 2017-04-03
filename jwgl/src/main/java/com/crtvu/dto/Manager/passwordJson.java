package com.crtvu.dto.Manager;

/**
 * Created by lcf12 on 2017/3/25.
 */
public class passwordJson {
    private long id;//需要修改密码的学生学号
    private String newPassword;//新密码
    private boolean success;//是否成功
    private String error;//失败原因



    @Override
    public String toString() {
        return "passwordJson{" +
                "id='" + id + '\'' +
                ", newPassword='" + newPassword + '\'' +
                ", sucess='" + success + '\'' +
                ", error='" + error + '\'' +
                '}';
    }

    public passwordJson(long id, String newPassword, boolean success, String error) {
        this.id = id;
        this.newPassword = newPassword;
        this.success = success;
        this.error = error;
    }

    public boolean getSucess() {

        return success;
    }

    public void setSucess(boolean success) {
        this.success = success;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public passwordJson() {
    }

    public passwordJson(long id,String newPassword) {
        this.id = id;
        this.newPassword = newPassword;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}