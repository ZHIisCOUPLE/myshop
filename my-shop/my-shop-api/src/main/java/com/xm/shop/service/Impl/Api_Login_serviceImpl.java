package com.xm.shop.service.Impl;

import com.xm.shop.dao.Api_LoginDao;
import com.xm.shop.entity.User;
import com.xm.shop.service.Api_Login_service;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

@Service
public class Api_Login_serviceImpl implements Api_Login_service {

    @Autowired
    private Api_LoginDao api_loginDao;

    /**
     * 通过 邮箱 密码查询用户
     *
     * @param email
     * @param password
     * @return
     */
    @Override
    public User getByEmailAndPassword(String email, String password) {

        if(StringUtils.isNotBlank(password)){
            password= DigestUtils.md5DigestAsHex(password.getBytes());
        }
        return api_loginDao.getByEmailAndPassword(email,password);

    }
}
