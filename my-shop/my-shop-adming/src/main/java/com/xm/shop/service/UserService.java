package com.xm.shop.service;

import com.xm.shop.entity.User;
import com.xm.shop.persistence.BaseService;
import com.xm.shop.persistence.Result;

import java.util.List;

public interface UserService extends BaseService<User> {

    Result getlogin(String email, String password);


    /**
     * 删除多个id
     *
     * @param ids
     */

    void deleteMutil(List ids);

}
