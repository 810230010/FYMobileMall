package com.fy.mobile.service.user.buy;

import com.fy.mobile.common.GlobalConstant;
import com.fy.mobile.entity.user.*;
import com.fy.mobile.mapper.user.BuyMapper;
import com.fy.mobile.util.DateUtil;
import com.fy.mobile.util.WebUtil;
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
}
