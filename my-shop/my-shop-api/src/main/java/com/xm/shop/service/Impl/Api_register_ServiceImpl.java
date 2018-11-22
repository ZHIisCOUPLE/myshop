package com.xm.shop.service.Impl;

import com.xm.shop.dao.Api_register_Dao;
import com.xm.shop.entity.User;
import com.xm.shop.persistence.Result;
import com.xm.shop.service.Api_register_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;

@Service
public class Api_register_ServiceImpl implements Api_register_Service {

    @Autowired
    private Api_register_Dao dao;

    @Override
    public Result getRegister(User user) {
        int userNameCount = dao.getUserNameCount(user.getUserName());
        if (userNameCount>0){
            return Result.fail("该用户名已存在！请从新输入！");
        }
        int email = dao.getEmail(user.getEmail());
        if (email>0){
            return Result.fail("该邮箱地址已经被注册，不能重复注册！");
        }
        int phoneCount = dao.getPhoneCount(user.getPhone());
        if (phoneCount>0){
            return Result.fail("该电话已经被其他用户使用，请更换号码！");
        }
        Date date = new Date();
        user.setUpdated(date);
        user.setCreated(date);
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        dao.save(user);
        return Result.success("注册成功！请进行登陆！","");
    }
}
