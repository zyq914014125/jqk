package com.jqk.Service.Impl;


import com.jqk.Service.zyDeptService;
import com.jqk.mapper.ZyDeptMapper;
import com.jqk.pojo.DeptTree;
import com.jqk.pojo.zyDept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ZyDeptServiceImpl implements zyDeptService {
    @Autowired
    ZyDeptMapper deptMapper;
    @Override
    public int deleteByPrimaryKey(Long deptId) {
        return deptMapper.deleteByPrimaryKey(deptId);
    }

    @Override
    public int insert(zyDept record) {
        return deptMapper.insert(record);
    }

    @Override
    public int insertSelective(zyDept record) {
        return deptMapper.insertSelective(record);
    }

    @Override
    public zyDept selectByPrimaryKey(Long deptId) {
        return deptMapper.selectByPrimaryKey(deptId);
    }

    @Override
    public int updateByPrimaryKeySelective(zyDept record) {
        return deptMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(zyDept record) {
        return deptMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<zyDept> selectAll() {
        return deptMapper.selectAll();
    }

    @Override
    public List<DeptTree> select() {
        return deptMapper.select();
    }

    @Override
    public List<zyDept> selectByPid(int deptId) {
        return deptMapper.selectByPid(deptId);
    }

    @Override
    public zyDept selectd(int deptId) {
        return deptMapper.selectd(deptId);
    }
}
