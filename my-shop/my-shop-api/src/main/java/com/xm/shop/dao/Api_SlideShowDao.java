package com.xm.shop.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Api_SlideShowDao {
    /**
     * 通过父Id查到该子类下的图片
     * @param categoryId
     * @return
     */
    List<String> getSlideShow(@Param("categoryId") Long categoryId);
}
