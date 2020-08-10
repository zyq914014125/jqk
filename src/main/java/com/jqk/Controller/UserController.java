package com.jqk.Controller;


import com.jqk.Service.ISysUserService;
import com.jqk.pojo.User;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import sun.security.util.Password;

import javax.servlet.http.HttpSession;
import java.util.HashMap;


//@PostMapping是一个组合注解，是@RequestMapping(method = RequestMethod.POST)的缩写。
// @ResponseBody 作用：将controller的方法返回的对象通过适当的转换器转换为指定的格式之后，写入到response对象的body区，通常用来返回JSON数据或者是XML数据。

@Controller
@RequestMapping("y")
public class UserController {
    @Autowired
    private ISysUserService userService;

    //user列表页面
    @RequestMapping("info")
    public String info() {

        return "userInfo/profile";
    }

    @RequestMapping("list")
    @ResponseBody
    public HashMap<String, Object> list(HttpSession session) {
        String userName = (String) session.getAttribute("un");
        HashMap<String, Object> map = new HashMap<>();
        System.out.println("执行此方法了！");
        User user = userService.selectByPrimaryKey(userName);
        System.out.println(user.toString());
        map.put("data", user);
        return map;
    }

    @RequestMapping("updateInfo")
    @ResponseBody
    public HashMap<String, Object> updateInfo(User user) {
        //System.out.println(userId);
        System.out.println("执行 updateInfo 方法了!!!");
        HashMap map = new HashMap();
        if (userService.updateByPrimaryKeySelective(user) > 0) {
            //userService.selectByPrimaryKey(userId);
            map.put("info", true);
        } else {
            map.put("info", false);
        }
        return map;
    }


    @PostMapping("resetPwd")
    @ResponseBody
    public String resetPwd(@RequestParam("newPassword") String newPassword, @RequestParam("userId") Long userId, @RequestParam("loginName") String loginName) {
        System.out.println(newPassword + "-----");
        System.out.println(userId + "-----");
        System.out.println(loginName + "-----");
        String algorithmName = "MD5";
        //设置待加密的原密码
        Object source = newPassword;
        //设置加盐方式(一般来说都是以用户名来加盐)
        Object salt = ByteSource.Util.bytes(loginName);
        //加密次数
        int hashIterations = 1024;
        String newPwd = new SimpleHash(algorithmName, source, salt, hashIterations).toString();
//         newPwd = newPasswordd.toString();
        System.out.println(newPwd);
        if (userService.resetPwd(newPwd, userId) > 0) {
            return "修改成功";
        } else {
            return "修改失败";
        }

     /*   User user =ShiroUtils.getUser();
        if(StringUtils.isNotEmpty(newPassword)&& passwordService.matches(user,oldPassword)){
            user.setSalt(ShiroUtils.randomSalt());
            user.setPassword(passwordService.encryptPassword(user.getLoginName(),newPassword,user.getSalt()));
            if(userService.resetUserPwd(user)>0){
                ShiroUtils.setUser(userService.selectByPrimaryKey(user.getUserId()));
                return success();
            }else{
                return error();
            }
        }else{
            return error("修改密码失败");
        }*/
    }
}
