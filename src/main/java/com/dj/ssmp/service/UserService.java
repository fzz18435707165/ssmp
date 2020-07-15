package com.dj.ssmp.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssmp.pojo.User;

/**
 * Service接口可以继承IService（非必须继承），
 * 该接口中有MP封装的许多方便使用的接口，如批量操作、分页等实用操作。
 */
public interface UserService extends IService<User> {

}
