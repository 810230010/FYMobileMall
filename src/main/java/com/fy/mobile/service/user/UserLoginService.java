package com.fy.mobile.service.user;

import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.UserForUpdate;
import com.fy.mobile.entity.user.UserRegisterDTO;
import com.fy.mobile.mapper.user.UserLoginMapper;
import com.fy.mobile.entity.user.UserLoginDTO;
import com.fy.mobile.util.DateUtil;
import com.fy.mobile.util.DigestUtil;
import com.fy.mobile.util.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class UserLoginService {
    @Autowired
    private UserLoginMapper userLoginMapper;
    @Autowired
    private HttpServletRequest request;

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

    /**
     * 修改个人信息
     */
    public RestResult editBasicInfo(UserForUpdate userForUpdate){
        RestResult result = new RestResult();
        String password = userForUpdate.getOldPassword();
        UserLoginDTO login = WebUtil.findUserInSession(request);
        if(login == null)
            throw new RuntimeException("请登录");
        Integer userId = login.getUserId();
        try {
            String encrypted = DigestUtil.encryptSHA(password);
            UserLoginDTO loginDTO = userLoginMapper.findByUserId(userId, encrypted);
            if(loginDTO == null){
                return result.error("密码不正确");
            }
            userForUpdate.setUserId(userId);
            userForUpdate.setNewPassword(loginDTO.getPassword());
            String newPass = DigestUtil.encryptSHA(userForUpdate.getNewPassword());
            userForUpdate.setNewPassword(newPass);
            userLoginMapper.updateUserInfo(userForUpdate);
            if(!userForUpdate.getNewPassword().equals(userForUpdate.getOldPassword())){
                WebUtil.logout(request);
                return result.ok(1);
            }
            return result.ok();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 获取某人统计信息
     * @param userId
     * @return
     */
    public Map getPersonAnalys(Integer userId){
        Map<String, Object> result = new HashMap<>();
        //所有闲置数
        Integer sellCount = userLoginMapper.getTotalSellCount(userId);
        //需求总数
        Integer needCount = userLoginMapper.getTotalNeedCount(userId);
        //卖出总数
        Integer sellSuccessCount = userLoginMapper.getTotalSellSuccessCount(userId);
        //买入总数
        Integer buyCount = userLoginMapper.getTotalBuyCount(userId);

        result.put("sellCount", sellCount);
        result.put("needCount", needCount);
        result.put("sellSuccessCount", sellSuccessCount);
        result.put("buyCount", buyCount);

        return result;
    }
}
