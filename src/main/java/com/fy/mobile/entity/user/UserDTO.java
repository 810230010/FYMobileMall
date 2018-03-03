package com.fy.mobile.entity.user;

import lombok.Data;

/**
 * Created by usher on 2018/3/3.
 */
@Data
public class UserDTO {
    private Integer userId;
    private String tel;
    private String nickname;
    private String password;
    private Integer userType;
    private String userTypeString;
    private Integer state;
    private String stateString;
    private String createTime;

    public String getUserTypeString() {
        if(userType == 0){
            return "普通用户";
        }
        return "管理员";
    }

    public String getStateString() {
        if(state == 0){
            return "禁用";
        }
        return "可用";
    }
}
