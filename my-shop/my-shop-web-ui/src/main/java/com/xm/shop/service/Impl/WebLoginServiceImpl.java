package com.xm.shop.service.Impl;

import com.alibaba.fastjson.JSON;
import com.xm.shop.entity.User;
import com.xm.shop.service.WebLoginService;
import com.xm.shop.utils.HttpClientUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class WebLoginServiceImpl implements WebLoginService {

    @Override
    public User queryByEmailAndPassword(String email, String password) {
        Map<String ,String > param=new HashMap<>();
        param.put("email",email);
        param.put("password",password);
        String result= HttpClientUtils.post("http://localhost:8082/apilogin",param);
        //如果返回空字符串，没有查询出来，否则转成user对象
        if(StringUtils.isBlank(result)){
            return null;
        }else {
            return JSON.parseObject(result,User.class);
        }

    }
}
