package com.fy.mobile.mapper;

import com.fy.mobile.entity.SearchResult;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SearchMapper {
    List<SearchResult> listSearchResult(@Param("keyword") String keyword);
}
