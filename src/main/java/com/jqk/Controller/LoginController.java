package com.jqk.Controller;



import com.sun.deploy.net.HttpResponse;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Mr.X
 **/
//结果集返回名

@Controller
public class LoginController {
    //起始

    @RequestMapping("Start/startpage")
    public String page(){
        return "Yi/login";
    }

    @RequestMapping("Start/Login.do")
    public String login(String name, String password, Model map, HttpServletResponse httpResponse,HttpSession session){
        //当前对象
        Subject currentUser = SecurityUtils.getSubject();
        if (!currentUser.isAuthenticated()) {
            String msg = "";
            // 把用户名和密码封装为 UsernamePasswordToken 对象
            UsernamePasswordToken token = new UsernamePasswordToken(name, password);
            // remembermMe记住密码
            token.setRememberMe(true);
            Cookie cookie=new Cookie("username",name);
            httpResponse.addCookie(cookie);
            session.setAttribute("un",name);
            try {
                // 执行登录.
                currentUser.login(token);
                // 登录成功...
                return "Yi/index";
            } catch (IncorrectCredentialsException e) {
                msg = "登录密码错误";
                System.out.println("登录密码错误!!!" + e);
            } catch (ExcessiveAttemptsException e) {
                msg = "登录失败次数过多";
                System.out.println("登录失败次数过多!!!" + e);
            } catch (LockedAccountException e) {
                msg = "帐号已被锁定";
                System.out.println("帐号已被锁定!!!" + e);
            } catch (DisabledAccountException e) {
                msg = "帐号已被禁用";
                System.out.println("帐号已被禁用!!!" + e);
            } catch (ExpiredCredentialsException e) {
                msg = "帐号已过期";
                System.out.println("帐号已过期!!!" + e);
            } catch (UnknownAccountException e) {
                msg = "帐号不存在";
                System.out.println("帐号不存在!!!" + e);
            } catch (UnauthorizedException e) {
                msg = "您没有得到相应的授权！";
                System.out.println("您没有得到相应的授权！" + e);
            } catch (Exception e) {
                System.out.println("出错！！！" + e);
            }
            map.addAttribute("msg", msg);
            return "Yi/login";
        }
        // 登录成功，重定向到LoginSuccess.action
        return "Yi/login";
    }
  @RequestMapping("Start/loginout.do")
  public String Loginout(){
      Subject subject= SecurityUtils.getSubject();
      subject.logout();
      return "redirect:/Start/startpage";
  }
@RequestMapping("Start/error")
    public String error(){
        return "error/error";
}
//success
    @RequestMapping("Start/success")
    public String success(){
        return "Yi/index";
    }
    }




