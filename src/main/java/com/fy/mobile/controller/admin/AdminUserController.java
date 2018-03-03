package com.fy.mobile.controller.admin;

import com.fy.mobile.common.PageResult;
import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.MySellItem;
import com.fy.mobile.entity.user.UserDTO;
import com.fy.mobile.service.admin.AdminUserService;
import com.fy.mobile.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by usher on 2018/3/3.
 */
@Controller
@RequestMapping("/admin")
public class AdminUserController {
    @Autowired
    private AdminUserService adminUserService;
    /**
     * 管理员管理用户页面
     * @return
     */
    @RequestMapping("/page/users")
    public String viewToAdminUser(){
        return "/admin/user";
    }
    /**
     * 获取所有用户
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/user/listAllUser")
    @ResponseBody
    public Object listMySellItems(@RequestParam("draw") int draw,
                                  @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                  @RequestParam(value = "orderType", required = false) String orderType,
                                  @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                  @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<UserDTO> list = adminUserService.listAllUser(page, pageSize, orderColumn, orderType);
        return new PageResult<UserDTO>(list, draw);
    }

    /**
     * 拉黑用户
     * @param userId
     * @return
     */
    @RequestMapping("/user/forbidUser")
    @ResponseBody
    public Object forbidUser(Integer userId){
        RestResult result = new RestResult();
        adminUserService.forbidUser(userId);
        return result.ok();
    }
    /**
     * 恢复用户
     * @param userId
     * @return
     */
    @RequestMapping("/user/recoverUser")
    @ResponseBody
    public Object recoverUser(Integer userId){
        RestResult result = new RestResult();
        adminUserService.recoverUser(userId);
        return result.ok();
    }

}
