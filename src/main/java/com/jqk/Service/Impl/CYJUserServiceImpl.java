package com.jqk.Service.Impl;


import com.jqk.Service.CYJUserService;
import com.jqk.mapper.CYJUserMapper;
import com.jqk.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CYJUserServiceImpl implements CYJUserService {
    @Autowired
    CYJUserMapper um;

    @Override
    public List<User> selectAll(User user) {
        System.out.println(um.selectAll(user));

        return um.selectAll(user);
    }

    @Override
    public int addUser(User user) {
        return um.insertSelective(user);
    }

    @Override
    public int cyjStatus(long userId) {
        return um.cyjStatus(userId);
    }

    @Override
    public User cyjSelectUser(long userId) {
        return um.selectByPrimaryKey(userId);
    }

    @Override
    public int cyjUpdateUser(User user) {
        return um.updateByPrimaryKeySelective(user);
    }

    @Override
    public int cyjDelUser(long userId) {
        return um.deleteByPrimaryKey(userId);
    }

    @Override
    public int cyjDeleteUser(List<String> list) {
        return um.delAll(list);
    }
}
