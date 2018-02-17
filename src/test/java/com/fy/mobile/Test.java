package com.fy.mobile;

import com.fy.mobile.entity.A;
import com.fy.mobile.util.DateUtil;
import com.fy.mobile.util.DigestUtil;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class Test {
    public static void main(String[] args) {
            List<A> list = new ArrayList<>();
            A a1 = new A();
            A a2 = new A();
            a1.setAmount(0.0);
            a2.setAmount(null);
            list.add(a1);
            list.add(a2);
            List<A> list2 = new ArrayList<>();
            list.addAll(list2);
            Double a = list.stream().collect(Collectors.summingDouble(A::getAmount));
        System.out.println(a);
    }
}
