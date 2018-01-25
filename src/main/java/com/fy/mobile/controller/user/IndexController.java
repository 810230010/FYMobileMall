package com.fy.mobile.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {
    /**
     * 首页
     * @return
     */
    @RequestMapping(value = {"", "page/index"})
    public String viewToIndex(){
        return "user/index";
    }
}
