package com.fy.mobile.controller.admin.sell;

import com.fy.mobile.common.PageResult;
import com.fy.mobile.entity.SellAfterItem;
import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.SellItemDetail;
import com.fy.mobile.entity.user.UserDTO;
import com.fy.mobile.mapper.user.SellMapper;
import com.fy.mobile.service.admin.AdminSellService;
import com.fy.mobile.service.user.sell.SellService;
import com.fy.mobile.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by usher on 2018/3/4.
 */
@Controller
@RequestMapping("/admin/sell")
public class AdminSellController {
    @Autowired
    private AdminSellService adminSellService;
    @Autowired
    private SellMapper sellMapper;
    @Autowired
    private SellService sellService;

    /**
     * 获取所有未审核闲置
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/listUncheckSellItem")
    @ResponseBody
    public Object listUncheckSellItems(@RequestParam("draw") int draw,
                                  @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                  @RequestParam(value = "orderType", required = false) String orderType,
                                  @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                  @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<SellItemDetail> list = adminSellService.listUncheckSellItem(page, pageSize, orderColumn, orderType);
        return new PageResult<SellItemDetail>(list, draw);
    }

    /**
     * 管理员审核闲置页面
     * @return
     */
    @RequestMapping("/page/check")
    public String viewToAdminSellCheck(){
        return "/admin/sell/check-sell-publish";
    }

    /**
     * 闲置详情页
     * @param model
     * @return
     */
    @RequestMapping("/page/sellDetail")
    public String viewToSellDetail(Model model, Integer sellId){
        SellItemDetail sellItemDetail = adminSellService.getSellItemDetail(sellId);
        model.addAttribute("sellDetail", sellItemDetail);
        return "/admin/sell/sell-detail";
    }

    /**
     * 闲置申请通过
     * @return
     */
    @RequestMapping("/passUserSellItemApply")
    @ResponseBody
    public Object passSellApply(Integer sellId){
        RestResult result = new RestResult();
        sellMapper.updateSellItemState(sellId, 1);
        return result.ok();
    }
    /**
     * 拒绝闲置申请通过
     * @return
     */
    @RequestMapping("/rejectUserSellItemApply")
    @ResponseBody
    public Object rejectSellApply(Integer sellId){
        RestResult result = new RestResult();
        sellMapper.updateSellItemState(sellId, 0);
        return result.ok();
    }

    /**
     * 已审核的闲置
     * @return
     */
    @RequestMapping("/page/checked")
    public String viewToCheckedSell(){
        return "/admin/sell/checked-sell-publish";
    }
    /**
     * 获取所有已审核闲置
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/listCheckedSellItem")
    @ResponseBody
    public Object listCheckedSellItems(@RequestParam("draw") int draw,
                                       @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                       @RequestParam(value = "orderType", required = false) String orderType,
                                       @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<SellItemDetail> list = adminSellService.listCheckedSellItem(page, pageSize, orderColumn, orderType);
        return new PageResult<SellItemDetail>(list, draw);
    }

    /**
     * 售后页面
     * @return
     */
    @RequestMapping("/page/dealSellAfter")
    public String viewToDealSellAfter(){
        return "/admin/sell/sell-after";
    }

    /**
     * 获取所有售后
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/listSellAfterItems")
    @ResponseBody
    public Object listSellAfterItems(@RequestParam("draw") int draw,
                                       @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                       @RequestParam(value = "orderType", required = false) String orderType,
                                       @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<SellAfterItem> list = adminSellService.listSellAfterItem(page, pageSize, orderColumn, orderType);
        return new PageResult<SellAfterItem>(list, draw);
    }

    /**
     * 售后详情
     * @return
     */
    @RequestMapping("/page/sellAfterDetail")
    public String viewToSellAfterDetail(Integer sellId,  Model model){
        SellItemDetail sellItemDetail = sellService.getSellItemDetail(sellId);
        model.addAttribute("sellDetail", sellItemDetail);
        return "/admin/sell/sell-after-detail";
    }

    /**
     * 更改售后状态
     * @param sellId
     * @return
     */
    @RequestMapping("/updateSellAfterState")
    @ResponseBody
    public Object updateSellAfterState(Integer sellId){
        RestResult result = new RestResult();
        adminSellService.changeSellAfterState(sellId, 1);
        return result.ok();
    }
}
