package com.crtvu.dto.Manager;

/**
 * Created by lcf12 on 2017/3/25.
 */
public class passwordJson {
    private long id;
    private String oldPassword;
    private String newPassword;
    private boolean success;
    private String error;



    @Override
    public String toString() {
        return "passwordJson{" +
                "id='" + id + '\'' +
                ", oldPassword='" + oldPassword + '\'' +
                ", newPassword='" + newPassword + '\'' +
                ", sucess='" + success + '\'' +
                ", error='" + error + '\'' +
                '}';
    }

    public passwordJson(long id, String oldPassword, String newPassword, boolean success, String error) {
        this.id = id;
        this.oldPassword = oldPassword;
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

    public passwordJson(long id, String oldPassword, String newPassword) {
        this.id = id;
        this.oldPassword = oldPassword;
        this.newPassword = newPassword;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}