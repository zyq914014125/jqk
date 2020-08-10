package com.jqk.mapper;


import com.jqk.pojo.Department;
import org.springframework.stereotype.Repository;

@Repository
public interface DepartmentMapper {
    int deleteByPrimaryKey(Long deptId);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Long deptId);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
}