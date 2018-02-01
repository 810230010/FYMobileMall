package com.fy.mobile.entity.user;

import lombok.Data;

@Data
public class BuyNeedDTO {
    private Integer buyNeedId;
    private Integer userId;
    private String nickname;
    private String title;
    private String description;
    private String publishTime;
    private String updateTime;
}
