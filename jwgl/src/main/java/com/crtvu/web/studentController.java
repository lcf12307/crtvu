package com.crtvu.web;

/**
 * Created by lcf12 on 2017/3/17.
 */
import com.crtvu.dto.Manager.passwordJson;
import com.crtvu.dto.Manager.studentJson;
import com.crtvu.entity.studentEntity;
import com.crtvu.service.studentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/student")
public class studentController {

    @Autowired
    private studentService studentService;

    @RequestMapping(value = "/{page}/list",method = RequestMethod.GET)
    public String list(Model model,@PathVariable("page") int page)
    {
        try{
            List<studentEntity> list=studentService.pagingStudent(page);
            int pages = studentService.page();
            model.addAttribute("list",list);
            model.addAttribute("pages",pages);
        }
        catch(Exception e){
            e.printStackTrace();
    }
        return "list";
    }

    @RequestMapping(value = "/{studentId}/detail",method = RequestMethod.GET)
    public String detail(@PathVariable("studentId") Long id, Model model)
    {
        if (id == null){
            return "redirect:/student/1/list";
        }

        try{
            studentEntity student=studentService.selectStudent(id);
            if (student == null){
                return "forward:/student/1/list";
            }
            model.addAttribute("student",student);
            return "detail";
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return  "index";
    }

    @RequestMapping(value = "/{studentId}/delete",method = RequestMethod.POST)
    public void delete(@PathVariable("studentId") Long id)
    {

        //TODO 如果没有对应ID的同学，需返回无该同学
       try{
           studentService.deleteStudent(id);
       }catch (Exception e){
            e.printStackTrace();
       }
    }

    @RequestMapping(value = "/insertInfo" ,method = RequestMethod.GET)
    public String insertInfo(){
        return "insertStudent";
    }

    @RequestMapping(value = "/insert" ,method = RequestMethod.POST)
    @ResponseBody
    public String insert(@RequestBody studentJson student){
       try {
           studentEntity studentEntity = new studentEntity(student.getId(),student.getName(),student.getClassName(),student.getMajor(),student.getPassword());
           studentService.insertStudent(studentEntity);
           return "sucess";
       }catch (Exception e){
           e.printStackTrace();
       }
       return "index";
    }

    @RequestMapping(value = "/updatestudent" ,method = RequestMethod.POST)
    @ResponseBody
    public String updateStudent(@RequestBody studentJson student){
        try {
            studentService.updateStudent(student.getId(),student.getName(),student.getClassName(),student.getMajor());
            return "sucess";
        }catch (Exception e){
            e.printStackTrace();
        }
        return "index";
    }

    @RequestMapping(value = "/changepassword" ,method = RequestMethod.POST)
    @ResponseBody
    public String changePassword(@RequestBody passwordJson passwordJson){
       try {
           studentService.updateStudentPassword(passwordJson.getId(),passwordJson.getOldPassword(),passwordJson.getNewPassword());
           return "forward:/student/1/list";
       }
       catch (Exception e){
           e.printStackTrace();
       }
       return passwordJson.toString();
    }
}
