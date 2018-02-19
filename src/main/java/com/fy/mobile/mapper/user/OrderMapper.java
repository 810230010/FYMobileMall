package com.fy.mobile.mapper.user;

import com.fy.mobile.entity.user.Address;
import com.fy.mobile.entity.user.Message;
import com.fy.mobile.entity.user.Order;
import com.fy.mobile.entity.user.OrderDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrderMapper {
    /**
     * 添加收货地址
     * @param address
     * @return
     */
    int insertAddress(Address address);

    /**
     * 获取所有收货地址
     * @return
     */
    List<Address> listAllAddress(Integer userId);

    /**
     * 添加订单
     * @param order
     * @return
     */
    int insertOrder(Order order);

    /**
     * 获取我购买的所有订单
     * @param userId
     * @param orderColumn
     * @param orderType
     * @return
     */
    List<OrderDetail> listMyBuyOrder(@Param("userId") Integer userId, @Param("orderColumn") String orderColumn, @Param("orderType") String orderType);

    /**
     * 修改订单状态
     * @param state
     */
    void updateOrderState(int state);

    /**
     * 获取订单详情
     * @param orderId
     * @return
     */
    OrderDetail getOrderDetail(String orderId);

    /**
     * 获取我售出的订单
     * @param userId
     * @param orderColumn
     * @param orderType
     * @return
     */
    List<OrderDetail> listMySellOrder(@Param("userId") Integer userId, @Param("orderColumn") String orderColumn, @Param("orderType") String orderType);

    /**
     * 添加售后留言
     * @param orderMessage
     * @return
     */
    int insertOrderMessage(Message orderMessage);

    /**
     * 获取售后留言
     * @param sellItemId
     * @return
     */
    List<Message> getOrderMessage(Integer sellItemId);
}
