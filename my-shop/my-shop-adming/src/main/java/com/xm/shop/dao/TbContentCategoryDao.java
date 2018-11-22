package com.xm.shop.dao;

import com.xm.shop.entity.TbContentCategory;
import com.xm.shop.persistence.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TbContentCategoryDao extends BaseDao<TbContentCategory> {

    /**
     * 通过ID来查找到它下面的子节点的数组
     * @param id
     * @return
     */

    List<TbContentCategory> getChildrenCategory(@Param("id") Long id);


    void setIsParentTrue(@Param("id") Long id);
    void setIsParentFalse(@Param("id") Long id);
    void setParentId(@Param("id") Long id);

    List<TbContentCategory> queryTreeTable();

}
