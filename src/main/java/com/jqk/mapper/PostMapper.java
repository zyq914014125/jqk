package com.jqk.mapper;


import com.jqk.pojo.Post;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostMapper {
    int deleteByPrimaryKey(Long postId);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(Long postId);

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKey(Post record);

    /*@Select( "select * from sys_post")*/
    List<Post> query(Post post);

    int deleteAll(List<String> list);
}