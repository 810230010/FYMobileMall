package com.fy.mobile.service.user;

import com.fy.mobile.entity.SearchResult;
import com.fy.mobile.mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SearchService {
    @Autowired
    private SearchMapper searchMapper;
    public List<SearchResult> getSearchResult(String keyword){
        List<SearchResult> list = searchMapper.listSearchResult(keyword);
        return list;
    }
}
