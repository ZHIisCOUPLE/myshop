package com.xm.shop.service.Impl;

import com.xm.shop.dao.TbContentDao;
import com.xm.shop.entity.TbContent;
import com.xm.shop.persistence.BaseServiceImpl;
import com.xm.shop.service.TbContentService;
import org.springframework.stereotype.Service;

@Service
public class TbContentServiceImpl extends BaseServiceImpl<TbContent, TbContentDao> implements TbContentService {
}
