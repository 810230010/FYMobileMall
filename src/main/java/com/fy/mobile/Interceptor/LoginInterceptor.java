package com.fy.mobile.Interceptor;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by usher on 2018/3/10.
 */
public class LoginInterceptor implements HandlerInterceptor {
    private static Logger logger = LogManager.getLogger(LoginInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session = httpServletRequest.getSession();
        if(session.getAttribute("loginedUser") == null){
            String path = httpServletRequest.getServletPath();
            String contextPath = httpServletRequest.getContextPath();
            if(!path.contains("admin/login")){
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/admin/login");
            }else{
                return true;
            }
            return false;
        }else{
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
