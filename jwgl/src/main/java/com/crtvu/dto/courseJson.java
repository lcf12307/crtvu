package com.crtvu.dto;

/**
 * Created by yangming on 2017/3/28/0028.
 */
public class courseJson {
    private String id;
    private String name;
    private float credit;
    private String nature;
    private String department;
    private boolean success;
    private String error;

    @Override
    public String toString() {
        return "courseJson{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", credit=" + credit +
                ", nature='" + nature + '\'' +
                ", department='" + department + '\'' +
                ", success=" + success +
                ", error='" + error + '\'' +
                '}';
    }
    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public courseJson() {
    }

    public courseJson(String id, String name, float credit, String nature, String department, boolean success, String error) {
        this.id = id;
        this.name = name;
        this.credit = credit;
        this.nature = nature;
        this.department = department;
        this.success = success;
        this.error = error;
    }

    public courseJson(String id, String name, float credit, String nature, String department) {
        this.id = id;
        this.name = name;
        this.credit = credit;
        this.nature = nature;
        this.department = department;
    }

    public courseJson(String id, String name, String nature, String department) {
        this.id = id;
        this.name = name;
        this.nature = nature;
        this.department = department;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getCredit() {
        return credit;
    }

    public void setCredit(float credit) {
        this.credit = credit;
    }

    public String getNature() {
        return nature;
    }

    public void setNature(String nature) {
        this.nature = nature;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}