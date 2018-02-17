package com.fy.mobile.service.user.order;

import com.fy.mobile.common.GlobalConstant;
import com.fy.mobile.entity.user.Address;
import com.fy.mobile.entity.user.Order;
import com.fy.mobile.entity.user.UserLoginDTO;
import com.fy.mobile.mapper.user.OrderMapper;
import com.fy.mobile.mapper.user.SellMapper;
import com.fy.mobile.util.DateUtil;
import com.fy.mobile.util.OrderUtil;
import com.fy.mobile.util.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class OrderService {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private SellMapper sellMapper;
    /**
     * 添加收货地址
     * @param address
     * @return
     */
    public int addAddress(Address address){
        UserLoginDTO userLoginDTO = WebUtil.findUserInSession(request);
        Integer userId = userLoginDTO.getUserId();
        String now = (String)DateUtil.createDateWithFormat(Date.class,String.class, new Date(), GlobalConstant.DATE_TIME_FORMAT);
        address.setCreatedUserId(userId);
        address.setCreateTime(now);
        return orderMapper.insertAddress(address);
    }

    /**
     * 获取所有收货地址
     * @return
     */
    public List<Address> listAllAddress() {
        UserLoginDTO loginDTO = WebUtil.findUserInSession(request);
        if(loginDTO == null)
            throw new RuntimeException("请登录!");
        Integer userId =  loginDTO.getUserId();
        List<Address> addressList = orderMapper.listAllAddress(userId);
        return addressList;
    }

    /**
     * 下单
     * @param order
     */
    public void addOrder(Order order) {
        String orderId = OrderUtil.getOrderIdByUUId();
        order.setOrderId(orderId);
        String now = (String)DateUtil.createDateWithFormat(Date.class,String.class, new Date(), GlobalConstant.DATE_TIME_FORMAT);
        order.setCreateTime(now);
        UserLoginDTO login = WebUtil.findUserInSession(request);
        if(login == null)
            throw new RuntimeException("登录信息已过期，请重新登录");
        Integer userId = login.getUserId();
        String buyerName = login.getNickname();
        order.setBuyUserId(userId);
        order.setBuyUserName(buyerName);
        int row = orderMapper.insertOrder(order);
        //改变商品状态为已有人下单
        sellMapper.updateSellItemState(3);
    }
}