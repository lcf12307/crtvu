package com.crtvu.web;

import com.crtvu.entity.Teacher;
import com.crtvu.service.EditTeacher;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by gao27024037 on 2017/3/25.
 */

@Controller //@Service @Component
@RequestMapping("/teacher")// url:模块/资源/{id}/细分
public class EditTeacherController {

    //日志记录
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private EditTeacher editTeacher;

    //查询的开始位置
    private int offset = 0;

    //查询的结束位置
    private int limit = 10;

    //查询到的列表长度值 取值1-10
    private int size;

    //跳转至首页的连接
    @RequestMapping(value = "/pagehome", method = RequestMethod.GET)
    public String pageHome(){
        offset = 0;
        limit = 10;
        return "redirect:/teacher/list";
    }

    //向上翻页
    @RequestMapping(value = "/pagedown", method = RequestMethod.GET)
    public String pageDown(){
        if(size == 10)
        {
        offset += 10;
        limit += 10;
        }
        return "redirect:/teacher/list";
    }

    //向下翻页
    @RequestMapping(value = "/pageup", method = RequestMethod.GET)
    public String pageUp(){
        if(offset - 10 >= 0) {
        offset -= 10;
        limit -= 10;
        }
        return "redirect:/teacher/list";
    }

    //教师列表展示首页
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        List<Teacher> list = editTeacher.getTeacherList(offset, limit);
        size = list.size();
        model.addAttribute("list", list);
        return "teacher/list";
    }

    //编辑页跳转
    @RequestMapping(value = "/{teacherId}/edit", method = RequestMethod.GET)
    public String edit(@PathVariable("teacherId") Long teacherId, Model model) {
        if (teacherId == null) {
            return "redirect:/teacher/list";
        }
        Teacher teacher = editTeacher.getInformation(teacherId);
        if (teacher == null) {
            return "forward:/teacher/list";
        }
        model.addAttribute("teacher", teacher);
        return "teacher/edit";
    }

    //修改教师信息
    @RequestMapping(value = "/updateInformation", method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Teacher updateInformation(@RequestBody Teacher teacher) {
        editTeacher.updateInformation(teacher);
        return teacher;
    }

    //根据ID删除教师
    @RequestMapping(value = "/{teacherId}/delete", method = RequestMethod.GET)
    public String delete(@PathVariable("teacherId") Long teacherId) {
        editTeacher.deleteById(teacherId);
        return "redirect:/teacher/list";
    }

    //增添教师，默认密码000000
    @RequestMapping(value = "/insert", method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Teacher insert(@RequestBody Teacher teacher) {
        teacher.setTeacherPassword("000000");
        editTeacher.insert(teacher);
        return teacher;
    }

    //跳转至增添教师页面
    @RequestMapping(value = "/insertPage" ,method = RequestMethod.GET)
    public String insertInfo(){
        return "teacher/insert";
    }


}
