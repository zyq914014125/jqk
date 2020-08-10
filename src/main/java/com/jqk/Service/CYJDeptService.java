package com.jqk.Service;


import com.jqk.pojo.DeptTree2;
import com.jqk.pojo.cyjDept;

import java.util.List;

public interface CYJDeptService {
    List<DeptTree2> selectAll();

    long selectDeptIdByDeptName(cyjDept dept);

    List<cyjDept> selectDeptList(cyjDept dept);
}
