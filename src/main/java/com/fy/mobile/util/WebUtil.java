package com.fy.mobile.util;

import com.fy.mobile.entity.user.UserLoginDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class WebUtil {
    /**
     * 查找登陆过的用户
     * @param request
     * @return
     */
    public static UserLoginDTO findUserInSession(HttpServletRequest request){
        UserLoginDTO loginDTO = (UserLoginDTO) request.getSession()
                .getAttribute("loginedUser");
        return loginDTO;
    }

    /**
     * 注销
     * @param request
     */
    public static void logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
    }

    /**
     * 用户登录成功将用户信息存储到session
     * @param request
     * @param loginDTO
     */
    public static void storeLoginedUser(HttpServletRequest request, UserLoginDTO loginDTO){
        HttpSession session = request.getSession();
        session.setAttribute("loginedUser", loginDTO);
        session.setMaxInactiveInterval(60 * 60);
    }
}
