package com.crtvu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by lcf12 on 2017/3/22.
 */
@Controller
public class MainController {
    @RequestMapping("/")
    public String returnMainPage() {
        return "redirect:/index";
    }
    @RequestMapping("/index")
    public String getMainPage() {
        return "backup/student/index";
    }
}
