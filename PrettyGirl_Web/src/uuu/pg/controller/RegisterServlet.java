package uuu.pg.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.pg.entity.Customer;
import uuu.pg.entity.PGDataInvalidException;
import uuu.pg.entity.PGException;
import uuu.pg.service.CustomerService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet({"/register.do","/register.ajax"})
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<String> errors = new ArrayList<>();
		HttpSession session = request.getSession();
		//1.取得request中的Form Data，並檢查之
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String married = request.getParameter("married");
		String captcha = request.getParameter("captcha");
		
		if(id==null || id.length()==0) {
			errors.add("必須輸入帳號");
		}

		if(name==null || name.length()==0) {
			errors.add("必須輸入姓名");
		}
		
		if(password1==null || password1.length()==0
			|| !password1.equals(password2)) {
			errors.add("必須輸入一致的密碼與確認密碼");
		}
		
		if(gender==null) {
			errors.add("必須輸入性別");
		}

		if(email==null || email.length()==0) {
			errors.add("必須輸入email");
		}
		
		if(birthday==null || birthday.length()==0) {
			errors.add("必須輸入生日");
		}
		
		if(captcha==null || captcha.length()==0) {
			errors.add("必須輸入驗證碼");
		}{
			String oldCaptcha = (String)session.getAttribute("RegisterCaptchasServlet");
			if(!captcha.equalsIgnoreCase(oldCaptcha)) {
				errors.add("驗證碼不正確");
			}
		}
		
		//2. 若檢查無誤則呼叫商業邏輯
		if(errors.isEmpty()) {
			try {
				Customer c = new Customer();
				c.setId(id);
				c.setName(name);
				c.setPassword(password1);
				c.setGender(gender.charAt(0));
				c.setEmail(email);
				c.setBirthday(birthday);
				
				c.setAddress(address);
				c.setPhone(phone);
				c.setMarried(married!=null);
				
			
				CustomerService service = new CustomerService();
				service.register(c);
				
			//3.1 成功: forward /register_ok.jsp
				//request.getSession().setAttribute("member", c);
				request.setAttribute("customer", c);
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher("/register_ok.jsp");
				dispatcher.forward(request, response);
				return;
			}catch(PGException ex) {
				this.log(ex.toString(), ex);
				errors.add(ex.getMessage());
			}catch(PGDataInvalidException ex) {
				errors.add(ex.getMessage());
			}
		}
		
		//3.2 失敗: forward /register.jsp
		request.setAttribute("registerErrors", errors);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/login_and_register.jsp");
		dispatcher.forward(request, response);		
	}

}
