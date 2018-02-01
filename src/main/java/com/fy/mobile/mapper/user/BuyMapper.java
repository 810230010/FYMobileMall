package com.fy.mobile.mapper.user;

import com.fy.mobile.entity.user.BuyNeedDTO;
import com.fy.mobile.entity.user.IndexBuyNeedDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BuyMapper {
    /**
     * 添加需求
     * @param buyNeedDTO
     * @return
     */
    int insertBuyNeed(BuyNeedDTO buyNeedDTO);

    /**
     * 按时间查询首页的发布需求
     * @return
     */
    List<IndexBuyNeedDTO> listIndexBuyNeeds();
}
