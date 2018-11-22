package com.xm.shop.service.Impl;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.xm.shop.entity.User;
import com.xm.shop.persistence.Result;
import com.xm.shop.service.Web_register_Service;
import com.xm.shop.utils.HttpClientUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class Web_register_ServiceImpl implements Web_register_Service {

    @Override
    public Result register(User user, String pwd) {
        //先判断密码与确认密码是否一致  和  信息是否齐全
        if (StringUtils.isAnyBlank(user.getPassword(),pwd)){
            return Result.fail("密码和确认密码不能为空！");
        }
        if (!(StringUtils.equals(user.getPassword(),pwd))){
            return Result.fail("密码和确认密码不一致！");
        }
        if (StringUtils.isAnyBlank(user.getEmail(),user.getPhone(),user.getUserName())){
            return Result.fail("基本信息都不能为空！");
        }
//都对着进行赋值    并进行传递进行进一步验证
        Map<String,String> map = new HashMap<>();

        map.put("userName",user.getUserName());
        map.put("password",user.getPassword());
        map.put("email",user.getEmail());
        map.put("phone",user.getPhone());
        //拿到返回得到得信息
        String src = HttpClientUtils.post("http://localhost:8082/getRegister", map);

        return JSON.parseObject(src,new TypeReference<Result>(){});
    }
}
