package com.fy.mobile.entity.user;

import lombok.Data;

@Data
public class OrderDetail {
    private String orderId;
    private Integer sellItemId;
    private Integer sellUserId;
    private String sellUserName;
    private String sellTitle;
    private Integer stateCode;
    private String image;
    private String state;
    private String payType;
    private String payPrice;
    private String createTime;
    private String addressName;
    private String goodsTaker;
    private String tel;
    private Integer buyUserId;
    private String buyUserName;

    public String getPayPrice() {
        return "¥" + payPrice;
    }

    public String getImage() {
        return image.split(",")[0];
    }

    public String getState() {
        if(stateCode == 0)
            return "已下单";
        if(stateCode == 1)
            return "交易成功";
        return "卖家已发货";
    }
}
