package com.xm.shop.controller;

import com.xm.shop.entity.User2;
import com.xm.shop.persistence.BaseController;
import com.xm.shop.persistence.Result;
import com.xm.shop.service.UserService2;
import com.xm.shop.webSupport.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user2")
public class UserController2 extends BaseController<UserService2, User2> {

    @RequestMapping("/list")
    public String getlist(User2 user2, Page page, Model model){
        user2.setPage(page);
        Result result = service.pageList(user2);
        model.addAttribute("result",result);
        return "user/main";
    }

}
