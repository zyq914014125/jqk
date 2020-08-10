package com.jqk.Service.Impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jqk.Service.PostService;
import com.jqk.mapper.PostMapper;
import com.jqk.pojo.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

/**
 * ClassName: PostServiceImpl <br/>
 * Description: <br/>
 * date: 2020/8/4 15:14<br/>
 *
 * @author Acer-pc<br/>
 * @since JDK 1.8
 */

@Service
public class PostServiceImpl implements PostService {
    @Autowired
    private PostMapper dao;
    @Override
    public HashMap<String,Object> queryPost(Post post) {
        System.out.println("-------service----------------------------------------");
        //设置分页参数，页码和每页显示数
        PageHelper.startPage(post.getPage(),post.getRow());
//        System.out.println(post);
        //2. 查询定义的sql
        List<Post> list = dao.query(post);
        System.out.println("-------service----------------------------------------"+list);
        //3. 转换成分页对象
        PageInfo<Post> pageInfo = new PageInfo<Post>(list);
        //查询状态

        //构建数据类型
        HashMap<String,Object> map = new HashMap<String, Object>();
        map.put("list",pageInfo.getList());//当前页的集合
        map.put("count",pageInfo.getTotal());//总条数
        map.put("prePage",pageInfo.getPrePage());//上一页
        map.put("nextPage",pageInfo.getNextPage());//下一页
        map.put("indexPage",pageInfo.getFirstPage());//首页
        map.put("endPage",pageInfo.getLastPage());//尾页
        map.put("allPage",pageInfo.getPages());//总页码
        map.put("cutPage",pageInfo.getPageNum());//当前页

//        System.err.println("-----------------------------"+list.toString());
        return map;
    }

    @Override
    public int add(Post post) {
//        System.err.println("--------service  add--------------------------"+dao.updateByPrimaryKey(post)+post.toString());
        return dao.insertSelective(post);
    }

    //删除
    @Override
    public int delete(long postId) {
        return dao.deleteByPrimaryKey(postId);
    }

    @Override
    public int update(Post post) {
        Post se = dao.selectByPrimaryKey(post.getPostId());
        try {
            post.setCreateTime(se.getCreateTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return dao.updateByPrimaryKeySelective(post);
    }

    @Override
    public int deleteAll(List<String> list) {
        return dao.deleteAll(list);
    }

}
