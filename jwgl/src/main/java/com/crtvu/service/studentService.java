package com.crtvu.service;

/**
 * Created by lcf12 on 2017/3/16.
 */

import java.util.*;
import com.crtvu.entity.studentEntity;

/**
 * 站在使用者的角度设计接口
 * 方法定义粒度，参数，返回类型，类型
 */
public interface studentService {

    /**
     * 对一组学生信息进行分组，并翻到第page页。
     * @param page
     * @return
     */
    List<studentEntity> pagingStudent(int page);

    /**
     * 找出总页数
     * @return
     */
    int page();
    /**
     * 找到指定id的同学
     * @param id
     * @return
     */
    studentEntity selectStudent(long id);

    /**
     * 添加新同学
     * @param student
     */
    void insertStudent( studentEntity student);

    /**
     * 删除某一ID的同学
     * @param id
     */
    void deleteStudent(long id);

    /**
     * 修改某同学的信息
     * @param id
     * @param name
     * @param className
     * @param major
     */
    void updateStudent(long id, String name, String className, String major);

    /**
     * 修改密码
     * @param id
     * @param newPassword
     */
    int updateStudentPassword(long id , String password, String newPassword);

}
