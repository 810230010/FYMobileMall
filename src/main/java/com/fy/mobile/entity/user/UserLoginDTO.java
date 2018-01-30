package com.fy.mobile.entity.user;

import lombok.Data;

@Data
public class UserLoginDTO {
    private String tel;
    private String password;
    private String nickname;
}
