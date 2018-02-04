package com.fy.mobile.entity.user;

import lombok.Data;

@Data
public class BuyNeedDetail {
    private Integer needId;
    private Integer publisherId;
    private String publisherName;
    private String needTitle;
    private String needDescription;
    private String publishTime;
    
}
