package com.jqk.Service.Impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jqk.Service.RoleService;
import com.jqk.mapper.RoleMapper;
import com.jqk.pojo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * ClassName: RoleServiceImpl <br/>
 * Description: <br/>
 * date: 2020/8/4 9:45<br/>
 *
 * @author FEI FEI<br/>
 * @since JDK 1.8
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public HashMap<String, Object> selectByPage(Role role) {
//        System.out.println("我到业务层了");
        //设置每页要显示的数据和行数
        PageHelper.startPage(role.getPage(), role.getRow());
        //获取每页要显示的数据
        List<Role> list = roleMapper.selectByPage(role);
        System.err.println(list);
        //将数据封装到pageInfo对象中
        PageInfo<Role> pageInfo = new PageInfo<Role>(list);
        //构建数据类型
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("list", pageInfo.getList());
        //数据总条数
        map.put("count", pageInfo.getTotal());
        //上一页
        if (pageInfo.getPrePage() != 0) {
            map.put("prePage", pageInfo.getPrePage());
        } else {
            map.put("prePage", 1);
        }
        //下一页
        if (pageInfo.getPageNum() != pageInfo.getPages()) {
            map.put("nextPage", pageInfo.getNextPage());
        } else {
            map.put("nextPage", pageInfo.getPages());
        }
        //首页
        if (pageInfo.getFirstPage() != 0) {
            map.put("indexPage", pageInfo.getFirstPage());
        } else {
            map.put("indexPage", 1);
        }
        //尾页
        map.put("endPage", pageInfo.getLastPage());
        //每页的数据条数
        map.put("allPage", pageInfo.getPageSize());
        //当前页面
        if (pageInfo.getPageNum() != 0) {
            map.put("cutPage", pageInfo.getPageNum());
        } else {
            map.put("cutPage", 1);
        }
        //总页数
        if (pageInfo.getPages() != 0) {
            map.put("totalPage", pageInfo.getPages());
        } else {
            map.put("totalPage", 1);
        }
        return map;
    }

    //增加
    @Override
    public int add(Role role) {
        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String nowTime = simpleDateFormat.format(new Date());
            role.setCreateTime(nowTime);
            role.setUpdateTime(nowTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return roleMapper.insertSelective(role);
    }

    //单个删除
    @Override
    public int singleDelete(long roleId) {
        return roleMapper.deleteByPrimaryKey(roleId);
    }

    //修改
    @Override
    public int update(Role role) {
        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String nowTime = simpleDateFormat.format(new Date());
            role.setUpdateTime(nowTime);
            String createTime = roleMapper.selectByPrimaryKey(role.getRoleId()).getCreateTime();
            role.setCreateTime(createTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
//        System.out.println(role);
        return roleMapper.updateByPrimaryKeySelective(role);
    }
//批量删除
    @Override
    public int portDelete(List<String> list) {

        return roleMapper.portDelete(list);
    }
    //批量删除

}
