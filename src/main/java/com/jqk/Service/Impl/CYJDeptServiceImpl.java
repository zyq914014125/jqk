package com.jqk.Service.Impl;


import com.jqk.Service.CYJDeptService;
import com.jqk.mapper.CYJDeptMapper;
import com.jqk.pojo.DeptTree2;
import com.jqk.pojo.cyjDept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CYJDeptServiceImpl implements CYJDeptService {

    @Autowired
    CYJDeptMapper dm;

    @Override
    public List<DeptTree2> selectAll() {
        System.out.println(dm.selectAll());
        return dm.selectAll();
    }

    @Override
    public long selectDeptIdByDeptName(cyjDept dept) {
        cyjDept depts = dm.selectDeptIdByDeptName(dept);

        return   depts.getDeptId();
    }

    @Override
    public List<cyjDept> selectDeptList(cyjDept dept) {
        return dm.selectDeptList(dept);
    }
}
