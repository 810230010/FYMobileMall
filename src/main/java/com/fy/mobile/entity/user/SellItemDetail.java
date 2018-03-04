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
    private Integer state;
    private String tel;
    private List<Message> messageList;
    public List<String> getImages(){
        String[] images = image.split(",");
        return Arrays.asList(images);
    }
    public String getFormattedPrice(){
        return sellPrice + "元";
    }
    public String getOneImage(){
        return image.split(",")[0];
    }
    public String getStateString(){
        if(state == 0){
            return "未通过";
        }else if(state == 1){
            return "审核通过";
        }
        return "待审核";
    }
}
