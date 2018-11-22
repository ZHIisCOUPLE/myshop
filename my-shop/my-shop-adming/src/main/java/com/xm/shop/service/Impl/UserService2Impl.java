package com.xm.shop.service.Impl;

import com.xm.shop.dao.UserDao2;
import com.xm.shop.entity.User2;
import com.xm.shop.persistence.BaseServiceImpl;
import com.xm.shop.service.UserService2;
import org.springframework.stereotype.Service;

@Service
public class UserService2Impl extends BaseServiceImpl<User2, UserDao2> implements UserService2 {
}
