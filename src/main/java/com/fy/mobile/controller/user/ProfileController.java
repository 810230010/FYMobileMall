package com.fy.mobile.controller.user;

import com.fy.mobile.common.PageResult;
import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.MySellItem;
import com.fy.mobile.entity.user.UserForUpdate;
import com.fy.mobile.service.user.UserLoginService;
import com.fy.mobile.service.user.sell.SellService;
import com.fy.mobile.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/profile")
public class ProfileController {
    @Autowired
    private UserLoginService userLoginService;
    @Autowired
    private SellService sellService;
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
        sellService.updateSellItemState(4);
        return result.ok();
    }
}
