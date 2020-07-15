package com.dj.ssmp.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssmp.mapper.UserMapper;
import com.dj.ssmp.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    private UserMapper userMapper;

}
