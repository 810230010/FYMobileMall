package com.fy.mobile.mapper.user;

import com.fy.mobile.controller.user.sell.SellPublishDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellMapper {
    /**
     * 发布闲置
     * @param sellPublishDTO
     * @return
     */
    int insertSellPublish(SellPublishDTO sellPublishDTO);
}
