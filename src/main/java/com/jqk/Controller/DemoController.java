package com.jqk.Controller;


import com.jqk.Service.PostService;
import com.jqk.pojo.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * ClassName: DemoController <br/>
 * Description: <br/>
 * date: 2020/8/3 15:04<br/>
 *
 * @author Acer-pc<br/>
 * @since JDK 1.8
 */
//@ResponseBody 表示这个类的所有方法访问的数据直接写给浏览器（如果是对象也能转为json数据）
/*@ResponseBody
@Controller*/
@Controller
@RequestMapping("qw")
public class DemoController extends Cors {
    @Autowired
    private PostService service;

    @RequestMapping("/hello")
    public String hello(){
        return "post/vive";
    }

    //列表页面
    @RequestMapping("/list")
    @ResponseBody
    public HashMap<String,Object> list(Post post){
//        System.err.println("-----------controller()--------------------------------------------------------------------------------");
       HashMap<String,Object> select =  service.queryPost(post);
        System.err.println(select.values());
//        map.addAttribute("dict",dictDao.selectByPrimaryKey());

        return select;
    }
    //增加
    @RequestMapping("/add")
    @ResponseBody
    public int add(Post post) throws ParseException {
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dates = df.format(date);
        post.setCreateTime(dates);
//        System.err.println("-----con  add-----------------------"+service.add(post)+post.toString());
        int info = service.add(post);
//        System.err.println("---------con  add-------------------------------"+info);
        return info;
    }
    //删除
    @RequestMapping("/delete")
    @ResponseBody
    public int delete(long postId) {
        int info = service.delete(postId);
//        System.err.println("---------con  delete-------------------------------"+info);
        return info;
    }
    //修改
    @RequestMapping("/update")
    @ResponseBody
    public int update(Post post) {
//        System.err.println("---------con  update-------------------------------"+post.getCreateTime());
        int info = service.update(post);
//        System.err.println("---------con  update-------------------------------"+info);

        return info;
    }
    //批量删除
    @RequestMapping("/deleteAll")
    @ResponseBody
    public int deleteAll(@RequestParam("id") String postId) {
        List<String> list = Arrays.asList(postId.split(","));
        return service.deleteAll(list);
    }
}
