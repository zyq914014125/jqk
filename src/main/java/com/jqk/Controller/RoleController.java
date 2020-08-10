package com.jqk.Controller;


import com.jqk.Service.RoleService;
import com.jqk.pojo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/**
 * ClassName: RoleController <br/>
 * Description: <br/>
 * date: 2020/8/3 15:42<br/>
 *
 * @author FEI FEI<br/>
 * @since JDK 1.8
 */
@Controller
@RequestMapping("whc")
public class RoleController {
    @Autowired
    private RoleService roleService;

    //跳转到role页面
    @GetMapping("/jumpRoleList")
    public String jumpRoleList() {
        return "system/role/role";
    }

    //列出信息
    @GetMapping("/list")
    @ResponseBody
//    ,@RequestParam("endTime") String endTime,@RequestParam("startTime") String startTime
    public HashMap<String, Object> list(Role role) {
//        System.out.println("我进到控制层了");
        System.out.println(role);
//        System.out.println(endTime);
//        System.out.println(startTime);
        return roleService.selectByPage(role);
    }

    //增加
    @GetMapping("/add")
    @ResponseBody
    public int add(Role role) {
        role.setStatus("0");
        return roleService.add(role);
    }

    //单个删除
    @GetMapping("/singleDelete")
    @ResponseBody
    public int singleDelete(long roleId) {
        return roleService.singleDelete(roleId);
    }

    //修改
    @GetMapping("/update")
    @ResponseBody
    public int update(Role role) {
//        System.err.println(role);
        return roleService.update(role);
    }

    //批量删除
    @GetMapping("/portDelete")
    @ResponseBody
    public HashMap portDelete(@RequestParam("roleId") String roleId) {
        List<String> list = Arrays.asList(roleId.split(","));
        System.out.println(list);
        HashMap hashMap = new HashMap();
        if (roleService.portDelete(list) > 0) {
            hashMap.put("info", true);
        } else {
            hashMap.put("info", false);
        }
        return hashMap;
    }
}
