package com.xm.shop.controller;

import com.alibaba.fastjson.JSON;
import com.xm.shop.entity.User;
import com.xm.shop.persistence.Result;
import com.xm.shop.service.Api_Login_service;
import com.xm.shop.service.Api_SlideShowService;
import com.xm.shop.service.Api_register_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.OutputStream;
import java.util.List;

@Controller
public class Api_Controller {

    @Autowired
    private Api_Login_service apiLoginService;

    @Autowired
    private Api_SlideShowService apiSlideShowService;

    @Autowired
    private Api_register_Service apiRegisterService;
    /**
     *              验证登陆
     * @param email
     * @param password
     * @return
     */
    @RequestMapping(value = "/apilogin",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String getApilogin(String email,String password){

        User user=apiLoginService.getByEmailAndPassword(email,password);
        if (user!=null){
            return JSON.toJSONString(user);
        }else {
            return "";
        }
    }

    /**
     * 传递图片名
     * @return
     */
    @RequestMapping(value = "/getSlideShow",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String getSlideShow(){
        List<String> slideShow = apiSlideShowService.getSlideShow();
        return JSON.toJSONString(slideShow);
    }



    @RequestMapping(value = "/getRegister",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String getRegister(User user){
        Result result = apiRegisterService.getRegister(user);
        return JSON.toJSONString(result);
    }



}
