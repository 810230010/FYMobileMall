package com.fy.mobile.entity.user;

import lombok.Data;

import java.util.List;

@Data
public class BuyNeedDetail {
    private Integer needId;
    private Integer publisherId;
    private String publisherName;
    private String needTitle;
    private String needDescription;
    private String publishTime;
    private List<Message> messageList;
}
