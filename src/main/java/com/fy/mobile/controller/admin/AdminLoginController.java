package com.fy.mobile.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 管理员登录模块controller
 */
@Controller
@RequestMapping("/")
public class AdminLoginController {

    @RequestMapping(value = {"page/login", ""})
    public String viewToLogin(){
        return "login";
    }
}
