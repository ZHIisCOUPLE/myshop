package com.xm.shop.persistence;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 使用泛型抽取共同的dao方法CRUD
 *       T 是任意一个BaseEntity的子类
 * @param <T>
 */
public interface BaseDao<T extends BaseEntity> {


    /**
     * 添加一个新用户
     * @param t
     * @return
     */
    void save(T t);

    /**
     * 查询列表
     * @param t
     * @return
     */
    List<T> findList(T t);


    /**
     * 更新
     * @param t
     */
    void update(T t);


    /**
     * 查出总的条数
     * @param t
     * @return
     */
    Long findListCount(T t);


    /**
     * 删除
     * @param id
     */
    void delete(@Param("id")Long id);

    /**
     * 根据id查找到数据
     * @param id
     * @return
     */
    T getByid(@Param("id") Long id);

}
