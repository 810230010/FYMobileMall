package com.fy.mobile.mapper.admin;

import com.fy.mobile.entity.SellAfterItem;
import com.fy.mobile.entity.user.SellItemDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by usher on 2018/3/4.
 */
@Mapper
public interface AdminSellMapper {
    /**
     * 获取未审核闲置
     * @param orderColumn
     * @param orderType
     * @return
     */
    List<SellItemDetail> listUncheckSellItem(@Param("orderColumn") String orderColumn, @Param("orderType") String orderType);

    /**
     * 获取闲置详情
     * @param sellId
     * @return
     */
    SellItemDetail getSellItemDetail(Integer sellId);

    /**
     * 已审核闲置
     * @param orderColumn
     * @param orderType
     * @return
     */
    List<SellItemDetail> listCheckedSellItem(@Param("orderColumn") String orderColumn, @Param("orderType") String orderType);

    /**
     * 获取售后留言列表
      * @param orderColumn
     * @param orderType
     * @return
     */
    List<SellAfterItem> listSellAfterItems(@Param("orderColumn") String orderColumn, @Param("orderType") String orderType);

    /**
     * 更改售后留言状态
     * @param sellId
     * @param state
     */
    void changeSellAfterState(@Param("sellId") Integer sellId, @Param("state") int state);
}
