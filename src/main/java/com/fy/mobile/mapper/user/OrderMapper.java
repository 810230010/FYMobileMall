package com.fy.mobile.mapper.user;

import com.fy.mobile.entity.user.Address;
import com.fy.mobile.entity.user.Order;
import org.apache.ibatis.annotations.Mapper;

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
}
