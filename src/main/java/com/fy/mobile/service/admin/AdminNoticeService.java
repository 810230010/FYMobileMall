package com.fy.mobile.service.admin;

import com.fy.mobile.common.GlobalConstant;
import com.fy.mobile.entity.NoticeDTO;
import com.fy.mobile.entity.user.UserLoginDTO;
import com.fy.mobile.mapper.admin.AdminNoticeMapper;
import com.fy.mobile.util.DateUtil;
import com.fy.mobile.util.WebUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by usher on 2018/3/4.
 */
@Service
public class AdminNoticeService {
    @Autowired
    private AdminNoticeMapper adminNoticeMapper;
    @Autowired
    private HttpServletRequest request;

    /**
     * 获取所有公告
     * @param page
     * @param pageSize
     * @param orderColumn
     * @param orderType
     * @return
     */
    public List<NoticeDTO> listAllNotice(Integer page, Integer pageSize, String orderColumn, String orderType){
        PageHelper.startPage(page, pageSize);
        return adminNoticeMapper.listAllNotice(orderColumn, orderType);
    }

    /**
     * 添加公告
     * @param noticeDTO
     */
    public void addNotice(NoticeDTO noticeDTO) {
        UserLoginDTO user = WebUtil.findUserInSession(request);
        if(user == null)
            throw new RuntimeException("登陆过期，请重新登陆");
        String adder = user.getNickname();
        String now = (String)DateUtil.createDateWithFormat(Date.class, String.class, new Date(), GlobalConstant.DATE_TIME_FORMAT);
        noticeDTO.setAdminName(adder);
        noticeDTO.setPublishTime(now);
        noticeDTO.setUpdateTime(now);
        adminNoticeMapper.insertNotice(noticeDTO);
    }

    /**
     * 修改公告
     * @param noticeId
     * @param noticeContent
     */
    public void updateNotice(Integer noticeId, String noticeContent) {
        NoticeDTO noticeDTO = new NoticeDTO();
        String now = (String)DateUtil.createDateWithFormat(Date.class, String.class, new Date(), GlobalConstant.DATE_TIME_FORMAT);
        noticeDTO.setUpdateTime(now);
        noticeDTO.setNoticeContent(noticeContent);
        noticeDTO.setNoticeId(noticeId);
        adminNoticeMapper.updateNotice(noticeDTO);
    }

    /**
     * 启用公告
     * @param noticeId
     */
    public void useNotice(Integer noticeId) {
        adminNoticeMapper.changeNoticeUseState(noticeId, 1);
        adminNoticeMapper.changeNoticeUseState(noticeId, null);
    }

    /**
     * 删除公告
     * @param noticeId
     */
    public void deleteNotice(Integer noticeId) {
        adminNoticeMapper.deleteNoticeById(noticeId);
    }
}
