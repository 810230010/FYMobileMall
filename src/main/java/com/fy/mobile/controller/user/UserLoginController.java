package com.fy.mobile.controller.user;

import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.UserLoginDTO;
import com.fy.mobile.entity.user.UserRegisterDTO;
import com.fy.mobile.service.user.UserLoginService;
import com.fy.mobile.util.WebUtil;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**普通用户登陆模块
 * Created by usher on 2018/1/24.
 */
@Controller
@RequestMapping("/user")
public class UserLoginController {
    @Autowired
    private UserLoginService userLoginService;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpServletResponse response;

    /**
     * 用户登录验证
     * @param userLoginDTO
     * @return
     */
    @GetMapping("/login/check")
    @ResponseBody
    public RestResult checkResult(UserLoginDTO userLoginDTO){
        RestResult result = new RestResult();
        UserLoginDTO check = userLoginService.checkUserlogin(userLoginDTO);
        if(check != null){
            WebUtil.storeLoginedUser(request, check);
            return result.ok("登陆成功",  check.getNickname());
        }
        return result.error("登录失败，用户名或密码出错!");
    }

    /**
     * 注册
     * @param userRegisterDTO
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public RestResult registerUser(UserRegisterDTO userRegisterDTO){
        RestResult result = userLoginService.registerUser(userRegisterDTO);
        return result;
    }

    /**
     * 获取登录信息
     * @return
     */
    @RequestMapping("/loginInfo")
    @ResponseBody
    public RestResult getUserLoginInfo(){
        UserLoginDTO loginDTO = WebUtil.findUserInSession(request);
        if(loginDTO == null)
            return new RestResult().ok();
        return new RestResult().ok(loginDTO.getNickname());
    }

    @RequestMapping("/logout")
    public String logout(){
        WebUtil.logout(request);
        return "redirect:/page/index";
    }
}
