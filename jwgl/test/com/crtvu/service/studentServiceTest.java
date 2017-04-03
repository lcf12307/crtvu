package com.crtvu.service;

import com.crtvu.entity.studentEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by lcf12 on 2017/3/20.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml"})
public class studentServiceTest {



    //注入DAO实现类依赖
    @Resource
    private studentService studentService;

    @Test
    public void updateStudentPassword1() throws Exception {
        long id = 3;
        String password = "246";
        studentService.updateStudentPassword(id,password);
        studentEntity studentEntity = studentService.selectStudent(id);
        System.out.println(studentEntity.getId());
        System.out.println(studentEntity);
        /** 测试结果
         *  3
         * studentEntity{id=3, name='xiaojian', className='jike1404', major='xinxi', password='becc9767304e19dcca8c2e45d7378649'}
         */

    }

    @Test
    public void pagingStudent() throws Exception {
        int page = 1;
        List<studentEntity> student=studentService.pagingStudent(page);
        if(student == null){
            System.out.println("fail");
        }   else{
            System.out.println(student.size());
            for(int i = 0;i<student.size();i++){
                System.out.println(student.get(i));
            }
        }

        /**  测试结果
         *  3
         *  studentEntity{id=1, name='xioaming', className='jike1404', major='xinxi', password='123'}
         *  studentEntity{id=2, name='xiaowei', className='1404', major='xinxi', password='123'}
         *  studentEntity{id=3, name='xiaojian', className='jike1404', major='xinxi', password='5cd9b91615970e157f4637645375b74c'}
         */
    }

    @Test
    public void insertStudent1() throws Exception {
        long id = 3;
        String name="xiaojian";
        String className="jike1404";
        String major = "xinxi";
        String password = "123";
        studentEntity student = new studentEntity(id,name,className,major,password);
        studentService.insertStudent(student);
        studentEntity studentEntity = studentService.selectStudent(id);
        System.out.println(studentEntity.getId());
        System.out.println(studentEntity);
        /** 测试结果
         * 3
         * studentEntity{id=3, name='xiaojian', className='jike1404', major='xinxi', password='5cd9b91615970e157f4637645375b74c'}
         *
         */
    }

    @Test
    public void selectStudent() throws Exception {
        long id = 1;
        studentEntity studentEntity = studentService.selectStudent(id);
        System.out.println(studentEntity.getId());
        System.out.println(studentEntity);
        /** 测试结果
         *  1
         *  studentEntity{id=1, name='xioaming', className='jike1404', major='xinxi', password='123'}
         *
         */
    }



    @Test
    public void deleteStudent() throws Exception {
        long id = 3;
        studentService.deleteStudent(3);
        studentEntity studentEntity = studentService.selectStudent(id);
        /**  测试结果
         *  能够删除数据
         *
         */
    }

    @Test
    public void updateStudent() throws Exception {
        long id = 3;
        String name="xiaojian";
        String className="jike1404";
        String major = "xinxi";
        studentService.updateStudent(id,name,className,major);
        studentEntity studentEntity = studentService.selectStudent(id);
        System.out.println(studentEntity.getId());
        System.out.println(studentEntity);
        /**  测试结果
         *   3
         *   studentEntity{id=3, name='xiaojian', className='jike1404', major='xinxi', password='5cd9b91615970e157f4637645375b74c'}
         */
    }


}