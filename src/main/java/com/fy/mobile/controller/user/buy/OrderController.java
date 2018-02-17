package com.fy.mobile.controller.user.buy;

import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.Address;
import com.fy.mobile.entity.user.Order;
import com.fy.mobile.entity.user.SellItemDetail;
import com.fy.mobile.service.user.order.OrderService;
import com.fy.mobile.service.user.sell.SellService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 订单controller
 */
@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private SellService sellService;
    /**
     * 订单确认页面
     * @return
     */
    @RequestMapping("/page/confirm")
    public String viewToConfirmOrder(Integer sellItemId, Model model){
        List<Address> list = orderService.listAllAddress();
        SellItemDetail sellItemDetail = sellService.getSellItemDetail(sellItemId);
        model.addAttribute("addressList", list);
        model.addAttribute("sellItem", sellItemDetail);
        return "/user/order/confirm_order";
    }

    /**
     * 下单成功页面
     * @return
     */
    @RequestMapping("/page/success")
    public String viewToOrderSuccess(){
        return "/user/order/order_success";
    }
    /**
     * 添加收货地址
     */
    @RequestMapping(value = "/addresses", method = RequestMethod.POST)
    @ResponseBody
    public RestResult addAddress(Address address){
        RestResult result = new RestResult();
        orderService.addAddress(address);
        return result.ok();
    }

    /**
     * 下单
     * @param order
     * @return
     */
    @RequestMapping(value = "/makeOrder",method = RequestMethod.POST)
    @ResponseBody
    public RestResult makeOrder(Order order){
        RestResult result = new RestResult();
        orderService.addOrder(order);
        return result.ok();
    }

}
