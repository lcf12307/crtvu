package com.crtvu.entity;

/**
 * Created by lcf12 on 2017/3/15.
 */
public class studentEntity {

    private long id;

    private String name;

    private String className;

    private String major;

    private String password;

    public studentEntity() {
    }

    public studentEntity(long id, String name, String className, String major) {
        this.id = id;
        this.name = name;
        this.className = className;
        this.major = major;
    }

    public studentEntity(long id, String name, String className, String major, String password) {
        this.id = id;
        this.name = name;
        this.className = className;
        this.major = major;
        this.password = password;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "studentEntity{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", className='" + className + '\'' +
                ", major='" + major + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
