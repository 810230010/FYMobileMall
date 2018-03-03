package com.fy.mobile.mapper.admin;

import com.fy.mobile.entity.user.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by usher on 2018/3/3.
 */
@Mapper
public interface AdminUserMapper {
    /**
     * 获取所有用户
     * @param orderColumn
     * @param orderType
     * @return
     */
    List<UserDTO> listAllUser(@Param("orderColumn") String orderColumn, @Param("orderType") String orderType);

    /**
     * 更改用户状态
     * @param userId
     * @param
     */
    void changeUserState(@Param("userId") Integer userId, @Param("state") int state);
}
