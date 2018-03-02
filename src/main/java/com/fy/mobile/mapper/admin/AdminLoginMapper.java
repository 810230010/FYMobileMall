package com.fy.mobile.mapper.admin;

import com.fy.mobile.entity.user.UserLoginDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdminLoginMapper {
    UserLoginDTO findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
}
