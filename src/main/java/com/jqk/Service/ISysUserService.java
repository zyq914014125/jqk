package com.jqk.Service;



import com.jqk.pojo.User;

import java.util.List;

public interface ISysUserService {
     List<User> selectUserList(User user);

     User selectByLoginName(String loginName);

     User selectByPrimaryKey(String userId);

     int updateByPrimaryKeySelective(User user);

     int resetUserPwd(User user);

    int resetPwd(String newPwd, Long userId);

    //int updateInfoById(long userId);
}
