package com.fy.mobile.entity.user;

import lombok.Data;

@Data
public class Order {
    private String orderId;
    private Integer buyUserId;
    private String buyUserName;
    private Integer sellItemId;
    private String sellTitle;
    private String sellDescription;
    private String publisherName;
    private Integer sellUserId;
    private String sellUserName;
    private Integer state;
    private Integer payType;
    private String createTime;
    private String goodsPublishTime;
    private String payPrice;
    private Integer addressId;
}
