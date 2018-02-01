package com.fy.mobile.service.user.sell;

import com.fy.mobile.common.GlobalConstant;
import com.fy.mobile.controller.user.sell.SellPublishDTO;
import com.fy.mobile.entity.user.UserLoginDTO;
import com.fy.mobile.mapper.user.SellMapper;
import com.fy.mobile.util.DateUtil;
import com.fy.mobile.util.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Service
public class SellService {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private SellMapper sellMapper;
    /**
     * 添加闲置
     * @param sellPublishDTO
     */
    public int adDSellPublish(SellPublishDTO sellPublishDTO) {
        String now = (String)DateUtil.createDateWithFormat(Date.class, String.class, new Date(), GlobalConstant.DATE_TIME_FORMAT);
        sellPublishDTO.setPublishTime(now);
        UserLoginDTO loginDTO = WebUtil.findUserInSession(request);
        sellPublishDTO.setPublisherId(loginDTO.getUserId());
        sellPublishDTO.setPublisherName(loginDTO.getNickname());
        return sellMapper.insertSellPublish(sellPublishDTO);
    }
}
