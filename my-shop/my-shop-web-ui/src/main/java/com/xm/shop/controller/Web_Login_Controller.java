package com.xm.shop.controller;

import com.xm.shop.entity.User;
import com.xm.shop.service.WebLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class Web_Login_Controller {

    @Autowired
    private WebLoginService webLoginService;

    @RequestMapping(value = "/frontLogin",method = RequestMethod.POST)
    public String login(Model model, String email, String password, HttpSession session){
        User user=webLoginService.queryByEmailAndPassword(email,password);
        if(user!=null) {
            session.setAttribute("user",user);
            model.addAttribute("message", "登录成功！");
            return "index";
        }else {
            model.addAttribute("message", "登录失败！");
            return "login";
        }

    }
}
