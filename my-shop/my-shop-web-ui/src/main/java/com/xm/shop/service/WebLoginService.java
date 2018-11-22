package com.xm.shop.service;

import com.xm.shop.entity.User;

public interface WebLoginService {

    User queryByEmailAndPassword(String email, String password);
}
