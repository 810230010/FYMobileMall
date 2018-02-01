package com.fy.mobile.controller.user.buy;

import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.BuyNeedDTO;
import com.fy.mobile.entity.user.IndexBuyNeedDTO;
import com.fy.mobile.service.user.buy.BuyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/buy")
public class BuyController {
    @Autowired
    private BuyService buyService;
    /**
     * 发布需求
     * @return
     */
    @RequestMapping(value = ("/needs"), method = RequestMethod.POST)
    @ResponseBody
    public RestResult publishBuyNeed(BuyNeedDTO buyNeedDTO){
        RestResult result = new RestResult();
        buyService.publishBuyNeed(buyNeedDTO);
        return result.ok();
    }

}
