package com.crtvu.dao;

import org.junit.Test;
import com.crtvu.entity.courseEntity;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import javax.swing.*;
import  java.util.List;

import static org.junit.Assert.*;

/**
 * Created by yangming on 2017/3/20/0020.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class courseDAOTest {

    @Resource
    private courseDAO courseDAO;
    @Test
    public void insertCourse() throws Exception {
        String id = "001";
        String name = "xiandai1";
        float credit = (float) 2.5;
        String nature = "shuxue";
        String department = "xinyuan";
        courseDAO.insertCourse(id,name,credit,nature,department);
        courseEntity course = courseDAO.selectCourse("001");
        System.out.println(course.getId());
        System.out.println(course);
       /** 测试结果
       *  001
       *  courseEntity{id='001', name='xiandai1', credit=2.5, nature='shuxue', department='xinyuan'}
       */


    }

    @Test
    public void insertCourseNoCre() throws Exception {
        String id = "002";
        String name = "xiandai2";
        String nature = "shuxue";
        String department = "xinyuan";
        courseDAO.insertCourseNoCre(id,name,nature,department);
        courseEntity course = courseDAO.selectCourse("002");
        System.out.println(course.getId());
        System.out.println(course);
        /** 测试结果
         *  002
         *  courseEntity{id='002', name='xiandai2', credit=0.0, nature='shuxue', department='xinyuan'}
         */
    }

    @Test
    public void deleteCourse() throws Exception {
        String id= "003";
        courseEntity course = courseDAO.selectCourse("003");
        System.out.println(course.getId());
        System.out.println(course);
        courseDAO.deleteCourse(id);
        /**  测试结果
         *   能够删除数据
         *
         */

    }

    @Test
    public void updateCourse() throws Exception {
        String id = "002";
        String name = "xiandai2";
        float credit = (float) 3.4;
        String nature = "shuxue";
        String department = "xinyuan";
        courseDAO.updateCourse(name,credit,nature,department,id);
        courseEntity course = courseDAO.selectCourse("002");
        System.out.println(course.getId());
        System.out.println(course);
        /** 测试结果
         *  002
         *  courseEntity{id='002', name='xiandai2', credit=3.4, nature='shuxue', department='xinyuan'}
         */

    }
    @Test
    public void updateCourseNoCre() throws Exception {
        String id = "003";
        String name = "gaoshu2";
        String nature = "shuxue";
        String department = "xinyuan";
        courseDAO.updateCourseNoCre(name,nature,department,id);
        courseEntity course = courseDAO.selectCourse("003");
        System.out.println(course.getId());
        System.out.println(course);
        /** 测试结果
         *  002
         *  courseEntity{id='002', name='gaoshu2', credit=0.0, nature='shuxue', department='xinyuan'}
         */
    }

    @Test
    public void selectCourse() throws Exception {
        String id = "003";
        courseEntity course =  courseDAO.selectCourse(id);
        System.out.println(course.getId());
        System.out.println(course);
        /** 测试结果
         *  001
         *  courseEntity{id='003', name='gaoshu2', credit=null, nature='shuxue', department='xinyuan'}
         */
    }

    @Test
    public void selectAllCourse() throws Exception {
       List<courseEntity> courses = courseDAO.selectAllCourse();
        System.out.println(courses.size());
        for(int i = 0;i<courses.size();i++){
            System.out.println(courses.get(i));
        }
        /**  测试通过
         * 5
         * courseEntity{id='001', name='xiandai1', credit=2.5, nature='shuxue', department='xinyuan'}
         *courseEntity{id='002', name='gaoshu2', credit=0.0, nature='shuxue', department='xinyuan'}
         *courseEntity{id='008', name='xiaomdai6', credit=2.0, nature='xinxi', department='计科'}
         *courseEntity{id='009', name='kj', credit=0.0, nature='21', department='sadf'}
         *courseEntity{id='010', name='xxx', credit=2.0, nature='DD', department='DD'}
         *
         */

    }

}