package com.fy.mobile.controller.user;

import com.fy.mobile.common.PageResult;
import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.*;
import com.fy.mobile.mapper.user.UserLoginMapper;
import com.fy.mobile.service.user.UserLoginService;
import com.fy.mobile.service.user.buy.BuyService;
import com.fy.mobile.service.user.order.OrderService;
import com.fy.mobile.service.user.sell.SellService;
import com.fy.mobile.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/profile")
public class ProfileController {
    @Autowired
    private UserLoginService userLoginService;
    @Autowired
    private SellService sellService;
    @Autowired
    private BuyService buyService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserLoginMapper userLoginMapper;
    /**
     * 个人基本信息页面
     * @return
     */
    @RequestMapping("/page/myBasicProfileInfo")
    public String viewToBasicProfile(){
        return "/user/profile/profile-info";
    }

    /**
     * 编辑个人信息页面
     */
    @RequestMapping("/page/editBasicInfo")
    public String viewToEditBasicInfo(Model model){
        return "/user/profile/edit-basic-info";
    }

    /**
     * 修改个人基本信息
     * @param userForUpdate
     * @return
     */
    @RequestMapping("/editBasicInfo")
    @ResponseBody
    public Object editBasicInfo(UserForUpdate userForUpdate){
        return userLoginService.editBasicInfo(userForUpdate);
    }

    /**
     * 我的闲置页面
     * @return
     */
    @RequestMapping("/page/allSellItems")
    public String viewToMySellItems(){
        return "/user/profile/my-sell-item";
    }

    /**
     * 获取我发布的所有闲置
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/listMySellItems")
    @ResponseBody
    public Object listMySellItems(@RequestParam("draw") int draw,
                                         @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                         @RequestParam(value = "orderType", required = false) String orderType,
                                         @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                         @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<MySellItem> list = sellService.listMySellItems(page, pageSize, orderColumn, orderType);
        return new PageResult<MySellItem>(list, draw);
    }
    /**
     * 关闭发布的闲置
     */
    @RequestMapping("/closeSellItem")
    @ResponseBody
    public Object closeSellItem(Integer sellId){
        RestResult result = new RestResult();
        sellService.updateSellItemState(sellId, 4);
        return result.ok();
    }

    /**
     * 获取我的需求
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/listMyNeed")
    @ResponseBody
    public Object listMyNeed(@RequestParam("draw") int draw,
                                  @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                  @RequestParam(value = "orderType", required = false) String orderType,
                                  @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                  @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<BuyNeedDetail> list = buyService.listMyNeed(page, pageSize, orderColumn, orderType);
        return new PageResult<BuyNeedDetail>(list, draw);
    }
    /**
     * 我的所有需求页面
     */
    @RequestMapping("/page/allNeedPublish")
    public String viewToMyNeedPublish(){
        return "/user/profile/my-need-publish";
    }
    /**
     * 我购买的订单页面
     */
    @RequestMapping("/page/myBuyOrder")
    public String viewToMyBuyOrder(){
        return "/user/profile/my-buy-order";
    }

    /**
     * 我售出的订单页面
     * @return
     */
    @RequestMapping("/page/mySellOrder")
    public String viewToMySellOrder(){
        return "/user/profile/my-sell-order";
    }
    /**
     * 获取我购买的订单
     */
    @RequestMapping("/listMyBuyOrder")
    @ResponseBody
    public Object listMyBuyOrder(@RequestParam("draw") int draw,
                             @RequestParam(value = "orderColumn", required = false) String orderColumn,
                             @RequestParam(value = "orderType", required = false) String orderType,
                             @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<OrderDetail> list = orderService.listMyBuyOrder(page, pageSize, orderColumn, orderType);
        return new PageResult<OrderDetail>(list, draw);
    }

    /**
     * 确认收货
     * @param orderId
     * @return
     */
    @RequestMapping("/confirmMyBuyOrder")
    @ResponseBody
    public Object confirmMyBuyOrder(String orderId){
        RestResult result = new RestResult();
        orderService.updateOrderState(1);
        return result.ok();
    }

    /**
     * 订单详情页面
     * @param orderId
     * @return
     */
    @RequestMapping("/page/orderDetail")
    public String viewToOrderDetail(String orderId, Model model){
        OrderDetail orderDetail = orderService.getOrderDetail(orderId);
        model.addAttribute("orderDetail", orderDetail);
        return "/user/order/order-detail";
    }
    /**
     * 获取我售出的订单
     */
    @RequestMapping("/listMySellOrder")
    @ResponseBody
    public Object listMySellOrder(@RequestParam("draw") int draw,
                                 @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                 @RequestParam(value = "orderType", required = false) String orderType,
                                 @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                 @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<OrderDetail> list = orderService.listMySellOrder(page, pageSize, orderColumn, orderType);
        return new PageResult<OrderDetail>(list, draw);
    }
    /**
     * 修改订单状态为已发货
     * @param orderId
     * @return
     */
    @RequestMapping("/sendMySellOrder")
    @ResponseBody
    public Object sendMySellOrder(String orderId){
        RestResult result = new RestResult();
        orderService.updateOrderState(2);
        return result.ok();
    }
    /**
     * 卖家信息页面
     */
    @RequestMapping("/page/sellerInfo")
    public String viewToSellerInfo(Integer userId, Model model){
        Map map = userLoginService.getPersonAnalys(userId);
        String nickname = userLoginMapper.getUserByUserId(userId).getNickname();
        map.put("nickname", nickname);
        List<IndexSellItem> list = sellService.listAllSellItemsByUserId(userId);
        List<IndexBuyNeedDTO> buyNeedDTOS = buyService.listAllBuyNeedByUserId(userId);
        model.addAttribute("seller", map);
        model.addAttribute("sellItems", list);
        model.addAttribute("buyNeeds", buyNeedDTOS);
        return "/user/profile/seller_info";
    }
}
