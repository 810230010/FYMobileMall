package com.fy.mobile.controller.user.sell;

import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.SellItemDetail;
import com.fy.mobile.service.user.sell.SellService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/sell")
public class SellController {
    @Autowired
    private SellService sellService;

    /**
     * 发布闲置
     * @param sellPublishDTO
     * @return
     */
    @RequestMapping(value = ("/item/publish"), method = RequestMethod.POST)
    @ResponseBody
    public RestResult publishSellItem(SellPublishDTO sellPublishDTO){
        RestResult result = new RestResult();
        sellService.addSellPublish(sellPublishDTO);
        return result.ok();
    }

    /**
     * 闲置发布详情
     * @return
     */
    @RequestMapping("/page/publish/detail")
    public String viewToSellDetail(@RequestParam("itemId") Integer sellItemId, Model model){
        SellItemDetail sellItemDetail = sellService.getSellItemDetail(sellItemId);
        model.addAttribute("sellDetail", sellItemDetail);
        return "/user/sell/sell_detail";
    }
}
