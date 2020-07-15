package com.dj.ssmp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.ssmp.pojo.User;

/**
 * Mapper接口必继承BaseMapper（如果不继承相当于没有使用MP），该接口中有MP提供的基础单表CRUD的操作。
 */
public interface UserMapper extends BaseMapper<User> {
}
