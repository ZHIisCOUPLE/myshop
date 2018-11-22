package com.xm.shop.controller;


import com.google.code.kaptcha.Producer;
import com.xm.shop.entity.User;
import com.xm.shop.persistence.BaseController;
import com.xm.shop.persistence.Result;
import com.xm.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController extends BaseController<UserService , User> {




    @RequestMapping("")
    public String login(){
        return "index";
    }

    @RequestMapping(value = "/login" , method = RequestMethod.POST)
    public String Login(String email, String password, Model model, HttpSession session){
        Result result = service.getlogin(email, password);
        if(Result.ERROR_STATUS==result.getStatus()){
            model.addAttribute("mennage",result.getStatus());
            return "index";
        }else {
            session.setAttribute("user",result.getData());
            return "redirect:/user/list";
        }

    }
}
