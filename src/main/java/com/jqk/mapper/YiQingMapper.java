package com.jqk.mapper;


import com.jqk.pojo.YiQing;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface YiQingMapper {
    int deleteByPrimaryKey(Integer code);

    int insert(YiQing record);

    int insertSelective(YiQing record);

    YiQing selectByPrimaryKey(Integer code);

    int updateByPrimaryKeySelective(YiQing record);

    int updateByPrimaryKey(YiQing record);

    @Select("select sum(confirmCount) from info  where code<35 ")
    int getCount();
    @Select("select sum(deadCount) from info  where code<35 ")
    int getDeadCount();
    @Select("select sum(curedCount) from info  where code<35 ")
    int getCuredCount();
    @Select("SELECT * from info where provinceName=#{name} LIMIT 1 ")
    YiQing getCountOne(String name);
    @Select("select * from info where code<35 ")
    List<YiQing> findList();
    @Select("SELECT DISTINCT * from info where provinceName=#{name}  and  areaName is not null LIMIT 21")
    List<YiQing> findCity(String name);

}