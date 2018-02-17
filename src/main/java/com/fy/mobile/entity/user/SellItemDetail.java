package com.fy.mobile.entity.user;

import lombok.Data;

import java.util.Arrays;
import java.util.List;

@Data
public class SellItemDetail {
    private Integer sellId;
    private String publisherName;
    private Integer publisherId;
    private String sellTitle;
    private String image;
    private String sellDescription;
    private Double sellPrice;
    private String brandName;
    private Integer loveNo;
    private Integer commentNo;
    private String publishTime;
    public List<String> getImages(){
        String[] images = image.split(",");
        return Arrays.asList(images);
    }
}
