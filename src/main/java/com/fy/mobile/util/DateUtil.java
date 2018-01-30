package com.fy.mobile.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * 日期工具类
 */
public class DateUtil {
    public static Object createDateWithFormat(Class<?> src, Class<?> dest, Object content, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        if(src.getSimpleName().equals("String")){
            try {
                return sdf.parse((String)content);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }else{
            System.out.println(sdf.format(content));
            return sdf.format(content);
        }
        return null;
    }
}
