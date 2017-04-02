package com.crtvu.service;

import com.crtvu.dao.TeacherDao;
import com.crtvu.entity.Teacher;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by gao27024037 on 2017/3/28.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml",
                        "classpath:spring/spring-service.xml"})
public class EditTeacherTest {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private EditTeacher editTeacher;

    @Test
    public void getTeacherList() throws Exception {
        List<Teacher> list = editTeacher.getTeacherList(0,10);
        logger.info("list={}", list);
        }

    @Test
    public void getInformation() throws Exception {
        long id = 1232560000;
        Teacher teacher = editTeacher.getInformation(id);
        logger.info("information={}",teacher);
    }

    @Test
    public void updateInformation() throws Exception {
        Teacher teacher=new Teacher(1212560000L,"gyl2","讲师","01110");
        System.out.println(teacher);
        editTeacher.updateInformation(teacher);
    }

    @Test
    public void getMD5() throws Exception {

    }

    @Test
    public void insertInformation() throws Exception {
        Teacher teacher=new Teacher(1111122022L,"gylsa","哈哈","0023000");
        teacher.setTeacherPassword("000000");
        System.out.println(teacher);
        editTeacher.insert(teacher);
    }

}