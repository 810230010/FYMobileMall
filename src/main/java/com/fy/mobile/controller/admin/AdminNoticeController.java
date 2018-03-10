package com.fy.mobile.controller.admin;

import com.fy.mobile.common.PageResult;
import com.fy.mobile.entity.NoticeDTO;
import com.fy.mobile.entity.common.RestResult;
import com.fy.mobile.entity.user.SellItemDetail;
import com.fy.mobile.mapper.user.SellMapper;
import com.fy.mobile.service.admin.AdminNoticeService;
import com.fy.mobile.service.admin.AdminSellService;
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
@RequestMapping("/admin/notice")
public class AdminNoticeController {
    @Autowired
    private AdminNoticeService adminNoticeService;

    /**
     * 所有公告页面
     * @return
     */
    @RequestMapping("/page/allNotice")
    public String viewToAllNotice(){
        return "/admin/all_notice";
    }
    /**
     * 获取所有公告
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/listAllNotice")
    @ResponseBody
    public Object listCheckedSellItems(@RequestParam("draw") int draw,
                                       @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                       @RequestParam(value = "orderType", required = false) String orderType,
                                       @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<NoticeDTO> list = adminNoticeService.listAllNotice(page, pageSize, orderColumn, orderType);
        return new PageResult<NoticeDTO>(list, draw);
    }

    /**
     * 添加公告
     * @return
     */
    @RequestMapping("/addNotice")
    @ResponseBody
    public Object addNotice(NoticeDTO noticeDTO){
        adminNoticeService.addNotice(noticeDTO);
        return new RestResult().ok();
    }

    /**
     * 修改公告
     * @param noticeId
     * @param noticeContent
     * @return
     */
    @RequestMapping("/updateNotice")
    @ResponseBody
    public Object updateNotice(Integer noticeId, String noticeContent){
        RestResult result = new RestResult();
        adminNoticeService.updateNotice(noticeId, noticeContent);
        return result.ok();
    }
    /**
     * 使用公告
     * @param noticeId
     * @param
     * @return
     */
    @RequestMapping("/useNotice")
    @ResponseBody
    public Object useNotice(Integer noticeId){
        RestResult result = new RestResult();
        adminNoticeService.useNotice(noticeId);
        return result.ok();
    }
    /**
     * 删除公告
     * @param noticeId
     * @param
     * @return
     */
    @RequestMapping("/deleteNotice")
    @ResponseBody
    public Object deleteNotice(Integer noticeId){
        RestResult result = new RestResult();
        adminNoticeService.deleteNotice(noticeId);
        return result.ok();
    }

}
