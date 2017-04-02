package com.crtvu.dao;

import com.crtvu.entity.Teacher;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by gao27024037 on 2017/3/18.
 */

/**
 * 配置sprint和junit整合，junit启动时加载springIOC容器
 * sprint-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class TeacherDaoTest {

    //注入Dao实现类依赖
    @Autowired
    private  TeacherDao teacherDao;

    @Test
    public void testQueryAll() throws Exception {
        List<Teacher> teachers=teacherDao.queryAll(0,10);
        for (Teacher teacher : teachers) {
            System.out.println(teacher);
        }
    }

    @Test
    public void testInsertTeacher() throws Exception {
        Teacher teacher=new Teacher(1111117899L,"gylsa","哈哈","0023000");
        teacherDao.insertTeacher(teacher);
        System.out.println(teacher.getTeacherId());
    }

    @Test
    public void testDeleteById() throws Exception {
        Teacher teacher=new Teacher(1232560000L,null,null,null);
        teacherDao.deleteById(teacher.getTeacherId());
    }

    @Test
    public void testUpdateTeacher() throws Exception {
        Teacher teacher=new Teacher(1212560000L,"gyl1","讲师","00100");
        teacherDao.updateTeacher(teacher);
    }
    @Test
    public void testQueryById() throws Exception {
        long id = 1232560000;
        Teacher teacher=teacherDao.queryById(id);
        System.out.println(teacher.getTeacherName());
        System.out.println(teacher);
    }

}