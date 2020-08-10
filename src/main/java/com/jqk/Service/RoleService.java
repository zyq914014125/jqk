package com.jqk.Service;


import com.jqk.pojo.Role;

import java.util.HashMap;
import java.util.List;

/**
 * ClassName: RoleService <br/>
 * Description: <br/>
 * date: 2020/8/4 9:45<br/>
 *
 * @author FEI FEI<br/>
 * @since JDK 1.8
 */
public interface RoleService {
    HashMap<String, Object> selectByPage(Role role);

    int add(Role role);

    int singleDelete(long roleId);

    int update(Role role);

    int portDelete(List<String> list);
}
