package com.crtvu.entity;

/**
 * Created by gao27024037 on 2017/3/18.
 */

public class Teacher {

    //教师ID
    private long teacherId;

    //教师名字
    private String teacherName;

    //教师职称
    private String teacherTitle;

    //教师密码
    private String teacherPassword;

    public Teacher() {
    }

    public Teacher(long teacherId, String teacherName, String teacherTitle, String teacherPassword) {
        this.teacherId = teacherId;
        this.teacherName = teacherName;
        this.teacherTitle = teacherTitle;
        this.teacherPassword = teacherPassword;
    }

    public long getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(long teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherTitle() {
        return teacherTitle;
    }

    public void setTeacherTitle(String teacherTitle) {
        this.teacherTitle = teacherTitle;
    }

    public String getTeacherPassword() {
        return teacherPassword;
    }

    public void setTeacherPassword(String teacherPassword) {
        this.teacherPassword = teacherPassword;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "teacherId=" + teacherId +
                ", teacherName='" + teacherName + '\'' +
                ", teacherTitle='" + teacherTitle + '\'' +
                ", teacherPassword='" + teacherPassword + '\'' +
                '}';
    }
}
