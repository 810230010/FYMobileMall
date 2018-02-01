package com.fy.mobile.controller.user;

import com.fy.mobile.entity.user.UserLoginDTO;
import com.fy.mobile.service.user.buy.BuyService;
import com.fy.mobile.util.QiniuUtil;
import com.fy.mobile.util.WebUtil;
import org.apache.catalina.core.ApplicationContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private BuyService buyService;
    /**
     * 首页
     * @return
     */
    @RequestMapping(value = {"", "page/index"})
    public String viewToIndex(Model model){
        Map<String, String> tokenMap = QiniuUtil.getQiniuTokenInfo();
        model.addAttribute("tokenInfo", tokenMap);
        UserLoginDTO loginDTO = WebUtil.findUserInSession(request);
        model.addAttribute("currentUser", loginDTO);
        model.addAttribute("buyNeeds", buyService.listTop8BuyNeeds());
        return "/user/index";
    }
}
