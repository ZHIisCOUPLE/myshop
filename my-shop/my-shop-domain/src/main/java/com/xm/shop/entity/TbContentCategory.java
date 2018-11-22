package com.xm.shop.entity;

import com.xm.shop.persistence.BaseEntity;
import lombok.Data;

@Data
public class TbContentCategory extends BaseEntity {

    private String name;    //分类名称
    //父类
    private TbContentCategory parent;

    private Integer status;     //是否删除

    private Integer order;     //分类排序

    private Integer isParent;      //是否是父类




}
