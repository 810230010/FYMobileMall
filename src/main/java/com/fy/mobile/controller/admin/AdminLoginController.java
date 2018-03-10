package com.fy.mobile.controller.admin;

import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.service.admin.AdminLoginService;
import com.fy.mobile.util.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
    @RequestMapping("/login/checkLogin")
    @ResponseBody
    public Object checkLogin(String username, String password){
        RestResult result = new RestResult();
        return adminLoginService.checkLogin(username, password);
    }

    /**
     * 后台首页
     * @return
     */
    @RequestMapping("/page/index")
    public String viewToAdminIndex(){
        return "/admin/index";
    }
    @RequestMapping("/login/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response){
        WebUtil.logout(request);
        try {
            response.sendRedirect("/admin/login");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}