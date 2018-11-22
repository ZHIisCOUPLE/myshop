package com.xm.shop.controller;

import com.xm.shop.service.Web_SlideShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class Web_Index_Controller {

    @Autowired
    private Web_SlideShowService webSlideShowService;

    @RequestMapping("")
    public String getindex(Model model){
        /**
         * 拿到图片名  并把其传递到首页
         */
        List<String> slideShow = webSlideShowService.getSlideShow();
        model.addAttribute("slideShow",slideShow);
        return "index";
    }

    /**
     * 到达登陆页面
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String getLogin(){
        return "login";
    }


    /**
     * 跳转到注册页面
     * @return
     */
    @RequestMapping("/register")
    public String getregister(){
        return "register";
    }

}
