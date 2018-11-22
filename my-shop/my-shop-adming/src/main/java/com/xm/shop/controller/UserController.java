package com.xm.shop.controller;

import com.xm.shop.entity.User;
import com.xm.shop.persistence.BaseController;
import com.xm.shop.persistence.Result;
import com.xm.shop.service.UserService;
import com.xm.shop.webSupport.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/user")
public class UserController extends BaseController<UserService,User> {

    /**
     *
     * @param user

     * @param model
     * @return
     */

    @RequestMapping("/list")
    public String getUser(User user, Page page, @ModelAttribute("message")String message, Model model){
//        Result result = service.findList(user);

        user.setPage(page);
       Result result = service.pageList(user);
        model.addAttribute("result",result);
        model.addAttribute("message",message);
        model.addAttribute("user",user);

        return "user/main";
    }

    @RequestMapping("/adduser")
    public String getadduserpage(Long id,Model model){
//跳转到回显数据页面  或者  跳转到添加数据页面
        User user = service.getByid(id);
        model.addAttribute("user",user);
        return "user/adduser";
    }

    /**
     * 添加用户
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/add")
    public String getadd(User user, RedirectAttributes redirectAttributes, Model model){

        Result result=null;
//修改
        if (user.getId() != null && user.getId().longValue()>0){
            result= service.update(user);
            if (result.getStatus()==Result.ERROR_STATUS){
                model.addAttribute("errorMessage",result.getMessage());
                System.out.println(result.getMessage());
                return "/user/adduser";
            }
            redirectAttributes.addFlashAttribute("message","编辑成功！");
            return "redirect:/user/list";
// 添加
        }else {
            result = service.save(user);
            if (result.getStatus()==Result.ERROR_STATUS){
                model.addAttribute("errorMessage",result.getMessage());
                System.out.println(result.getMessage());
                return "/user/adduser";
            }
        }
        redirectAttributes.addFlashAttribute("message","编辑成功！");
        return "redirect:/user/list";
    }

//删除
    @RequestMapping("/delete")
    public String getdelet(Long id ,RedirectAttributes redirectAttributes){

        service.delete(id);

        redirectAttributes.addFlashAttribute("message","编辑成功！");
        return "redirect:/user/list";
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @RequestMapping("/deleteMutil")
    @ResponseBody
    public String deleteMutil(String ids){
        if(ids!=null) {
            String[] idArray = ids.split(",");
            List<String> list=new ArrayList<>();
            for(String s:idArray){
                if(s!=null && s.trim().length()>0) {
                    list.add(s);
                }
            }
            service.deleteMutil(list);
        }
        return "success";
    }

}
