package com.xm.shop.webSupport;

import lombok.Data;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;
@Data
public class hello extends BodyTagSupport {

    //
    private String maam;

    @Override
    public int doEndTag() throws JspException {
        JspWriter writer = pageContext.getOut();
        try {
            writer.write(maam);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return super.SKIP_BODY;
    }
}
