package com.fy.mobile.mapper.user;

import com.fy.mobile.controller.user.sell.SellPublishDTO;
import com.fy.mobile.entity.user.IndexSellItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SellMapper {
    /**
     * 发布闲置
     * @param sellPublishDTO
     * @return
     */
    int insertSellPublish(SellPublishDTO sellPublishDTO);

    /**
     * 获取最新8条闲置发布
     * @return
     */
    List<IndexSellItem> listTop8SellItem();
}
