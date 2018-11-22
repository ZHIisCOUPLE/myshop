package com.xm.shop.service;

import com.xm.shop.entity.User;

public interface Api_Login_service {

    /**
     * 通过 邮箱 密码查询用户
     * @param email
     * @param password
     * @return
     */
    User getByEmailAndPassword(String email, String password);
}
