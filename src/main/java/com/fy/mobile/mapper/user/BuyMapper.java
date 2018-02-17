package com.fy.mobile.mapper.user;

import com.fy.mobile.entity.user.BuyNeedDTO;
import com.fy.mobile.entity.user.BuyNeedDetail;
import com.fy.mobile.entity.user.IndexBuyNeedDTO;
import com.fy.mobile.entity.user.Message;
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

    /**
     * 获取需求详情不包括评论
     */
    BuyNeedDetail getBuyNeedInfo(Integer needId);

    /**
     * 获取需求所有留言
     */
    List<Message> listAllMessageInNeed(Integer needId);

    /**\
     * 添加需求留言
     * @param needMessage
     * @return
     */
    int insertBuyNeedMessage(Message needMessage);
}
