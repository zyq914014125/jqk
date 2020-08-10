package com.jqk.mapper;


import com.jqk.pojo.User;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ZyqUserMapper {
    int deleteByPrimaryKey(Long userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    @Update("update sys_user set ispick=1 where user_Id=#{userId}")
    int updateIsPick(Long userId);
    @Update("update sys_user set ispick=0")
    int updateIsUnPick();
    @Select("select user_id as userId,user_name as userName from sys_user where ispick=0")
    List<User> getUnPick();

    @Select("select user_id as userId,login_name as userName,password from sys_user where login_name=#{username}")
    User selectByName(String username);
}