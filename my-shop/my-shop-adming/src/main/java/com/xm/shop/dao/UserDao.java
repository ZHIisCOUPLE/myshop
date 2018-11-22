package com.xm.shop.dao;

import com.xm.shop.entity.User;
import com.xm.shop.persistence.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserDao extends BaseDao<User> {
    /**
     * 按邮箱密码查找
     * @param email
     * @param password
     * @return
     */
    User getByEmailAndPassword(@Param("email") String email, @Param("password") String password);

    /**
     * 按id查找
     * @param id
     * @return
     */
    User get(Long id);

    /**
     * 删除多个id
     *
     * @param ids
     */

    void deleteMutil(@Param("ids")List ids);

}
