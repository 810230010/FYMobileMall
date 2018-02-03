package com.fy.mobile.controller.user;

import com.fy.mobile.util.QiniuUtil;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.Map;
@ControllerAdvice(basePackages = {"com.fy.mobile.controller"})
public class GlobalHandlerController {
    @ModelAttribute("tokenInfo")
    public Map<String, String> setTokenInfi(){
        Map<String, String> tokenInfo = QiniuUtil.getQiniuTokenInfo();
        return tokenInfo;
    }
}
