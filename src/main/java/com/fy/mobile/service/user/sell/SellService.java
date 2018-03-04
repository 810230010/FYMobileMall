package com.fy.mobile.service.user.sell;

import com.fy.mobile.common.GlobalConstant;
import com.fy.mobile.controller.user.sell.SellPublishDTO;
import com.fy.mobile.entity.user.*;
import com.fy.mobile.mapper.user.OrderMapper;
import com.fy.mobile.mapper.user.SellMapper;
import com.fy.mobile.util.DateUtil;
import com.fy.mobile.util.WebUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class SellService {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private SellMapper sellMapper;
    @Autowired
    private OrderMapper orderMapper;
    /**
     * 添加闲置
     * @param sellPublishDTO
     */
    public int addSellPublish(SellPublishDTO sellPublishDTO) {
        String now = (String)DateUtil.createDateWithFormat(Date.class, String.class, new Date(), GlobalConstant.DATE_TIME_FORMAT);
        sellPublishDTO.setPublishTime(now);
        UserLoginDTO loginDTO = WebUtil.findUserInSession(request);
        sellPublishDTO.setPublisherId(loginDTO.getUserId());
        sellPublishDTO.setPublisherName(loginDTO.getNickname());
        return sellMapper.insertSellPublish(sellPublishDTO);
    }

    /**
     * 获取首页最新8条闲置发布
     * @return
     */
    public List<IndexSellItem> listTop8SellItem(){
        List<IndexSellItem> result = new ArrayList<>();
        result = sellMapper.listTop8SellItem();
        return result;
    }

    /**
     * 获取闲置详情
     * @param sellItemId
     * @return
     */
    public SellItemDetail getSellItemDetail(Integer sellItemId) {
        SellItemDetail result = new SellItemDetail();
        result = sellMapper.getSellItemDetail(sellItemId);
        List<Message> list = orderMapper.getOrderMessage(sellItemId);
        result.setMessageList(list);
        return result;
    }

    /**
     * 获取我的所有闲置
     * @param page
     * @param pageSize
     * @param orderColumn
     * @param orderType
     * @return
     */
    public List<MySellItem> listMySellItems(Integer page, Integer pageSize, String orderColumn, String orderType) {
        List<MySellItem> list = new ArrayList<>();
        UserLoginDTO loginDTO = WebUtil.findUserInSession(request);
        if(loginDTO == null)
            throw new RuntimeException("请登录");
        PageHelper.startPage(page, pageSize);
        return sellMapper.listMySellItems(loginDTO.getUserId(), orderColumn, orderType);
    }

    public void updateSellItemState(Integer sellId, int state) {
        sellMapper.updateSellItemState(sellId, state);
    }

    /**
     * 获取所有闲置
     * @return
     */
    public List<IndexSellItem> listAllSellItems() {
        return sellMapper.listAllSellItems();
    }

    /**
     * 获取某个用户的所有闲置
     * @param userId
     * @return
     */
    public List<IndexSellItem> listAllSellItemsByUserId(Integer userId) {
        return sellMapper.listAllSellItemsByUserId(userId);
    }
}
