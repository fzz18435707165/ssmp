package com.dj.ssmp.pojo;

import lombok.Data;

import java.util.List;

/**
 * 条件查询参数
 */
@Data
public class UserQuery {

    private String userName;
    private List<Integer> hobbys;
    private Integer sex;
    private Integer pageNo;
    private Integer pageSize = 3;
    private List<User> list;
}
