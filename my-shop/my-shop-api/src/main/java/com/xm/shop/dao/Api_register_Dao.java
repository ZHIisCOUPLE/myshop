package com.xm.shop.dao;

import com.xm.shop.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface Api_register_Dao {
    /**
     * 查看是否含有该用户名的用户
     * @param userName
     * @return
     */
    int getUserNameCount(String userName);

    /**
     * 查看是否含有该电话号码的用户
     * @param phone
     * @return
     */
    int getPhoneCount(String phone);

    /**查看是否含有该邮箱地址的用户
     *
     * @param email
     * @return
     */
    int getEmail(String email);

    /**
     * 添加用户
     * @param user
     */
    void save(User user);
}
