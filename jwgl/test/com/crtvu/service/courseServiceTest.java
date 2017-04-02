package com.crtvu.service;

import com.crtvu.entity.courseEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;


/**
 * Created by yangming on 2017/3/21/0021.
 */
 @RunWith(SpringJUnit4ClassRunner.class)
 @ContextConfiguration({"classpath:spring/spring-dao.xml",
         "classpath:spring/spring-service.xml"})
public class courseServiceTest {
     @Resource
    private courseService courseService;

    @Test
    public void pagingCourse() throws Exception {
        int page = 1;
        List<courseEntity> course = courseService.pagingCourse(page);
        if(course == null){
            System.out.println("fail");
        }   else{
            System.out.println(course.size());
            for(int i = 0;i<course.size();i++){
                System.out.println(course.get(i));
            }
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

    @Test
    public void selectCourse() throws Exception {
        String id = "003";
        courseEntity courseEntity = new courseEntity(id,"haha","shuxue","asjdfj");
        System.out.println(courseEntity.getCredit());
        System.out.println(courseEntity);
        /** 测试结果
         *  001
         *  courseEntity{id='003', name='haha', credit=null, nature='shuxue', department='asjdfj'}
         */
    }

    @Test
    public void insertCourse() throws Exception {
       String id ="003";
        String name="xiaomdai4";
        float credit = 2.0f;
        String nature = "xinxi";
        String department = "计科";
        courseEntity course = new courseEntity(id,name,credit,nature,department);
        courseService.insertCourse(course);
        courseEntity courseEntity = courseService.selectCourse(id);
        System.out.println(courseEntity.getId());
        System.out.println(courseEntity);
        /**
         * 003
         * courseEntity{id='003', name='xiaomdai4', credit=2.0, nature='xinxi', department='计科'}
         */
         }

    @Test
    public void insertCourseNoCre() throws Exception {
        String id ="004";
        String name="xiaomdai4";

        String nature = "xinxi";
        String department = "计科";
        courseEntity course = new courseEntity(id,name,nature,department);
        courseService.insertCourseNoCre(course);
        courseEntity courseEntity = courseService.selectCourse(id);
        System.out.println(courseEntity.getId());
        System.out.println(courseEntity);
        /**
         * 004
         * courseEntity{id='004', name='xiaomdai4', credit=0.0, nature='xinxi', department='计科'}
         */


    }

    @Test
    public void deleteCourse() throws Exception {
       String id = "004";
       courseService.deleteCourse(id);
        /**
         * 测试通过
         * 数据删除成功
         */
    }

    @Test
    public void updateCourse() throws Exception {
        String id = "001";
        String name = "xiandai1";
        float credit = (float) 3.5;
        String nature = "shuxue";
        String department = "xinyuan";
        courseService.updateCourse(name,credit,nature,department,id);
        courseEntity courseEntity = courseService.selectCourse(id);
        System.out.println(courseEntity.getId());
        System.out.println(courseEntity);
        /**
         * 001
         * courseEntity{id='001', name='xiandai1', credit=3.5, nature='shuxue', department='xinyuan'}
         */

    }
    @Test
    public void updateCourseNoCre() throws Exception {
        String id = "001";
        String name = "xiandai1";
        String nature = "shuxue";
        String department = "xinyuan";
        courseService.updateCourseNoCre(name,nature,department,id);
        courseEntity courseEntity = courseService.selectCourse(id);
        System.out.println(courseEntity.getId());
        System.out.println(courseEntity);
        /**
         * 001
         * courseEntity{id='001', name='xiandai1', credit=0.0, nature='shuxue', department='xinyuan'}
         */

    }

}