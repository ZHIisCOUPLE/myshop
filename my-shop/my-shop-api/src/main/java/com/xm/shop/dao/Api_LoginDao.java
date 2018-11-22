package com.xm.shop.dao;

import com.xm.shop.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface Api_LoginDao {

    /**
     * 通过 邮箱 密码查询用户
     * @param email
     * @param password
     * @return
     */
    User getByEmailAndPassword(@Param("email")String email, @Param("password")String password);
}
