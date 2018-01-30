package com.fy.mobile;

import com.fy.mobile.util.DateUtil;
import com.fy.mobile.util.DigestUtil;

import java.util.Date;

public class Test {
    public static void main(String[] args) {
        DateUtil.createDateWithFormat(Date.class, String.class, new Date(), "yyyy-MM-dd");
    }
}
