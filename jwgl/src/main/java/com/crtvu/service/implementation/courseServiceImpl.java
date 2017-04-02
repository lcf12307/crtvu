package com.crtvu.service.implementation;

import com.crtvu.entity.courseEntity;
import com.crtvu.service.courseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.crtvu.dao.courseDAO;
import org.springframework.util.DigestUtils;

import java.util.List;
/**
 * Created by yangming on 2017/3/16/0016.
 */
@Service
public class courseServiceImpl implements courseService {
    //日志对象
    private Logger logger= LoggerFactory.getLogger(this.getClass());

    @Autowired
    private courseDAO courseDAO;

    public List<courseEntity> pagingCourse ( int page) {
        List<courseEntity> list = courseDAO.selectAllCourse();
        List<courseEntity> coursepage;
        if(list.size() / 10 + 1 < page && page < 1)
            return null;
        if(page == list.size() / 10 + 1){
            coursepage = list.subList((page - 1) * 10 ,list.size() % 10 + (page - 1) * 10);
        } else {
            coursepage = list.subList((page - 1) * 10 ,page * 10 );
        }

        return coursepage;
    }
    public int page() {
        List<courseEntity> list = courseDAO.selectAllCourse();
        return (list.size()/10)+1;
    }



    public courseEntity selectCourse(String id) {
        return courseDAO.selectCourse(id);
    }

    public void insertCourse(courseEntity course) {
        courseDAO.insertCourse(course.getId(),course.getName(),course.getCredit(),course.getNature(),course.getDepartment());
    }

    public void insertCourseNoCre(courseEntity course) {
        courseDAO.insertCourseNoCre(course.getId(),course.getName(),course.getNature(),course.getDepartment());
    }

    public void deleteCourse(String id) {
        courseDAO.deleteCourse(id);
    }

    public void updateCourse( String name, Float credit, String nature, String department,String id) {
        courseDAO.updateCourse(name,credit,nature,department,id);
    }
    public void updateCourseNoCre( String name, String nature, String department,String id) {
        courseDAO.updateCourseNoCre(name,nature,department,id);
    }

}
