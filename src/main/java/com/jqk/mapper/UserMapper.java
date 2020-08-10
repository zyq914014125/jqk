package com.jqk.mapper;


import com.jqk.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Long userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userName);

    @Update("update sys_user set user_name=#{userName},phonenumber=#{phonenumber},email=#{email},sex=#{sex} where user_id=#{userId}")
    int updateByPrimaryKeySelective(User user);

    int updateByPrimaryKey(User record);

    List<User> selectUserList(User user);

    User selectByLoginName(String loginName);

    int updateInfoById(Long userId);

    int resetUserPwd(User user);

//    @Update("update sys_user set password=#{newPwd} where user_id=#{userId}")
    int resetPwd(@Param("newPwd") String newPwd, @Param("userId") Long userId);
}