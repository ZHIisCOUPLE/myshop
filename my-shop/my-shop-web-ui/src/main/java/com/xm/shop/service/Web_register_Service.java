package com.xm.shop.service;

import com.xm.shop.entity.User;
import com.xm.shop.persistence.Result;

public interface Web_register_Service {

    Result register(User user,String pwd);
}
