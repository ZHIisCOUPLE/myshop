package com.xm.shop.controller;

import com.alibaba.fastjson.JSON;
import com.xm.shop.entity.TbContentCategory;
import com.xm.shop.persistence.BaseController;
import com.xm.shop.persistence.Result;
import com.xm.shop.service.TbContentCategoryService;
import com.xm.shop.webSupport.Page;
import com.xm.shop.webSupport.PageResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.util.List;

@Controller
@RequestMapping("/category")
public class TbContentCategoryController extends BaseController<TbContentCategoryService, TbContentCategory> {

//编历数据
    @RequestMapping("/list")
    public String getList(TbContentCategory tbContentCategory, Page page, @ModelAttribute("message")String message,Model model){
        tbContentCategory.setPage(page);
        Result result = service.pageList(tbContentCategory);
        model.addAttribute("result",result);
        model.addAttribute("list",((PageResult)result.getData()).getList());
        model.addAttribute("category",tbContentCategory);
        model.addAttribute("message",message);
        return "tbContentcategory/main";
    }
//回显数据   或者  输入数据
    @RequestMapping("/addcategory")
    public String getaddAndEdtijsp(Long id,Model model){
        if (id != null && id.longValue()>0){
            TbContentCategory category = service.getByid(id);
            model.addAttribute("category",category);
        }
        return "tbContentcategory/addcategory";
    }
//添加+修改
    @RequestMapping("/add")
    public String getaddAndEdti(TbContentCategory category, RedirectAttributes redirectAttributes, Model model){
        Result result=null;

        //修改
        if (category.getId() != null && category.getId().longValue()>0){
            result = service.update(category);
            redirectAttributes.addFlashAttribute("message","编辑成功!");
            if (result.getStatus()==Result.SUCCESS_STATUS){
                return "redirect:/category/list";
            }else {
                model.addAttribute("errorMessage",result.getMessage());
                return "tbContentcategory/addcategory";
            }


       //添加
        }else {
            result= service.save(category);
            redirectAttributes.addFlashAttribute("message","编辑成功!");
            if (result.getStatus()==Result.SUCCESS_STATUS){
                return "redirect:/category/list";
            }else {
                model.addAttribute("errorMessage",result.getMessage());
                return "tbContentcategory/addcategory";
            }
        }
    }

//删除
    @RequestMapping("/delete")
    public String getdelete(Long id,RedirectAttributes redirectAttributes,Model model){
        Result result = service.delete(id);
        if (result.getStatus()==Result.SUCCESS_STATUS){
            redirectAttributes.addFlashAttribute("message","编辑成功!");
        }else {
            redirectAttributes.addFlashAttribute("message",result.getMessage());
        }
        return "redirect:/category/list";

    }

//方式2
    @RequestMapping(value="/treeData",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getTreeData(Long id){
// 方式一       返回json格式
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("application/json; charset=utf-8");


        if(id==null){
            id=0L;
        }
        List<TbContentCategory> childrenCategory = service.getChildrenCategory(id);

        System.err.println(childrenCategory);
        return JSON.toJSONString(childrenCategory);
    }

//树表
    @RequestMapping("/treeTable")
    public String getTreeTable(Model model){
        List<TbContentCategory> list = service.queryTreeTable();
        System.out.println(list.toString());
        model.addAttribute("list",list);
        return "tbContentcategory/treeTable";
    }

//    添加子节点
    @RequestMapping("/addCh")
    public String getAddCh(Long id,Model model){
        TbContentCategory parent=service.getByid(id);
        TbContentCategory category=new TbContentCategory();
        category.setParent(parent);
        model.addAttribute("category",category);
        return "tbContentcategory/addcategory";
    }
}
