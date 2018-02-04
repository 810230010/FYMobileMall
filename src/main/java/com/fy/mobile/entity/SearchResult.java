package com.fy.mobile.entity;

import lombok.Data;

@Data
public class SearchResult {
    private Integer id;
    private String title;
    private String type;
    private String publisherName;
    private String publishTime;
    private Double price;
    private Integer publisher_id;
}
