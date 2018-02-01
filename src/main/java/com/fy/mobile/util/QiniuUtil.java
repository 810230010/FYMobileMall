package com.fy.mobile.util;

import com.qiniu.util.Auth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


import java.util.HashMap;
import java.util.Map;

/**
 * 七牛工具  生成token
 */
public class QiniuUtil {


    public static String getQiniuUploadToken(){
        String uploadToken = null;
        Auth auth = Auth.create(PropertyUtil.getProperty("QINIU.ACCESS_KEY"), PropertyUtil.getProperty("QINIU.SECRET_KEY"));
        uploadToken = auth.uploadToken(PropertyUtil.getProperty("QINIU.BUCKET"));
        System.out.println(uploadToken);
        return uploadToken;
    }
    public static Map<String, String> getQiniuTokenInfo(){
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("UPLOAD_TOKEN", getQiniuUploadToken());
        tokenMap.put("BASE_URL", PropertyUtil.getProperty("QINIU.BASE_URL"));
        return tokenMap;
    }
}
