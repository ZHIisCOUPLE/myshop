package com.xm.shop.service;

import com.xm.shop.entity.TbContentCategory;
import com.xm.shop.persistence.BaseService;

import java.util.List;

public interface TbContentCategoryService extends BaseService<TbContentCategory> {

    /**
     * 通过ID来查找到它下面的子节点的数组
     * @param id
     * @return
     */

    List<TbContentCategory> getChildrenCategory(Long id);

    /**
     * 查询树表
     * @return
     */
    List<TbContentCategory> queryTreeTable();
}
