package com.fy.mobile.entity.user;

import lombok.Data;

@Data
public class UserForUpdate {
    private Integer userId;
    private String tel;
    private String newPassword;
    private String oldPassword;
}
