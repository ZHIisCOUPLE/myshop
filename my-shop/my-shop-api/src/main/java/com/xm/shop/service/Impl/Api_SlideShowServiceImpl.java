package com.xm.shop.service.Impl;

import com.xm.shop.dao.Api_SlideShowDao;
import com.xm.shop.service.Api_SlideShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class Api_SlideShowServiceImpl implements Api_SlideShowService {

    @Autowired
    private Api_SlideShowDao apiSlideShowDao;

    @Override
    public List<String> getSlideShow() {
        return apiSlideShowDao.getSlideShow(99L);
    }
}
