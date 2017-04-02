package com.crtvu.service.implementation;

import com.crtvu.dao.TeacherDao;
import com.crtvu.entity.Teacher;
import com.crtvu.service.EditTeacher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.List;

/**
 * Created by gao27024037 on 2017/3/24.
 */
@Service
public class EditTeacherImpl implements EditTeacher {

    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TeacherDao teacherDao;

    //加入一个混淆字符串(秒杀接口)的salt，为了我避免用户猜出我们的md5值，值任意给，越复杂越好
    private final String slat="1>#@42!dw1E?#sffffffsF@F#$4!@#2";

    //根据偏移量值获取教师列表 偏移量：用于翻页
    public List<Teacher> getTeacherList(int offset, int limit) {
        return teacherDao.queryAll(offset, limit);
    }

    //根据ID获取教师信息
    public Teacher getInformation(long teacherId) {
        return teacherDao.queryById(teacherId);
    }

    //修改教师信息
    public int updateInformation(Teacher teacher) {
        teacher.setTeacherPassword(getMD5(teacher.getTeacherPassword()));
        return teacherDao.updateTeacher(teacher);
    }

    //MD5加密算法
    public String getMD5(String teacherPassword) {
        String base = teacherPassword + "/" + slat;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
    }

    //根据ID删除教师
    public int deleteById(long teacherId) {
        return teacherDao.deleteById(teacherId);
    }

    //增添新教师
    public int insert(Teacher teacher) {
        teacher.setTeacherPassword(getMD5(teacher.getTeacherPassword()));
        return teacherDao.insertTeacher(teacher);
    }
}
