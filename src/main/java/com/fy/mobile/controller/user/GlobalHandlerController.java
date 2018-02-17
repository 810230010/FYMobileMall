package com.fy.mobile.controller.user;

import com.fy.mobile.entity.user.UserLoginDTO;
import com.fy.mobile.mapper.user.UserLoginMapper;
import com.fy.mobile.service.user.UserLoginService;
import com.fy.mobile.util.QiniuUtil;
import com.fy.mobile.util.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
@ControllerAdvice(basePackages = {"com.fy.mobile.controller"})
public class GlobalHandlerController {
    @Autowired
    private UserLoginService userLoginService;
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
    @ModelAttribute("analysis")
    public Map setPersonAnalysis(HttpServletRequest request){
        Map<String, Object> result = new HashMap<>();
        result.put("sellCount", 0);
        result.put("needCount", 0);
        result.put("sellSuccessCount", 0);
        result.put("buyCount", 0);
        result.put("nickname", "未登录");
        result.put("tel", "无");
        UserLoginDTO user = WebUtil.findUserInSession(request);
        if(user == null)
            return result;
        Integer userId = user.getUserId();
        result = userLoginService.getPersonAnalys(userId);
        result.put("nickname", user.getNickname());
        result.put("tel", user.getTel());
        return result;
    }
}
