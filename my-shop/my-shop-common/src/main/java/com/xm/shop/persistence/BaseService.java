package com.xm.shop.persistence;



public interface BaseService<T extends BaseEntity> {
    /**
     * 保存
     * @param t
     * @return
     */
    Result save(T t);

    /**
     * 删除
     * @param id
     * @return
     */
    Result delete(Long id);

    /**
     * 更改
     * @param t
     * @return
     */
    Result update(T t);

    /**
     * 查看列表
     * @param t
     * @return
     */
    Result findList(T t);

    /**
     *
     *
     * @param t
     * @return
     */
    Result pageList(T t);

    /**
     * 根据id查找到数据
     * @param id
     * @return
     */
    T getByid(Long id);
}
