package com.fy.mobile.entity.user;

import lombok.Data;

import java.util.List;

@Data
public class IndexSellItem {
    private Integer sellId;
    private String sellTitle;
    private String sellDescription;
    private String image;
    private Double sellPrice;
    public String getImage() {
        return image.split(",")[0];
    }
}
