package com.fy.mobile.entity.user;

import lombok.Data;

@Data
public class Address {
    private Integer addressId;
    private String addressName;
    private String goodsTaker;
    private String tel;
    private String createTime;
    private String updateTime;
    private Integer createdUserId;
}
