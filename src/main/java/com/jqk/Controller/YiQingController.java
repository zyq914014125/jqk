package com.jqk.Controller;


import com.jqk.pojo.FusingPickUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jqk.Service.Impl.YiQingServiceImpl;

import java.util.List;
import java.util.Map;

/**
 * @author Mr.X
 **/
@Controller
@RequestMapping("Yi")
public class YiQingController {
    @Autowired
    YiQingServiceImpl yiQingService;
    //初始化：
    @RequestMapping("yiqing")
    public String ini(Model model){
        List<FusingPickUser>  list=yiQingService.getAllPick();
        model.addAttribute("list",list);
        return "Yi/yiqing";
    }
    //获取总数
    @RequestMapping("selectConfirmCount.do")
    @ResponseBody
    public int selectCount(){
        return yiQingService.selectConfirmCount();
    }
    //各省总情况
    @RequestMapping("yiqingfenxi.do")
    @ResponseBody
    public List<Map<String,String>> yiqingfenxi(){
        return yiQingService.yiqingfenxi();
    }
    //单省总情况
    @RequestMapping("yiqingfenxiByName.do")
    @ResponseBody
    public List<Map<String,String>> yiqingfenxiByName(String name){
        return yiQingService.yiqingfenxiByName(name);
    }
    //各省情况
    @RequestMapping("selectInfoAllName.do")
    @ResponseBody
    public List<Map<String,String>> selectInfoAllName(){
        return yiQingService.selectInfoAllName();
    }
    //获取单省各城市感染
    @RequestMapping("selectAllConfrimCountByName.do")
    @ResponseBody
    public List<Map<String,String>>  selectConfirmCountByName(String name){
        return yiQingService.selectAllConfrimCountByName(name);
    }
    @RequestMapping("yiqingreset")
    public String reset(Model model){
       yiQingService.reset();
        return "Yi/yiqing";
    }
}
