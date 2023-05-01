package uuu.pg.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.pg.entity.Customer;
import uuu.pg.entity.PGException;
import uuu.pg.service.CustomerService;
import uuu.pg.service.MailService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet", 
urlPatterns={"/login.do", "/Login.do","/login.ajax"}, loadOnStartup = 1)
//    http://localhost:8080/vgb/login.do
public class LoginServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

/**
* @see HttpServlet#HttpServlet()
*/
public LoginServlet() {
super();
// TODO Auto-generated constructor stub
}

/**
* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
*/
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);		
}

/**
* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
*/
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
List<String> errors = new ArrayList<>();
HttpSession session = request.getSession();
//1. 取得request傳來的Form Data, 並檢查
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("loginId");    	
String password = request.getParameter("password");
String captcha = request.getParameter("captcha");
if(id==null || id.length()==0) {
	errors.add("必須輸入帳號");
}
if(password==null || password.length()==0) {
	errors.add("必須輸入密碼");
}
if(captcha==null || captcha.length()==0) {
	errors.add("必須輸入驗證碼");
}else {
	String oldCaptcha = (String)session.getAttribute("CaptchasServlet");
	if(!captcha.equalsIgnoreCase(oldCaptcha)) {
		errors.add("驗證碼不正確");
	}
}
session.removeAttribute("CaptchasServlet");

//2.若檢查無誤，呼叫商業邏輯
if(errors.isEmpty()) {
	CustomerService service = new CustomerService();    	
	try {
		Customer c = service.login(id, password);
		
		//將id, auto加入/移除Cookie
		Cookie idCookie = new Cookie("loginId", id);
		Cookie autoCookie = new Cookie("auto", "checked");
		String auto = request.getParameter("auto");
		if(auto!=null) {
			idCookie.setMaxAge(7*24*60*60); //單位為sec, 7天
			autoCookie.setMaxAge(7*24*60*60); //單位為sec, 7天
		}else {
			idCookie.setMaxAge(0); //單位為sec, cookie將被移除
			autoCookie.setMaxAge(0); //單位為sec, cookie將被移除					
		}
		response.addCookie(idCookie);
		response.addCookie(autoCookie);
		
		//3.1 產生登入成功回應(不符合MVC)				
		//response.setContentType("text/html;charset=utf-8"); //servlet 2.4以前
		
//		response.setContentType("text/html");
//		response.setCharacterEncoding("UTF-8");
		
//		try(PrintWriter out = response.getWriter() ){				
//	        out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");	                
//            out.println("<title>登入成功</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("登入成功");
//			out.println(c);
//            out.println("</body>");
//            out.println("</html>");				
//		}						
		
		//3.1 成功時redirect(外部轉址)給首頁 /
		//request.setAttribute("customer", c);
		//session.setMaxInactiveInterval(300); //300秒, 5分鐘
		session.setAttribute("member", c);
		
		//若因強制登入檢查完成登入，則轉交原網頁
		String prevURI = (String)session.getAttribute("previous_uri");

		if(request.getRequestURI().indexOf(".ajax")>0) {
			request.getRequestDispatcher("login_ok.jsp").forward(request, response);
		}else if(prevURI!=null){
			String previous_query_string = (String) session.getAttribute("previous_query_string");
			response.sendRedirect(prevURI + (previous_query_string!=null?"?"+previous_query_string:""));
			session.removeAttribute("previous_uri");
			session.removeAttribute("previous_query_string");
			
		}else{
			response.sendRedirect(request.getContextPath());
		}
		return;				
	} catch (PGException e) {
		this.log("無法登入!", e);
		errors.add(e.toString());				
	}
}
	
//3.2 產生登入失敗回應(不符合MVC)	
//response.setContentType("text/html");
//response.setCharacterEncoding("UTF-8");
//	
//try(PrintWriter out = response.getWriter() ){			
//	out.println(id + "登入失敗:" + errors);
//	out.println("<input type='button' value='上一頁' onclick='history.back();'>");
//}

//3.2 失敗時forward(內部轉交) login.jsp
request.setAttribute("loginErrors", errors);

RequestDispatcher dispatcher = request.getRequestDispatcher("/login_and_register.jsp");
dispatcher.forward(request, response);

}

}
