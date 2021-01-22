package fi.foo.filters;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class CharsetFilter implements Filter {

    private String encoding;

    public static String getCurrentUrlFromRequest(ServletRequest request)
    {
       if (! (request instanceof HttpServletRequest))
           return null;

       return getCurrentUrlFromRequest((HttpServletRequest)request);
    }

    public static String getCurrentUrlFromRequest(HttpServletRequest request)
    {
        StringBuffer requestURL = request.getRequestURL();
        String queryString = request.getQueryString();

        if (queryString == null)
            return requestURL.toString();

        return requestURL.append('?').append(queryString).toString();
    }

    public void init(FilterConfig config) throws ServletException {
        encoding = config.getInitParameter("requestEncoding");
        if (encoding == null) 
            encoding = "UTF-8";
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain next)
            throws IOException, ServletException {
        String url = CharsetFilter.getCurrentUrlFromRequest(request);
        
        if (url != null && (url.indexOf("/img/") > 0 || url.indexOf("/css/") > 0)) {
            next.doFilter(request, response);
            return;
        }
      
        // Respect the client-specified character encoding
        // (see HTTP specification section 3.4.1)
        if (null == request.getCharacterEncoding()) {
            request.setCharacterEncoding(encoding);
        }   
                
        // Set the default response content type and encoding
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        next.doFilter(request, response);
    }

    public void destroy() {
    }
}
