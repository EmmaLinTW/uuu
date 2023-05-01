package uuu.pg.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.pg.entity.Customer;
import uuu.pg.entity.ShoppingCart;
import uuu.pg.service.MailService;
import uuu.pg.service.OrderService;
import uuu.pg.entity.PGException;
import uuu.pg.entity.Order;
import uuu.pg.entity.PaymentType;
import uuu.pg.entity.ShippingType;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/member/check_out.do")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<>();
		HttpSession session = request.getSession();
		Customer member = (Customer)session.getAttribute("member");
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		if(cart==null || cart.size()==0) {
			response.sendRedirect(request.getContextPath()+"/member/cart.jsp");
			return;
		}
		//1.取得request的Form Data
		String paymentType = request.getParameter("paymentType");
		String shippingType = request.getParameter("shippingType");
		String recipientName = request.getParameter("recipientName");
		String recipientEmail = request.getParameter("recipientEmail");
		String recipientPhone = request.getParameter("recipientPhone");
		String shippingAddress = request.getParameter("shippingAddress");
		if(paymentType==null || paymentType.length()==0) {
			errors.add("必須選擇付款方式");
		}
		if(shippingType==null || shippingType.length()==0) {
			errors.add("必須選擇貨運方式");
		}
		
		if(recipientName==null || recipientName.length()==0) {
			errors.add("必須輸入收件人姓名");
		}
		if(recipientEmail==null || recipientEmail.length()==0) {
			errors.add("必須輸入收件人Email");
		}
		if(recipientPhone==null || recipientPhone.length()==0) {
			errors.add("必須輸入收件人電話");
		}
		if(shippingAddress==null || shippingAddress.length()==0) {
			errors.add("必須輸入收件地址");
		}
		//2. 若無誤，則呼叫商業邏輯
				if(errors.isEmpty()) {
					try {
						Order order = new Order();
						order.setMember(member);
						order.add(cart);
						
						PaymentType pType = PaymentType.valueOf(paymentType);
						order.setPaymentType(pType);				
						order.setPaymentFee(pType.getFee());
						
						ShippingType shType = ShippingType.valueOf(shippingType);
						order.setShippingType(shType);				
						order.setShippingFee(shType.getFee());
						
						order.setRecipientName(recipientName);
						order.setRecipientEmail(recipientEmail);
						order.setRecipientPhone(recipientPhone);
						order.setShippingAddress(shippingAddress);
						
						OrderService service = new OrderService();
						service.checkOut(order);
						
						session.removeAttribute("cart");
						//3.1 成功則forward to check_out_ok.jsp
						session.setAttribute("order", order);
						
						MailService.sendOrderSucessMailWithLogo(member.getEmail(), order.getId());
						
						request.getRequestDispatcher("/member/check_out_ok.jsp").forward(request, response);
						return;
					}catch(PGException ex) {
						this.log(ex.getMessage(), ex);
						errors.add(ex.getMessage());
					}catch(RuntimeException ex) {
						this.log("結帳發生非預期錯誤", ex);
						errors.add("結帳發生非預期錯誤:" + ex);
					}
				}
				
				//3.2 失敗則forward to check_out.jsp
				request.setAttribute("errors", errors);	
				request.getRequestDispatcher("/member/check_out.jsp").forward(request, response);
				return;
			}

		}
