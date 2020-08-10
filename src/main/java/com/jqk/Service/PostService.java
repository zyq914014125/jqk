package com.jqk.Service;



import com.jqk.pojo.Post;

import java.util.HashMap;
import java.util.List;

/**
 * ClassName: PostService <br/>
 * Description: <br/>
 * date: 2020/8/4 15:14<br/>
 *
 * @author Acer-pc<br/>
 * @since JDK 1.8
 */
public interface PostService {
    HashMap<String,Object> queryPost(Post post);

    int add(Post post);

    int delete(long postId);

    int update(Post post);

    int deleteAll(List<String> list);

    /*List<Post> query();*/
}
