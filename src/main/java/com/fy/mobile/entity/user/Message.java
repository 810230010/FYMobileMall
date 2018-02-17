package com.fy.mobile.entity.user;

import lombok.Data;

@Data
public class Message {
    private Integer messageId;
    private String message;
    private Integer messagePublisherId;
    private String messagePublisherName;
    private Integer needSellId;
    private String publishTime;
    private Integer messageType;
    private Integer state;
}
