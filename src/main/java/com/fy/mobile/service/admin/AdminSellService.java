package com.fy.mobile.service.admin;

import com.fy.mobile.entity.SellAfterItem;
import com.fy.mobile.entity.user.SellItemDetail;
import com.fy.mobile.mapper.admin.AdminSellMapper;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by usher on 2018/3/4.
 */
@Service
public class AdminSellService {
    @Autowired
    private AdminSellMapper adminSellMapper;
    public List<SellItemDetail> listUncheckSellItem(Integer page, Integer pageSize, String orderColumn, String orderType){
        PageHelper.startPage(page, pageSize);
        return adminSellMapper.listUncheckSellItem(orderColumn, orderType);
    }

    /**
     * 获取闲置详情
     * @param sellId
     * @return
     */
    public SellItemDetail getSellItemDetail(Integer sellId) {
        SellItemDetail sellItemDetail = adminSellMapper.getSellItemDetail(sellId);
        return sellItemDetail;
    }

    /**
     * 获取已审核闲置
     * @param page
     * @param pageSize
     * @param orderColumn
     * @param orderType
     * @return
     */
    public List<SellItemDetail> listCheckedSellItem(Integer page, Integer pageSize, String orderColumn, String orderType) {
        PageHelper.startPage(page, pageSize);
        return adminSellMapper.listCheckedSellItem(orderColumn, orderType);
    }

    /**
     * 售后留言列表
     * @param page
     * @param pageSize
     * @param orderColumn
     * @param orderType
     * @return
     */
    public List<SellAfterItem> listSellAfterItem(Integer page, Integer pageSize, String orderColumn, String orderType) {
        PageHelper.startPage(page, pageSize);
        return adminSellMapper.listSellAfterItems(orderColumn, orderType);
    }

    public void changeSellAfterState(Integer sellId, int state) {
        adminSellMapper.changeSellAfterState(sellId, state);
    }
}
