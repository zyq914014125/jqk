package com.jqk.mapper;


import com.jqk.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CYJUserMapper {

    int deleteByPrimaryKey(Long userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<User> selectAll(User user);

    int cyjStatus(long userId);

    int delAll(List<String> list);
}