package com.fy.mobile.service.user;

import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.UserRegisterDTO;
import com.fy.mobile.mapper.user.UserLoginMapper;
import com.fy.mobile.entity.user.UserLoginDTO;
import com.fy.mobile.util.DateUtil;
import com.fy.mobile.util.DigestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserLoginService {
    @Autowired
    private UserLoginMapper userLoginMapper;

    /**
     * 检验用户登录
     * @param userLoginDTO
     * @return
     */
    public UserLoginDTO checkUserlogin(UserLoginDTO userLoginDTO){
        try {
            String encryptedPass = DigestUtil.encryptSHA(userLoginDTO.getPassword());
            userLoginDTO.setPassword(encryptedPass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userLoginMapper.getUserByUsernameAndPassword(userLoginDTO);
    }

    public RestResult registerUser(UserRegisterDTO registerDTO){
        RestResult result = new RestResult();
        //1. 检查手机号是否注册。
        String tel = userLoginMapper.getTelAndCheck(registerDTO.getTel());
        if(tel != null){
            RestResult r = new RestResult(700, "该手机号已注册！");
            return r;
        }
        //2. 检查用户名是否存在。
        String nickname = userLoginMapper.getNicknameAndCheck(registerDTO.getNickname());
        if(nickname != null){
            RestResult r = new RestResult(701, "该昵称已存在！");
            return r;
        }
        //如果手机号和用户名均未注册过，执行注册。
        String now = (String)DateUtil.createDateWithFormat(Date.class, String.class, new Date(), "yyyy-MM-dd");
        registerDTO.setCreateTime(now);
        try {
            String encryptedPass = DigestUtil.encryptSHA(registerDTO.getPassword());
            registerDTO.setPassword(encryptedPass);
            int affected = userLoginMapper.insertUser(registerDTO);
            return new RestResult().ok();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
