package com.fy.mobile.controller.user;

import com.fy.mobile.entity.user.UserLoginDTO;
import com.fy.mobile.util.QiniuUtil;
import com.fy.mobile.util.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
@ControllerAdvice(basePackages = {"com.fy.mobile.controller"})
public class GlobalHandlerController {
    @ModelAttribute("tokenInfo")
    public Map<String, String> setTokenInfi(){
        Map<String, String> tokenInfo = QiniuUtil.getQiniuTokenInfo();
        return tokenInfo;
    }
    @ModelAttribute("currentUser")
    public UserLoginDTO setLoginedUser(HttpServletRequest request){
        UserLoginDTO user = WebUtil.findUserInSession(request);
        return user;
    }
}
