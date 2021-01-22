package com.mvc.tag;

import javax.servlet.http.*;
import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import java.io.*;

public class AlertTag extends SimpleTagSupport {
    private String success;
    private String error;

    public void setSuccess(String success) {
        this.success = success;
    }
    public void setError(String error) {
        this.error = error;
    }

    public void doTag()
           throws JspException, IOException 
    {
        PageContext pageContext = (PageContext) getJspContext();  
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();  
        JspWriter out = getJspContext().getOut();
        if (request.getAttribute(success) != null) {
           out.println("<p style='color:green'>");
           out.println(request.getAttribute(success).toString());
           out.println("</p>");
        }
        if (request.getAttribute(error) != null) { 
           out.println("<p style='color:red'>");
           out.println(request.getAttribute(error).toString());
           out.println("</p>");
        }
   }
}
