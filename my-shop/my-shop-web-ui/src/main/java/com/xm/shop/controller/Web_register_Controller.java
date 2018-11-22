package com.xm.shop.controller;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.xm.shop.entity.User;
import com.xm.shop.persistence.Result;
import com.xm.shop.service.Web_register_Service;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.OutputStream;

@Controller
public class Web_register_Controller {

    @Autowired
    private Web_register_Service webRegisterService;

    /**
     *             注册得到的数据
     * @param user     用户名 密码  电话  邮箱
     * @param pwd      确认密码
     * @param vCode      验证码
     * @param model
     * @param redirectAttributes
     * @return
     */

    @RequestMapping("/registerLaset")
    public String getregisterLaset(User user, String pwd, String vCode, HttpSession session, Model model, RedirectAttributes redirectAttributes){

        if (StringUtils.isBlank(vCode)){
            model.addAttribute("message","验证码不能为空!");
            return "register";
        }
//拿到生成的验证码
        String code = (String)session.getAttribute(Constants.KAPTCHA_SESSION_KEY);

        if (code.equals(vCode)){
            model.addAttribute("message","验证码错误!");
            return "register";
        }

        Result result = webRegisterService.register(user, pwd);

        if (result.getStatus()==Result.ERROR_STATUS){
            model.addAttribute("message",result.getMessage());
            return "register";
        }else {
            model.addAttribute("message",result.getMessage());
            return "login";
        }

    }


    @Autowired
    private Producer producer;


    /**
     * 产生验证码
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/kaptcha")
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception{
        response.setDateHeader("Expires",0);//过期时间（缓存时间）设置为0 0表示不缓存
        //清除缓存，禁止浏览器缓存图片
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");

        response.setContentType("image/jpeg");//设置返回数据类型是jpg
        String capText = producer.createText();//创建一个验证码
        //把验证码保存到session
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);//将验证码放到session里面
        BufferedImage bi = producer.createImage(capText);//画出图片
        //输出
        OutputStream out = response.getOutputStream();
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
        return null;
    }

}
