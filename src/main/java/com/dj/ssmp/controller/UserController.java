package com.dj.ssmp.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.ssmp.pojo.ResultModel;
import com.dj.ssmp.pojo.User;
import com.dj.ssmp.pojo.UserQuery;
import com.dj.ssmp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
@RequestMapping("/user/")
public class UserController {


    @RequestMapping("hello")
    public String hello(){
        return "hello";
    }
    @Autowired
    private UserService userService;

    /**
     * 展示
     */
    @RequestMapping("show")
    public ResultModel show(UserQuery userQuery){
        Map<String,Object> map=new HashMap<>();
        try {
            //当前页，每页条数
            IPage iPage = new Page(userQuery.getPageNo(),userQuery.getPageSize());
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            if (userQuery.getSex() != null){
                queryWrapper.eq("sex",userQuery.getSex());
            }
            if (!userQuery.getUserName().isEmpty()){
                queryWrapper.like("user_name",userQuery.getUserName());
            }
            if (userQuery.getHobbys() !=null) {
                    queryWrapper.in("hobby", userQuery.getHobbys());
            }
            IPage pageInfo = userService.page(iPage, queryWrapper);
            map.put("pages",pageInfo.getPages());//总页数
            map.put("list",pageInfo.getRecords());//数据结果
            return new ResultModel().success(map);
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("服务器异常，请稍后再试");
        }
    }

    /**
     * 新增
     */
    @RequestMapping("addUser")
    public ResultModel addUser(User user) {
        try {
            userService.save(user);
            return new ResultModel().success("新增成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常，请稍后再试");
        }
    }

    /**
     * 批量新增
     */
    @RequestMapping("addManyUser")
    public ResultModel<User> addManyUser(UserQuery userQuery){
        try {
            List<User> list = new ArrayList<User>();
            for (User user : userQuery.getList()) {
                if (StringUtils.isEmpty(user.getUserName())) {
                    continue;
                }
                list.add(user);
            }
            userService.saveBatch(list);
            return new ResultModel<>().success("添加成功");
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常，请稍后再试");
        }
    }

    /**
     * 修改
     */
    @RequestMapping("updateUser")
    public ResultModel<User> updateUser(User user){
        try {
            //id必有
            userService.updateById(user);
            return new ResultModel<>().success("修改成功");
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常，请稍后再试");
        }
    }

    /**
     * 删除
     */
    @RequestMapping("deleteUser/{id}")
    public ResultModel<User> deleteUser(@PathVariable Integer id){
        try {
            userService.removeById(id);
            return new ResultModel<>().success("删除成功");
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常，请稍后再试");
        }
    }


    /**
     * 批量删除
     */
    @RequestMapping("deleteManyUser")
    private ResultModel deleteManyUser(@RequestParam("ids[]") Integer[] ids){
        try {
            List<Integer> list = Arrays.asList(ids);
            userService.removeByIds(list);
            return new ResultModel<>().success("删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常，请稍后再试");
        }
    }


}
