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

import uuu.pg.entity.PGException;
import uuu.pg.entity.Product;
import uuu.pg.entity.ShoppingCart;
import uuu.pg.service.ProductService;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet({"/add_cart.do","/add_cart.ajax"})
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartServlet() {
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
		//1.取得request中的Form Data,並檢查之
		String productId = request.getParameter("productId");
		String color = request.getParameter("color");
		String size = request.getParameter("size");
		String quantity = request.getParameter("quantity");
		if(productId==null){
			errors.add("必須有產品編號");
		}
		if(quantity==null || !quantity.matches("\\d+")) {
			errors.add("必須有購買數量，且為正整數");
		}
		if(color==null) {
			errors.add("必須選擇顏色");
		}
		if(size==null) {
			errors.add("必須選擇尺寸");
		}
		//System.out.println("size:" + size);
		
		//2.若無誤，則呼叫商業邏輯
		if(errors.isEmpty()) {
			ProductService pService = new ProductService();
			
			try {
				Product p = pService.getProductByIdWithSizePrice(productId);
				if(p!=null) {
					HttpSession session = request.getSession();
					ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
					if(cart==null) {
						cart = new ShoppingCart();
						session.setAttribute("cart", cart);
					}
					cart.add(p, color,size, Integer.parseInt(quantity));
					
				}else {
					errors.add("加入購物車失敗，查無此產品:"+productId);
				}
			} catch (PGException e) {
				// TODO Auto-generated catch block
				this.log("加入購物車失敗", e);
			}
		}else {
		
		
		//3.forward給cart.jsp
		this.log("加入購物車有誤:\n"+errors);
		}
		//request.getRequestDispatcher("/cart.jsp").forward(request, response);
		if(request.getRequestURI().indexOf(".ajax")>0) {
			request.getRequestDispatcher("/small_cart.jsp").forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath() + "/member/cart.jsp");
		}
	}

}
