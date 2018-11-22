package com.xm.shop.test;

import com.xm.shop.entity.User;
import com.xm.shop.persistence.Result;
import com.xm.shop.service.UserService;
import com.xm.shop.webSupport.PageResult;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context.xml"})
public class UserTest {

    @Autowired
    private UserService userService;


//    @Test
//    public void testUserList(){
//        User user = new User();
//        user.setEmail("aa@a");     //查询单个   注释则查询全部
//        System.out.println(user);
//        Result result = userService.findList(user);
//        System.out.println(result.getData());
//
//    }


    @Test
    public void testpageList(){
        User user = new User();
        user.setUserName("zhan");
        Result result = userService.pageList(user);
        PageResult pageResult =(PageResult) result.getData();
        List<User> list = pageResult.getList();
        System.out.println(list);
    }
}
