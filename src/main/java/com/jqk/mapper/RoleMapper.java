package com.jqk.mapper;


import com.jqk.pojo.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleMapper {
    //单个删除
    int deleteByPrimaryKey(Long roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Long roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    //分页查询
    List<Role> selectByPage(Role role);
    //批量删除
    int portDelete(List<String> list);
}