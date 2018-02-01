package com.fy.mobile.entity.user;

import lombok.Data;

@Data
public class IndexBuyNeedDTO {
    private Integer needId;
    private String title;
    private int commentNo;
    private String publisherName;
    private Integer publisherId;
    private String publishTime;
}
