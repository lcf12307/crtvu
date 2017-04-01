package com.crtvu.web;

/**
 * Created by lcf12 on 2017/3/17.
 */
import com.crtvu.dto.Manager.deletejson;
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

    @RequestMapping(value = "/delete",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public deletejson delete(@RequestBody deletejson deletejson)
    {
           studentService.deleteStudent(deletejson.getId());

       return deletejson;
    }

    @RequestMapping(value = "/insertInfo" ,method = RequestMethod.GET)
    public String insertInfo(){
        return "insertStudent";
    }

    @RequestMapping(value = "/insert" ,method = RequestMethod.POST ,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public studentJson insert(@RequestBody studentJson student ){

             studentEntity studentEntity = new studentEntity(student.getId(),student.getName(),student.getClassName(),student.getMajor(),student.getPassword());
               studentService.insertStudent(studentEntity);
               if(studentService.selectStudent(student.getId()).getName() .equals(student.getName())  )
               {
                   student.setSuccess(true);
               }
               else{
                   student.setError("id already exist!");
                   student.setSuccess(false);
               }
                 return student;
    }

    @RequestMapping(value = "/updatestudent" ,method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public studentJson updateStudent(@RequestBody studentJson student){
            studentService.updateStudent(student.getId(),student.getName(),student.getClassName(),student.getMajor());
            return student;
    }

    @RequestMapping(value = "/changepassword" ,method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public passwordJson changePassword(@RequestBody passwordJson passwordJson){
           studentService.updateStudentPassword(passwordJson.getId(),passwordJson.getOldPassword(),passwordJson.getNewPassword());
           return passwordJson;

    }
}
