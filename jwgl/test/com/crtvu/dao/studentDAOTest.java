package com.crtvu.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.crtvu.entity.studentEntity;
import com.crtvu.dao.studentDAO;
import javax.annotation.Resource;
import java.util.*;

/**
 * Created by lcf12 on 2017/3/19.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class studentDAOTest {

    //注入DAO实现类依赖
    @Resource
    private studentDAO studentDAO;

    @Test
    public void selectStudentById() throws Exception {
        long id = 1;
        studentEntity student=studentDAO.selectStudentById(id);
        System.out.println(student.getId());
        System.out.println(student);
        /** 测试结果
         *  1
         *  studentEntity{id=1, name='xioaming', className='jike1404', major='xinxi', password='123'}
         */
    }

    @Test
    public void insertStudent() throws Exception {
        long id=3;
        String name="xiaojian";
        String className="jike1404";
        String major = "xinxi";
        String password = "123";
        studentDAO.insertStudent(id,name,className,major,password);
        studentEntity student=studentDAO.selectStudentById(3);
        System.out.println(student.getId());
        System.out.println(student);
        /** 测试结果
         * 3
         *studentEntity{id=3, name='xiaojian', className='jike1404', major='xinxi', password='123'}
         */
    }

    @Test
    public void deleteStudentById() throws Exception {
        long id = 3;
        studentDAO.deleteStudentById(id);
        studentEntity student=studentDAO.selectStudentById(3);
        /**  测试结果
         *   能够删除数据
         *
         */
    }

    @Test
    public void updateStudentPassword() throws Exception {
        long id = 3;
        String password = "234";
        studentDAO.updateStudentPassword(id,password);
        studentEntity student=studentDAO.selectStudentById(3);
        System.out.println(student.getId());
        System.out.println(student);
        /**
         *  3
         *  studentEntity{id=3, name='xiaohai', className='jike1404', major='xinxi', password='234'}
         */
    }

    @Test
    public void updateStudent() throws Exception {
        long id=3;
        String name="xiaohai";
        String className="jike1404";
        String major = "xinxi";
        studentDAO.updateStudent(id,name,className,major);
        studentEntity student=studentDAO.selectStudentById(3);
        System.out.println(student.getId());
        System.out.println(student);
        /** 测试结果
         *  3
         *  studentEntity{id=3, name='xiaohai', className='jike1404', major='xinxi', password='123'}
         */

    }

    @Test
    public void selectAllStudent() throws Exception {
        List<studentEntity> student=studentDAO.selectAllStudent();
        System.out.println(student.size());
        for(int i = 0;i<student.size();i++){
            System.out.println(student.get(i));
        }
        /** 测试结果
         *  2
         *s tudentEntity{id=1, name='xioaming', className='jike1404', major='xinxi', password='null'}
         * studentEntity{id=2, name='xiaowei', className='1404', major='xinxi', password='123'}
         */
    }

}