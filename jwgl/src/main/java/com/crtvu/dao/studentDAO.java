package com.crtvu.dao;

import com.crtvu.entity.studentEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lcf12 on 2017/3/15.
 */
public interface studentDAO {
    /**
     * 添加学生实体
     * @param id
     * @param name
     * @param className
     * @param major
     * @param password
     */
    void insertStudent(@Param("id") long id,@Param("name") String name,@Param("className") String className,@Param("major") String major,@Param("password") String password);

    /**
     * 按照id删除学生
     * @param id
     */
    void deleteStudentById(@Param("id") long id);

    /**
     * 修改该同学的密码
     * @param id
     * @param password
     */
    void updateStudentPassword(@Param("id") long id,@Param("password") String password);

    /**
     * 修改该同学的所有信息
     * @param id
     * @param name
     * @param className
     * @param major
     */
    void updateStudent(@Param("id") long id,@Param("name") String name,@Param("className") String className,@Param("major") String major);

    /**
     * 查找某一id的同学
     * @param id
     * @return 返回该同学实体的对象
     */
    studentEntity selectStudentById(@Param("id")  long id);

    /**
     * 查找所有同学
     * @return
     */
    List<studentEntity> selectAllStudent();
}
