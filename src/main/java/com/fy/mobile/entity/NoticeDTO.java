package com.fy.mobile.entity;

import lombok.Data;

/**
 * Created by usher on 2018/3/4.
 */
@Data
public class NoticeDTO {
    private Integer noticeId;
    private String noticeContent;
    private String publishTime;
    private String updateTime;
    private Integer isUsed;
    private String adminName;
    public String getUseString(){
        if(isUsed == 0){
            return "未使用";
        }
        return "正在使用";
    }
}
