package com.jqk.Service.Impl;


import com.jqk.Service.ISysUserService;
import com.jqk.mapper.UserMapper;
import com.jqk.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ISysUserServiceImpl implements ISysUserService {
    @Autowired
    private UserMapper um;
    @Override
    public List<User> selectUserList(User user) {
        return um.selectUserList(user);
    }

    @Override
    public User selectByLoginName(String loginName) {
        return um.selectByLoginName(loginName);
    }

    @Override
    public User selectByPrimaryKey(String userName) {
        return um.selectByPrimaryKey(userName);
    }
    @Override
    public int updateByPrimaryKeySelective(User user) {
        return um.updateByPrimaryKeySelective(user);
    }

    @Override
    public int resetUserPwd(User user) {
        return um.resetUserPwd(user);
    }

    @Override
    public int resetPwd(String newPwd,Long userId) {
//        System.out.println("业务层"+newPwd+userId);
        return um.resetPwd(newPwd,userId);
    }
}
