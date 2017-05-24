package com.crtvu.service;

import com.crtvu.dto.teacher.StuGrade;
import com.crtvu.dto.teacher.TeacherAllCourse;
import com.crtvu.dto.teacher.UpdateGrade;
import com.crtvu.entity.SelectCourseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface TeacherGradeService {
    /**
     *
     * @param teacherId
     * @return
     */
    TeacherAllCourse showTeacherAllCourseInfo(int teacherId);

    /**
     * 根据id查询课程
     * @param openId
     * @return
     */
    List<SelectCourseEntity> queryCourseByOpenid(int openId);

    /**
     * 根据开设ID得到学生成绩集合
     * @param openId
     * @return
     */
    List<StuGrade> getStudentGrade(int openId);

    /**
     * 提交学生成绩
     * @param updateGradeList
     */
    int updateGrade(List<UpdateGrade> updateGradeList);

    /**
     * 先判断是否有资格下载
     * type = "grade"代表下载成绩汇总，type="gradeDemo"为下载学生名单
     * @param teacherId
     * @param openId
     */
    String download(int teacherId, int openId,String type);

    Map<String, Object> readNetworkExcel(MultipartFile file, int openId) throws IOException;

    /**
     * 当前时间比学期结束时间晚15天返回ture，表示成绩修改时间截止
     * @param openId
     * @return
     */
    String getIsOver(int openId);
}
