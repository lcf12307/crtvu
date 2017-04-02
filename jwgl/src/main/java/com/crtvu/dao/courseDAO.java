package com.crtvu.dao;
import com.crtvu.entity.courseEntity;
import org.apache.ibatis.annotations.Param;

import java.util.*;

import java.util.List;

/**
 * Created by yangming on 2017/3/16/0016.
 */
public interface courseDAO {
    /**
     * 添加课程,有学分
     * @param id
     * @param name
     * @param credit
     * @param nature
     * @param department
     */
    void insertCourse(@Param("id") String id,@Param("name") String name,@Param("credit") Float credit,@Param("nature") String nature,
                      @Param("department") String department);

    /**
     * 添加课程，无学分
     * @param id
     * @param name
     * @param nature
     * @param department
     */
    void insertCourseNoCre(@Param("id") String id,@Param("name") String name,@Param("nature") String nature,
                           @Param("department") String department);

    /**
     * 通过id删除课程
     * @param id
     */
    void deleteCourse(@Param("id") String id);

    /**
     * 修改课程学分不为空
     * @param id
     */
    void updateCourse(@Param("name") String name,@Param("credit") Float credit,@Param("nature") String nature,
                     @Param("department") String department,@Param("id") String id);

    /**
     * 修改课程学分为空
     * @param name
     * @param nature
     * @param department
     * @param id
     */
    void updateCourseNoCre(@Param("name") String name,@Param("nature") String nature,
                      @Param("department") String department,@Param("id") String id);

    /**
     * 通过id查找课程
     * @param id
     */
    courseEntity selectCourse(@Param("id") String id);

    /**
     * 显示所有课程
     * @return
     */
    List<courseEntity> selectAllCourse();
}
