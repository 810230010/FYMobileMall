package com.fy.mobile.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**普通用户登陆模块
 * Created by usher on 2018/1/24.
 */
@Controller
@RequestMapping("/user")
public class UserLoginController {
    /**
     * 普通用户登录页面
     * @return
     */
    @RequestMapping(value = {"/login", ""})
    public String viewToUserLoginPage(){
        return "login";
    }
}
