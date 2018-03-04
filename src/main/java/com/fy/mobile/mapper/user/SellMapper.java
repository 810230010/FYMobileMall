package com.fy.mobile.mapper.user;

import com.fy.mobile.controller.user.sell.SellPublishDTO;
import com.fy.mobile.entity.user.IndexSellItem;
import com.fy.mobile.entity.user.MySellItem;
import com.fy.mobile.entity.user.SellItemDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

    /**
     * 获取闲置详情
     * @param sellItemId
     * @return
     */
    SellItemDetail getSellItemDetail(Integer sellItemId);

    void updateSellItemState(@Param("sellId") Integer sellId, @Param("state") Integer state);

    /**
     * 获取我的所有闲置
     * @param userId
     * @return
     */
    List<MySellItem> listMySellItems(@Param("userId") Integer userId, @Param("orderColumn") String orderColumn, @Param("orderType") String orderType);

    /**
     * 获取所有闲置
     * @return
     */
    List<IndexSellItem> listAllSellItems();

    List<IndexSellItem> listAllSellItemsByUserId(Integer userId);
}
