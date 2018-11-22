package com.xm.shop.service.Impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.xm.shop.service.Web_SlideShowService;
import com.xm.shop.utils.HttpClientUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 拿到图片名
 */
@Service
public class Web_SlideShowServiceImpl implements Web_SlideShowService {
    @Override
    public List<String> getSlideShow() {
        String result = HttpClientUtils.get("http://localhost:8082/getSlideShow");
        /**
         * 把String类型转成List
         */
        return JSON.parseObject(result,new TypeReference<List<String>>(){});
    }
}
