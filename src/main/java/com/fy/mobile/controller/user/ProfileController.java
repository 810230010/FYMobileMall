package com.fy.mobile.controller.user;

import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.UserForUpdate;
import com.fy.mobile.service.user.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/profile")
public class ProfileController {
    @Autowired
    private UserLoginService userLoginService;
    /**
     * 个人基本信息页面
     * @return
     */
    @RequestMapping("/page/myBasicProfileInfo")
    public String viewToBasicProfile(){
        return "/user/profile/profile-info";
    }

    /**
     * 编辑个人信息页面
     */
    @RequestMapping("/page/editBasicInfo")
    public String viewToEditBasicInfo(Model model){
        return "/user/profile/edit-basic-info";
    }

    /**
     * 修改个人基本信息
     * @param userForUpdate
     * @return
     */
    @RequestMapping("/editBasicInfo")
    @ResponseBody
    public Object editBasicInfo(UserForUpdate userForUpdate){
        return userLoginService.editBasicInfo(userForUpdate);
    }

    public String viewToMySellItems(){
        return "/user/profile/my-sell-item";
    }
}
