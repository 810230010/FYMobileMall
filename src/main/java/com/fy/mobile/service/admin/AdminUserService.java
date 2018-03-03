package com.fy.mobile.service.admin;

import com.fy.mobile.entity.user.UserDTO;
import com.fy.mobile.mapper.admin.AdminUserMapper;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by usher on 2018/3/3.
 */
@Service
public class AdminUserService {
    @Autowired
    private AdminUserMapper adminUserMapper;
    /**
     * 获取所有用户
     * @return
     */
    public List<UserDTO> listAllUser(Integer page, Integer pageSize,String orderColumn, String orderType){
        PageHelper.startPage(page, pageSize);
        return adminUserMapper.listAllUser(orderColumn, orderType);
    }

    /**
     * 拉黑用户
     * @param userId
     */
    public void forbidUser(Integer userId) {
        adminUserMapper.changeUserState(userId, 0);
    }

    /**
     * 恢复用户
     * @param userId
     */
    public void recoverUser(Integer userId) {
        adminUserMapper.changeUserState(userId, 1);
    }
}
