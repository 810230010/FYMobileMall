package com.fy.mobile.entity.user;

import lombok.Data;

@Data
public class UserLoginDTO {
    Integer userId;
    private String tel;
    private String password;
    private String nickname;
    private Integer state;
}
