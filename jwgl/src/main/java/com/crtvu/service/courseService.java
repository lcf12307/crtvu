package com.crtvu.service;

import java.util.*;
import com.crtvu.entity.courseEntity;
import com.crtvu.dao.courseDAO;
/**
 * Created by yangming on 2017/3/16/0016.
 */
public interface courseService {
    /**
     * 对课程信息进行分页，并可以翻到第page
     * @param page
     * @return
     */
    List<courseEntity> pagingCourse(int page);

    /**
     * 找出总页数
     * @return
     */
    int page();

    /**
     * 通过id查找某门课程
     * @param id
     * @return
     */
    courseEntity selectCourse(String id);

    /**
     * 添加有学分课程
     * @param course
     */
    void insertCourse(courseEntity course);

    /**
     * 添加无学分课程
     * @param course
     */
    void insertCourseNoCre(courseEntity course);

    /**
     * 通过id删除课程
     * @param id
     */
    void deleteCourse(String id);

    /**
     * 修改某门课程，学分不为空
     * @param id
     * @param name
     * @param credit
     * @param nature
     * @param department
     */
    void updateCourse(String name,Float credit,String nature,String department,String id);

    /**
     * 修改课程，学分为空
     * @param name
     * @param nature
     * @param department
     * @param id
     */
    void updateCourseNoCre(String name,String nature,String department,String id);

}
