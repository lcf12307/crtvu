package com.crtvu.service;

import com.crtvu.entity.Teacher;

import java.util.List;

/**
 * Created by gao27024037 on 2017/3/24.
 */
public interface EditTeacher {

    /**
     * 查询列表里老师信息
     * @return
     */
    List<Teacher> getTeacherList(int offset,int limit);
    /**
     * 获取被编辑教师信息
     * @param teacherId
     * @return
     */
    Teacher getInformation(long teacherId);

    /**
     * 修改老师信息
     * @param teacher
     * @return
     */
    int updateInformation(Teacher teacher);

    /**
     *
     * @param teacherPassword
     * @return
     */
    String getMD5(String teacherPassword);

    /**
     * 根据ID删除
     * @param teacherId
     * @return
     */
    int deleteById(long teacherId);

    /**
     * 增加教师
     * @param teacher
     * @return
     */
    int insert(Teacher teacher);
}
