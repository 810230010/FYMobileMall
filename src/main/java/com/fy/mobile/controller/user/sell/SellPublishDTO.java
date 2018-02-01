package com.fy.mobile.controller.user.sell;

import lombok.Data;

@Data
public class SellPublishDTO {
    private Integer sellId;
    private String sellTitle;
    private String image;
    private String sellDescription;
    private String sellPrice;
    private String brandName;
    private String publishTime;
    private String updateTime;
    private Integer publisherId;
    private String publisherName;
    private Integer loveNo;
    private Integer commentNo;
    private Integer state;
}
