package com.jqk.mapper;


import com.jqk.pojo.DeptTree2;
import com.jqk.pojo.cyjDept;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CYJDeptMapper {
    int deleteByPrimaryKey(Long deptId);

    int insert(cyjDept record);

    int insertSelective(cyjDept record);

    cyjDept selectByPrimaryKey(Long deptId);

    int updateByPrimaryKeySelective(cyjDept record);

    int updateByPrimaryKey(cyjDept record);

    @Select("select dept_id as dId,parent_id as pId,dept_name as name from sys_dept")
    List<DeptTree2> selectAll();

    List<cyjDept> selectDeptList(cyjDept dept);

    cyjDept selectDeptIdByDeptName(cyjDept dept);
}