package com.jqk.Service;


import com.jqk.pojo.User;

import java.util.List;

public interface CYJUserService {

    List<User> selectAll(User user);

    int addUser(User user);

    int cyjStatus(long userId);

    User cyjSelectUser(long userId);

    int cyjUpdateUser(User user);

    int cyjDelUser(long userId);

    int cyjDeleteUser(List<String> list);
}
