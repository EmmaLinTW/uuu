package uuu.pg.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.pg.entity.Customer;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter("/member/*")
public class LoginCheckFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginCheckFilter() {
        
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpReq = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		HttpSession session = httpReq.getSession(); 
		
		Customer member = (Customer)session.getAttribute("member");
		if(member!=null) {
			chain.doFilter(request, response);
		}else {
			session.setAttribute("previous_uri", httpReq.getRequestURI());
			session.setAttribute("previous_query_string", httpReq.getQueryString());
			System.out.println("previous_uri:"+ session.getAttribute("previous_uri"));
			System.out.println("previous_query_string:"+session.getAttribute("previous_query_string"));
			httpResponse.sendRedirect(httpReq.getContextPath()+"/login_and_register.jsp");
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
