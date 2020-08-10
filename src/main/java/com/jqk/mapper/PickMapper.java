package com.jqk.mapper;


import com.jqk.pojo.Pick;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PickMapper {
    int deleteByPrimaryKey(Integer pickid);

    int insert(Pick record);

    int insertSelective(Pick record);

    Pick selectByPrimaryKey(Integer pickid);

    int updateByPrimaryKeySelective(Pick record);

    int updateByPrimaryKey(Pick record);

    @Select("select * from pick where wechatname=#{wechat}")
    Pick selectBywechatname(String wechat);
    @Select("select * from pick")
    List<Pick> getAllPick();
}