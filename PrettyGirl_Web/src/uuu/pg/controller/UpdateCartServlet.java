package uuu.pg.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.pg.entity.CartItem;
import uuu.pg.entity.ShoppingCart;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/member/update_cart.do")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doPost(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<>();		
		HttpSession session = request.getSession();
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		
		if(cart!=null) {
			Set<CartItem> trashCan = new HashSet<>();
			for(CartItem item:cart.getCartItemSet()) {
				//1. 從request中取得該筆明細的Form Date
				String quantity = request.getParameter("quantity"+ item.hashCode());
				String delete = request.getParameter("delete" + item.hashCode());
				//2.呼叫商業邏輯
				if(delete==null) { //修改該明細的數量
					if(quantity!=null && quantity.matches("\\d+")) {
						cart.update(item, Integer.parseInt(quantity));
					}
				}else {//刪除該明細的數量
					//cart.remove(item);//可能發生java.util.ConcurrentModificationException
					trashCan.add(item);
				}			
			}
			for(CartItem item:trashCan) {
				cart.remove(item);
			}
			trashCan.clear();
		}else {
			errors.add("修改購物車時，購物車不得為null");
		}
		
		if(errors.size()>0) {
			this.log("修改明細時發生錯誤:" +errors);
		}
		
		//3.redirect 給cart.jsp
		String submit = request.getParameter("submit");
		if("我要結帳".equals(submit)) {
			response.sendRedirect(request.getContextPath() + "/member/check_out.jsp");
		}else {
			response.sendRedirect(request.getContextPath() + "/member/cart.jsp");
		}
		
		
	}

}
