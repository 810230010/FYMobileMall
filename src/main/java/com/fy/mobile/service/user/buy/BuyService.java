package com.fy.mobile.service.user.buy;

import com.fy.mobile.common.GlobalConstant;
import com.fy.mobile.entity.user.BuyNeedDTO;
import com.fy.mobile.entity.user.IndexBuyNeedDTO;
import com.fy.mobile.entity.user.UserLoginDTO;
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
}
