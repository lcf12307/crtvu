package com.crtvu.dao;

import com.crtvu.entity.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by gao27024037 on 2017/3/18.
 */
public interface TeacherDao {
    /**
     * 根据ID查询老师
     * @param teacherId
     * @return
     */
    Teacher queryById(long teacherId);

    /**
     * 根据偏移量查询老师
     * @param offset
     * @param limit
     * @return
     */
    List<Teacher> queryAll(@Param("offset") int offset, @Param("limit") int limit);

    /**
     * 添加教师
     * @param Teacher
     * @return
     */
    int insertTeacher(Teacher Teacher);

    /**
     * 根据ID删除老师
     * @param teacherId
     * @return
     */
    int deleteById(long teacherId);

    /**
     * 修改老师信息
     * @param teacher
     * @return
     */
    int updateTeacher(Teacher teacher);
}

