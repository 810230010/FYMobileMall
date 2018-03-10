package com.fy.mobile.mapper.admin;

import com.fy.mobile.entity.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by usher on 2018/3/4.
 */
@Mapper
public interface AdminNoticeMapper {
    /**
     * 获取所有公告
     * @param orderColumn
     * @param orderType
     * @return
     */
    List<NoticeDTO> listAllNotice(@Param("orderColumn") String orderColumn, @Param("orderType") String orderType);

    /**
     * 添加公告
     * @param noticeDTO
     */
    void insertNotice(NoticeDTO noticeDTO);

    /**
     * 修改公告
     * @param noticeDTO
     */
    void updateNotice(NoticeDTO noticeDTO);

    /**
     * 改变公告使用状态
     * @param noticeId
     */
    void changeNoticeUseState(@Param("noticeId") Integer noticeId, @Param("state") Integer state);

    /**
     * 删除公告
     * @param noticeId
     */
    void deleteNoticeById(Integer noticeId);

    /**
     * 最新公告
     * @return
     */
    String getLatestNotice();
}
