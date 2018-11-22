package com.xm.shop.controller;

import com.alibaba.fastjson.JSON;
import com.xm.shop.entity.TbContent;
import com.xm.shop.persistence.BaseController;
import com.xm.shop.persistence.Result;
import com.xm.shop.service.TbContentService;
import com.xm.shop.webSupport.Page;
import com.xm.shop.webSupport.PageResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/content")
public class TbContentCntroller extends BaseController<TbContentService, TbContent> {

    @RequestMapping("/main")
    public String getaddlTbcontent(TbContent content, Page page, @ModelAttribute("message")String message, Model model){

        content.setPage(page);
        Result result = service.pageList(content);

        model.addAttribute("list",((PageResult)result.getData()).getList());
        model.addAttribute("pageResult",result.getData());
        model.addAttribute("content",content);
        model.addAttribute("message",message);
        return "tbcontent/main";
    }

//回显数据  或者  跳转到添加数据页面
    @RequestMapping("/addAndUpFirst")
    public String getAddAndUpdateFirst(Long id,Model model){
        if (id!=null && id.longValue()>0){
            TbContent content = service.getByid(id);
            model.addAttribute("content",content);
        }
        return "tbcontent/addTbcontent";
    }
//添加或修改
    @RequestMapping("/addAndUpLast")
    public String getAddAndUpdateLast(TbContent content, RedirectAttributes redirectAttributes, Model model){

        Result result=null;
        if(content.getId()!=null&&content.getId().longValue()>0){
            result=service.update(content);
        }else {
            result=service.save(content);
        }
        if(result.getStatus()==Result.SUCCESS_STATUS) {
            redirectAttributes.addFlashAttribute("message", "编辑成功");
            return "redirect:/content/main";
        }else {
            model.addAttribute("errorMessage",result.getMessage());
            return "tbcontent/addTbcontent";
        }
    }


    /**
     * MultipartFile   的属性file代表了上传的表单域的name
     * @param dropFile
     * @return
     */
    @RequestMapping("/upload")
    @ResponseBody
    public String uplod(MultipartFile dropFile, HttpServletResponse response)throws Exception{
        response.setContentType("application/json;charset=utf-8");//指定返回数据的类型是json
        //response.setContentType("text/html;charset=utf-8");
        //获取原来的文件名
        String fileName=dropFile.getOriginalFilename();
        int index=fileName.lastIndexOf(".");
        String suffix=fileName.substring(index);
        fileName= UUID.randomUUID().toString().replaceAll("-","")+suffix;
        dropFile.transferTo(new File("d:/img/"+fileName));
        Map data=new HashMap();
        data.put("errno",0);
        data.put("data",new String[]{"/content/picShow?fileName="+fileName});
        data.put("path",fileName);
        return JSON.toJSONString(data);
    }



    /**
     * 用流的方式返回图片
     */
    @RequestMapping("/picShow")
    public void picShow(String fileName,HttpServletResponse response){
        InputStream inputStream=null;
        try {
            //添加contentType 告诉浏览器返回的数据类型
            //获取文件后缀
            int index=fileName.lastIndexOf(".");
            String suffix=fileName.substring(index+1);
            if("jpg".equals(suffix)){
                response.setContentType("image/jpeg");
            }else if("png".equals(suffix)){
                response.setContentType("image/png");
            }
            File file=new File("d:/img/"+fileName);
            inputStream=new FileInputStream(file);
            OutputStream outputStream=response.getOutputStream();
            byte[] buff=new byte[512];
            int k=0;//每次读完后返回读了多个字节
            while ((k=inputStream.read(buff))>0){
                outputStream.write(buff,0,k);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                if(inputStream!=null) {
                    inputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


}
