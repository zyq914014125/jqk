package com.jqk.Controller;


import com.jqk.Service.CYJDeptService;
import com.jqk.Service.CYJUserService;
import com.jqk.pojo.DeptTree2;
import com.jqk.pojo.User;
import com.jqk.pojo.cyjDept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("cyj")
public class jumpController {

    @Autowired
    CYJUserService us;
    @Autowired
    CYJDeptService ds;

    //跳转到用户界面，后面登录写了就直接换成主页按钮弹窗跳转即可
    @RequestMapping("cyjToUser")
    public String user(){

        return "user/userlist";
    }
    //跳转到新增用户界面
    @RequestMapping("cyjAddUser")
    public String addUser(){
        return "user/addUser";
    }

    //跳转到修改用户界面
    @RequestMapping("cyjCompileUser")
    public String compileUser(long userId, HttpSession session){
        session.setAttribute("cyjUserId",userId);
        return "user/edit";
    }

    //ajax请求用户表
    @RequestMapping("cyjUserList")
    @ResponseBody
    public List<User> index(User user){
        System.out.println("用户表");
        return us.selectAll(user);
    }

    //ajax请求部门表
    @RequestMapping("cyjDeptTree")
    @ResponseBody
    public List<DeptTree2> deptTree(){
        System.out.println("部门表");
        return  ds.selectAll();
    }
    //ajax请求部门表(添加用户表中)
    @RequestMapping("cyjDeptOption")
    @ResponseBody
    public List<cyjDept> selectDeptList(cyjDept dept){
        System.out.println("部门表");
        return  ds.selectDeptList(dept);
    }

    //树查询
    @RequestMapping("cyjSelectDeptIdByDeptName")
    @ResponseBody
    public long selectDeptIdByDeptName(cyjDept dept){
        System.out.println("树查询");
        return  ds.selectDeptIdByDeptName(dept);
    }

    //添加用户
    @RequestMapping("cyjAddUsers")
    @ResponseBody
    public int cyjAddUsers(User user){
        System.out.println(user);

        return  us.addUser(user);
    }
    //查询编辑用户
    @RequestMapping("cyjSelectUser")
    @ResponseBody
    public User cyjSelectUser(HttpSession session){
        long cyjUserId = (long) session.getAttribute("cyjUserId");
        System.out.println(cyjUserId);

        return  us.cyjSelectUser(cyjUserId);
    }
    //编辑用户
    @RequestMapping("cyjUpdateUser")
    @ResponseBody
    public int cyjUpdateUser(User user){

        System.out.println("编辑用户");

        return  us.cyjUpdateUser(user);
    }

    //停用启用用户
    @RequestMapping("cyjStatus")
    @ResponseBody
    public int cyjStatus(long userId){
        System.out.println(userId);

        return  us.cyjStatus(userId);
    }

    //删除用户
    @RequestMapping("cyjDelUser")
    @ResponseBody
    public int cyjDelUser(long userId){
        System.out.println(userId);

        return  us.cyjDelUser(userId);
    }
    //批量删除用户
    @RequestMapping("cyjDeleteUser")
    @ResponseBody
    public int cyjPortDelete(String userId){
        List<String> list = Arrays.asList(userId.split(","));
        System.out.println(list);

        return  us.cyjDeleteUser(list);
    }


}
