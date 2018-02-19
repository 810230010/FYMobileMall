package com.fy.mobile.controller.user.buy;

import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.BuyNeedDTO;
import com.fy.mobile.entity.user.BuyNeedDetail;
import com.fy.mobile.entity.user.IndexBuyNeedDTO;
import com.fy.mobile.entity.user.Message;
import com.fy.mobile.service.user.buy.BuyService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

    /**
     * 获取发布的需求详情
     * @param needId
     * @return
     */
    public RestResult getPublishedNeedDetail(@Param("needId") Integer needId, Model model){
        RestResult result = new RestResult();

        return result.ok();
    }

    /**
     * 需求详情页面
     * @return
     */
    @RequestMapping("/page/need/detail")
    public String viewToBuyNeedDetail(@RequestParam("itemId") Integer needId, Model model){
        BuyNeedDetail needDetail = buyService.getBuyNeedDetail(needId);
        model.addAttribute("needDetail", needDetail);
        return "/user/buy/need_detail";
    }

    /**
     * 添加需求留言
     */
    @RequestMapping(value = "/need/message", method = RequestMethod.POST)
    @ResponseBody
    public RestResult addNeedMessage(Message needMessage){
        RestResult result = new RestResult();
        int affectedRow = buyService.addBuyNeedMessage(needMessage);
        return result.ok();
    }

}
