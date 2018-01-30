package com.fy.mobile.entity.user;

import lombok.Data;

@Data
public class UserRegisterDTO {
    private String tel;
    private String nickname;
    private String password;
    private String createTime;
}
