package com.crtvu.web;

import com.crtvu.dto.courseJson;
import com.crtvu.dto.deleteJson;
import com.crtvu.entity.courseEntity;
import com.crtvu.service.courseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/course")
public class courseController {

    @Autowired
    private courseService courseService;

    @RequestMapping(value = "/{page}/list",method = RequestMethod.GET)
    public String list(Model model,@PathVariable("page") int page)
    {
        try{
            List<courseEntity> list = courseService.pagingCourse(page);
            int pages = courseService.page();
            model.addAttribute("list",list);
            model.addAttribute("pages",pages);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return "course/listCourse";
    }


    @RequestMapping(value = "/{courseId}/detail",method = RequestMethod.GET)
    public String detail(@PathVariable("courseId")String id, Model model)
    {
        if (id == null){
            return "redirect:/course/1/list";
        }

        try{
            courseEntity course = courseService.selectCourse(id);
            if (course == null){
                return "forward:/course/1/list";
            }
            model.addAttribute("course",course);
            return "course/detail";
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return  "student/index";
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public deleteJson delete(@RequestBody deleteJson deleteJson)
    {

        try{
            System.out.println(deleteJson.getId());
            courseService.deleteCourse(deleteJson.getId());
        }catch (Exception e){
            e.printStackTrace();
        }
        return deleteJson;
    }


    @RequestMapping(value = "/insertInfo" ,method = RequestMethod.GET)
    public String insertInfo(){
        return "course/insertCourse";
    }

    @RequestMapping(value = "/insert" ,method = RequestMethod.POST ,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public courseJson insert(@RequestBody courseJson course ){
            if(course.getCredit() == -1){
                courseEntity courseEntity = new courseEntity(course.getId(),course.getName(),course.getNature(),course.getDepartment());
                courseService.insertCourseNoCre(courseEntity);
            }else{
               courseEntity courseEntity = new courseEntity(course.getId(),course.getName(),course.getCredit(),course.getNature(),course.getDepartment());
                courseService.insertCourse(courseEntity);}
            if(courseService.selectCourse(course.getId()).getName().equals( course.getName()) )
                course.setSuccess(true);
            else{
                course.setError("id already exist!");
                course.setSuccess(false);
            }
        return course;
    }

    @RequestMapping(value = "/updatecourse" ,method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public courseJson updateCourse(@RequestBody courseJson course){
            if(course.getCredit() == -1){
                courseService.updateCourseNoCre(course.getName(),course.getNature(),course.getDepartment(),course.getId());
                return course;
            }
            courseService.updateCourse(course.getName(),course.getCredit(),course.getNature(),course.getDepartment(),course.getId());
            return course;
        }
        }

