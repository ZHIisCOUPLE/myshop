package com.xm.shop.service.Impl;


import com.xm.shop.dao.UserDao;
import com.xm.shop.entity.User;
import com.xm.shop.persistence.BaseServiceImpl;
import com.xm.shop.persistence.Result;
import com.xm.shop.service.UserService;
import com.xm.shop.utils.BeanValidator;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.List;


@Service
public class UserServiceImpl extends BaseServiceImpl<User ,UserDao> implements UserService {

    /**
     * 登陆验证
     *
     *
     * @param email
     * @param password
     * @return
     */

    @Override
    public Result getlogin(String email, String password) {


        if(StringUtils.isBlank(password)){
            return Result.fail("密码不能为空！");
        }
 //对密码进行加密
        password = DigestUtils.md5DigestAsHex(password.getBytes());

        User user = dao.getByEmailAndPassword(email, password);
        if (user != null){
            return Result.success("",user);
        }
        return Result.fail("邮箱或密码错误！");
    }

    @Override
    @Transactional
    public Result save(User user) {
        //先对输入的信息进行校验
        //如果用户添加的信息正确，则返回值message为空`
        String message = BeanValidator.validator(user);
        if (StringUtils.isNotBlank(message)){
            return Result.fail(message);
        }


        if (StringUtils.isNotBlank(user.getPassword())){
  //对密码进行加密
            user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        }
        return super.save(user);
    }

    /**
     * 删除多个id
     *
     * @param ids
     */
    @Override
    public void deleteMutil(List ids) {
        dao.deleteMutil(ids);
    }

}
