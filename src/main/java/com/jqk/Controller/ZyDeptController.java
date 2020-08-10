package com.jqk.Controller;


import com.jqk.Service.zyDeptService;
import com.jqk.pojo.zyDept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/system/dept")
public class ZyDeptController {
    private String qwe="system/dept/";
    @Autowired
    zyDeptService deptService;
    @GetMapping()
    public String dept(){
        return qwe+"dept";
    }


    @RequestMapping("list")
    @ResponseBody
    public List<zyDept> list(){
        List<zyDept> depts=deptService.selectAll();

        return depts;
    }

    @RequestMapping("one")
    @ResponseBody
    public zyDept one(int deptId){
        zyDept dept=deptService.selectd(deptId);

        return dept;
    }


    @GetMapping("tree")
    @ResponseBody
    public Map<String,List<zyDept>> tree(){
        List<zyDept> sons = deptService.selectByPid(101);
        List<zyDept> sons1 = deptService.selectByPid(102);
        List<zyDept> sons2 = deptService.selectByPid(201);
        List<zyDept> depts=deptService.selectAll();
        HashMap<String,List<zyDept>> map = new HashMap<>();
        map.put("dept",depts);
        map.put("sons",sons);
        map.put("sons1",sons1);
        map.put("sons2",sons2);

        return map;
    }


    @RequestMapping("update")
    @ResponseBody
    public List<zyDept> update(zyDept dept){
            deptService.updateByPrimaryKeySelective(dept);
            List<zyDept> depts=deptService.selectAll();

        return depts;
    }

    @RequestMapping("add")
    @ResponseBody
    public List<zyDept> add(zyDept dept){
        System.out.println(dept);
        dept.setCreateTime(new Date());
        deptService.insertSelective(dept);
        List<zyDept> depts=deptService.selectAll();

        return depts;
    }
    @RequestMapping("dele")
    @ResponseBody
    public List<zyDept> dele(Long deptId){
        System.out.println(deptId);
        deptService.deleteByPrimaryKey(deptId);
        List<zyDept> depts=deptService.selectAll();

        return depts;
    }

}
