package com.fy.mobile.mapper.user;

import com.fy.mobile.entity.user.UserLoginDTO;
import com.fy.mobile.entity.user.UserRegisterDTO;
import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface UserLoginMapper {
    /**
     * 普通用户登录验证
     * @return
     */
    UserLoginDTO getUserByUsernameAndPassword(UserLoginDTO userLoginDTO);

    /**
     * 检验手机号是否注册
     * @param tel
     * @return
     */
    String getTelAndCheck(String tel);

    /**
     * 检验用户名是否存在
     * @param nickname
     * @return
     */
    String getNicknameAndCheck(String nickname);

    /**
     * 添加用户
     * @param registerDTO
     * @return
     */
    int insertUser(UserRegisterDTO registerDTO);
}
