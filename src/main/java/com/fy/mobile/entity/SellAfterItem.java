package com.fy.mobile.entity;

import lombok.Data;

/**
 * Created by usher on 2018/3/10.
 */
@Data
public class SellAfterItem {
    private String sellId;
    private String sellTitle;
    private String image;
    private String message;
    private String seller;
    private String buyer;
    private String messageTime;
    private Integer state;
    private String stateString;
    private String tel;

    public String getStateString() {
        if(state == 0){
            return "未联系";
        }
        return "已联系";
    }

    public String geOneImage(){
        return image.split(",")[0];
    }
}
