package com.fy.mobile.mapper.user;

import com.fy.mobile.entity.user.UserForUpdate;
import com.fy.mobile.entity.user.UserLoginDTO;
import com.fy.mobile.entity.user.UserRegisterDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

    /**
     * 根据userId查询
     * @param userId
     * @return
     */
    UserLoginDTO findByUserId(@Param("userId") Integer userId, @Param("password") String password);

    /**
     * 修改用户信息
     * @param userForUpdate
     */
    void updateUserInfo(UserForUpdate userForUpdate);

    /**
     * 所有闲置数
     * @param userId
     * @return
     */
    Integer getTotalSellCount(Integer userId);

    /**
     * 需求总数
     */
    Integer getTotalNeedCount(Integer userId);

    /**
     * 卖出总数
     */
    Integer getTotalSellSuccessCount(Integer userId);

    /**
     * 买入总数
     */
    Integer getTotalBuyCount(Integer userId);

    UserLoginDTO getUserByUserId(Integer userId);
}
