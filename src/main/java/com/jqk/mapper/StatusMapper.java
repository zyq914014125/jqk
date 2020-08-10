package com.jqk.mapper;


import com.jqk.pojo.Status;

public interface StatusMapper {
    int deleteByPrimaryKey(Integer statusId);

    int insert(Status record);

    int insertSelective(Status record);

    Status selectByPrimaryKey(Integer statusId);

    int updateByPrimaryKeySelective(Status record);

    int updateByPrimaryKey(Status record);
}