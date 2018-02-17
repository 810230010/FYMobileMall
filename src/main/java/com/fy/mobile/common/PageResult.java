package com.fy.mobile.common;

import java.util.HashMap;
import java.util.List;

import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by usher on 16/8/31.
 */
public class PageResult<T> extends HashMap<String, Object> {

    public final String DRAW = "draw";
    public final String RECORDS_TOTAL = "recordsTotal";
    public final String RECORDS_FILTERED = "recordsFiltered";
    public final String DATA = "data";

    public PageResult(List<T> list, int draw) {
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        this.put(DRAW, draw);
        this.put(RECORDS_TOTAL, pageInfo.getTotal());
        this.put(RECORDS_FILTERED, pageInfo.getTotal());
        this.put(DATA, pageInfo.getList());
    }

    public PageResult(List<T> list, int draw, boolean pageable) {
        if (pageable){
            PageInfo<T> pageInfo = new PageInfo<T>(list);
        }else{
            this.put(DATA, list);
        }
        this.put(DRAW, draw);
        this.put(RECORDS_TOTAL, list.size());
        this.put(RECORDS_FILTERED, list.size());

    }

}

