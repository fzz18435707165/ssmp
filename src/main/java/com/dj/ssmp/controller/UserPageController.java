package com.dj.ssmp.controller;

import com.dj.ssmp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/")
public class UserPageController {

    @Autowired
    private UserService userService;

    /**
     * 展示
     */
    @RequestMapping("toShow")
    public String toShow(){
        return "show";
    }

    /**
     * 批量新增
     */
    @RequestMapping("toManyAdd")
    public String toManyAdd(){
        return "many_add";
    }

    /**
     * 新增
     */
    @RequestMapping("toAdd")
    public String toAdd(){
        return "add";
    }

    /**
     * 去修改
     */
    @RequestMapping("toUpdate/{id}")
    public String toUpdate(@PathVariable Integer id, Model model){
        model.addAttribute("user",userService.getById(id));
        return "update";
    }
}
