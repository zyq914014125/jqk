package com.jqk.Service.Impl;


import com.jqk.mapper.PickMapper;
import com.jqk.mapper.ZyqUserMapper;
import com.jqk.pojo.Pick;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Mr.X
 **/
@Service
public class PickServiceImpl {
    @Autowired
    PickMapper pickMapper;
    @Autowired
    ZyqUserMapper zyqUserMapper;
    public String add(Pick pick) {
        System.out.println(pick);
        //检索重复打卡
        String wechat=pick.getWechatname();
        System.out.println(wechat);
        if(pickMapper.selectBywechatname(wechat)==null&&pick.getWechatname()!=null) {
            //当前时间导入
            Date date = new Date();
            pick.setDate(date);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
            System.out.println(dateFormat.format(date));
            pickMapper.insertSelective(pick);
            int s= zyqUserMapper.updateIsPick(Long.valueOf(pick.getUserid()));
            System.out.println("tttt"+s);
            return "success";
        }else
            return "你已经打过卡了或输入信息有误";

    }
}