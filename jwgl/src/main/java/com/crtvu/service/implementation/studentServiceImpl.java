package com.crtvu.service.implementation;

import com.crtvu.entity.studentEntity;
import com.crtvu.service.studentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.crtvu.dao.studentDAO;
import org.springframework.util.DigestUtils;

import java.util.List;

/**
 * Created by lcf12 on 2017/3/17.
 */
@Service
public class studentServiceImpl implements studentService {

    //日志对象
    private Logger logger= LoggerFactory.getLogger(this.getClass());

    //加入一个混淆字符串(秒杀接口)的salt，为了我避免用户猜出我们的md5值，值任意给，越复杂越好
    private final String salt="shsdssljdd'l.";

    @Autowired
    private studentDAO studentDAO;

    public List<studentEntity> pagingStudent ( int page) {
        List<studentEntity> list = studentDAO.selectAllStudent();
        List<studentEntity> studentpage;
        if(list.size() / 10 + 1 < page && page < 1)
            return null;
        if(page == list.size() / 10 + 1){
            studentpage = list.subList((page - 1) * 10 ,list.size() % 10 + (page - 1) * 10);
        } else {
            studentpage = list.subList((page - 1) * 10 ,page * 10 );
        }

        return studentpage;
    }

    public studentEntity selectStudent(long id)  {
        return studentDAO.selectStudentById(id);
    }

    public boolean samePasswor(String newPasswor, String password) {
        if(getMD5(newPasswor).equals(password)){
            return true;
        }
        return false;
    }

    public int page() {
        List<studentEntity> list = studentDAO.selectAllStudent();
        return (list.size()/10)+1;
    }

    public void insertStudent(studentEntity student) {
        String md5=getMD5(student.getPassword());
        studentDAO.insertStudent(student.getId(),student.getName(),student.getClassName(),student.getMajor(),md5);
    }

    public void deleteStudent(long id){
        studentDAO.deleteStudentById(id);
    }

    public void updateStudent(long id, String name, String className, String major){
        studentDAO.updateStudent(id,name,className,major);
    }

    public void updateStudentPassword(long id, String newPassword) {
        studentEntity studentEntity = studentDAO.selectStudentById(id);
        String md5;
        md5=getMD5(newPassword);
        studentDAO.updateStudentPassword(id,md5);
    }

    private String getMD5(String password)
    {
        String base = password+"/"+salt;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
    }
}
