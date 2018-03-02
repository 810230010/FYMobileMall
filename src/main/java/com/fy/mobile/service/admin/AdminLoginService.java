package com.fy.mobile.service.admin;

import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.UserLoginDTO;
import com.fy.mobile.mapper.admin.AdminLoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminLoginService {
    @Autowired
    private AdminLoginMapper adminLoginMapper;
    /**
     * 检验登录
     * @param username
     * @param password
     * @return
     */
    public RestResult checkLogin(String username, String password){
        RestResult result = new RestResult();
        UserLoginDTO check = adminLoginMapper.findByUsernameAndPassword(username, password);
        if(check == null){
            return result.error("用户不存在!");
        }
        return result.ok("登录成功!");
    }
}
