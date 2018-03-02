package com.fy.mobile.controller.admin;

import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.service.admin.AdminLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 管理员登录模块controller
 */
@Controller
@RequestMapping("/admin")
public class AdminLoginController {
    @Autowired
    private AdminLoginService adminLoginService;
    /**
     * 后台管理登录页面
     * @return
     */
    @RequestMapping(value = {"/login"})
    public String viewToLogin(){
        return "/admin/login";
    }

    /**
     * 检验登录
     * @param username
     * @param password
     * @return
     */
    @RequestMapping("/checkLogin")
    public Object checkLogin(String username, String password){
        RestResult result = new RestResult();
        return adminLoginService.checkLogin(username, password);
    }
}