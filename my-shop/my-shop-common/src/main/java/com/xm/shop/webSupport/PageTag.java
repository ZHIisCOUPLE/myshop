package com.xm.shop.webSupport;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.Writer;

/**
 * 自定义分页标签
 */
public class PageTag extends BodyTagSupport {
    private int count;               //总条数
    private int pageSize;          //每页条数
    private int current;             //当前页



    @Override
    public int doEndTag() throws JspException {

        try {
            int pageCount=count/pageSize;      //计算总的页数

            if(count%pageSize>0){
                pageCount++;
            }

            //jsp内置对象pageContext
            Writer writer = pageContext.getOut();

            //start 从第几页开始
            int start = current - 4 < 1 ? 1 : current - 4;
            //end  到第几页结束
            int end=current+4>pageCount?pageCount:current+4;
            //上一页
            int prePage=current-1<1?1:current-1;
            //下一页
            int nextPage=current+1>pageCount?pageCount:current+1;

            writer.write("<li><a href=\"javascript:page(1)\"> 首页</a></li>");
            writer.write("<li><a href=\"javascript:page("+prePage+")\"> 上一页</a></li>");

            for (int i=start;i<=end;i++){
                if (i!=current){
                    writer.write("<li><a href=\"javascript:page("+i+")\"> "+i+"</a></li>");
                }else {
                    writer.write("<li><a href=\"javascript:void(0)\"> "+i+"</a></li>");
                }
            }
            writer.write("<li><a href=\"javascript:page("+nextPage+")\"> 下一页</a></li>");
            writer.write("<li><a href=\"javascript:page("+pageCount+")\"> 尾页</a></li>");


        } catch (Exception e) {
            e.printStackTrace();
        }
        return super.SKIP_BODY;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }
}
