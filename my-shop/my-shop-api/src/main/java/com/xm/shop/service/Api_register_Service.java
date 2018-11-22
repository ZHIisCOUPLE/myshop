package com.xm.shop.service;

import com.xm.shop.entity.User;
import com.xm.shop.persistence.Result;

public interface Api_register_Service {

    Result getRegister(User user);
}
