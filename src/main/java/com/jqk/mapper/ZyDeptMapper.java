package com.jqk.mapper;


import com.jqk.pojo.DeptTree;
import com.jqk.pojo.zyDept;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ZyDeptMapper {
    int deleteByPrimaryKey(Long deptId);

    int insert(zyDept record);

    int insertSelective(zyDept record);

    zyDept selectByPrimaryKey(Long deptId);

    int updateByPrimaryKeySelective(zyDept record);

    int updateByPrimaryKey(zyDept record);
    List<zyDept> selectAll();
    List<DeptTree> select();


    List<zyDept> selectByPid(int deptId);

    zyDept selectd(int deptId);
}