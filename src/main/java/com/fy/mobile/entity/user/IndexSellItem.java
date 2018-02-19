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
    private Integer stateCode;
    private String state;
    public String getState() {
        if(stateCode == 0)
            return "审核未通过";
        if(stateCode == 1)
            return "审核通过";
        if(stateCode == 2)
            return "审核中";
        if(stateCode == 3)
            return "已有人下单";
        return "已关闭";
    }
    public String getImage() {
        return image.split(",")[0];
    }
}
