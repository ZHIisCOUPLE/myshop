package com.xm.shop.entity;

import com.xm.shop.persistence.BaseEntity;
import lombok.Data;

/**
 * 内容实体类
 */
@Data
public class TbContent extends BaseEntity {

    /**
     * 父类别
     */
    private TbContentCategory parent;
    /**
     * 标题
     */
    private String title;
    /**
     * 子标题
     */
    private String subTitle;

    /**
     * 标题描述
     */
    private String titleDesc;

    /**
     * 链接
     */
    private String url;
    /**
     * 图片1
     */
    private String picture1;

    /**
     * 图片2
     */
    private String picture2;
    /**
     * 内容详情
     */
    private String detail;

}
