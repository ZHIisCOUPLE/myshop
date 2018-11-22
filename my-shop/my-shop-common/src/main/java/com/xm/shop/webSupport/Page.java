package com.xm.shop.webSupport;

import lombok.Data;

@Data
public class Page {

    private int pageSize=10;       //每页显示的条数

    private int current=1;           //当前页

    private int start;                 //从第几条开始

    public int getStart(){
        return (current-1)*pageSize;
    }

}
