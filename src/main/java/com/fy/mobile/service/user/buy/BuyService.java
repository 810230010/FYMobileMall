package com.fy.mobile.service.user.buy;

import com.fy.mobile.common.GlobalConstant;
import com.fy.mobile.entity.user.*;
import com.fy.mobile.mapper.user.BuyMapper;
import com.fy.mobile.util.DateUtil;
import com.fy.mobile.util.WebUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class BuyService {
    @Autowired
    private BuyMapper buyMapper;
    @Autowired
    private HttpServletRequest request;
    /**
     * 添加需求
     * @param buyNeedDTO
     * @return
     */
    public int publishBuyNeed(BuyNeedDTO buyNeedDTO){
        buyNeedDTO.setPublishTime((String) DateUtil.createDateWithFormat(Date.class, String.class, new Date(), GlobalConstant.DATE_TIME_FORMAT));
        UserLoginDTO loginDTO = WebUtil.findUserInSession(request);
        buyNeedDTO.setUserId(loginDTO.getUserId());
        buyNeedDTO.setNickname(loginDTO.getNickname());
        return buyMapper.insertBuyNeed(buyNeedDTO);
    }

    public List<IndexBuyNeedDTO> listTop8BuyNeeds() {
        List<IndexBuyNeedDTO> indexBuyNeedDTOS = buyMapper.listIndexBuyNeeds();
        return indexBuyNeedDTOS;
    }

    /**
     * 获取需求详情
     * @param needId
     * @return
     */
    public BuyNeedDetail getBuyNeedDetail(Integer needId) {
        List<Message> messageList = buyMapper.listAllMessageInNeed(needId);
        BuyNeedDetail buyNeedDetail = buyMapper.getBuyNeedInfo(needId);
        buyNeedDetail.setMessageList(messageList);
        return buyNeedDetail;
    }

    /**
     * 添加需求留言
     * @param needMessage
     * @return
     */
    public int addBuyNeedMessage(Message needMessage) {
        String now = (String)DateUtil.createDateWithFormat(Date.class, String.class, new Date(), GlobalConstant.DATE_TIME_FORMAT);
        needMessage.setPublishTime(now);
        UserLoginDTO loginDTO = WebUtil.findUserInSession(request);
        needMessage.setMessagePublisherId(loginDTO.getUserId());
        needMessage.setMessagePublisherName(loginDTO.getNickname());
        needMessage.setMessageType(0);
        int affected = buyMapper.insertBuyNeedMessage(needMessage);
        return affected;
    }

    /**
     * 获取我的需求
     * @param page
     * @param pageSize
     * @param orderColumn
     * @param orderType
     * @return
     */
    public List<BuyNeedDetail> listMyNeed(Integer page, Integer pageSize, String orderColumn, String orderType) {
        UserLoginDTO loginDTO = WebUtil.findUserInSession(request);
        if(loginDTO == null)
            throw new RuntimeException("请登录");
        Integer userId = loginDTO.getUserId();
        PageHelper.startPage(page, pageSize);
        return buyMapper.listMyNeed(userId, orderColumn, orderType);
    }

    /**
     * 获取所有需求
     * @return
     */
    public List<BuyNeedDetail> listAllBuyNeed() {
        return buyMapper.listAllBuyNeed();
    }

    /**
     * 获取某人所有需求
     * @param userId
     * @return
     */
    public List<IndexBuyNeedDTO> listAllBuyNeedByUserId(Integer userId) {
        return buyMapper.listAllBuyNeedByUserId(userId);
    }
}
