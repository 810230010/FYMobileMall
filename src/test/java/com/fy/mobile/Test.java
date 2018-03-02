package com.fy.mobile;

import com.fy.mobile.entity.A;
import com.fy.mobile.util.DateUtil;
import com.fy.mobile.util.DigestUtil;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class Test {
    public static void main(String[] args) {
                System.out.println(getDaysAddWithDatetime(-1, 21, 30, 59));
    }
    public static String getDaysAddWithDatetime(int addDayNum, Integer hour, Integer minute, Integer second){
        Calendar now = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if(hour == null){
            now.add(Calendar.DAY_OF_MONTH, addDayNum);
            return sdf.format(now.getTime());
        }
        now.set(Calendar.HOUR_OF_DAY, hour);
        now.set(Calendar.MINUTE, minute);
        now.set(Calendar.SECOND, second);
        now.add(Calendar.DAY_OF_MONTH, addDayNum);
        return sdf.format(now.getTime());
    }
}
