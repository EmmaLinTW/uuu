package uuu.pg.test;

import java.util.List;

import uuu.pg.entity.CartItem;
import uuu.pg.entity.Customer;
import uuu.pg.entity.Order;
import uuu.pg.entity.PaymentType;
import uuu.pg.entity.Product;
import uuu.pg.entity.ShippingType;
import uuu.pg.entity.ShoppingCart;
import uuu.pg.service.CustomerService;
import uuu.pg.service.OrderService;
import uuu.pg.service.ProductService;

public class TestOrder {

	public static void main(String[] args) {
		ProductService pService = new ProductService();
		try {
			List<Product> allList = pService.getAllProduct();			
			
			ShoppingCart cart = new ShoppingCart();
			int p1Id = allList.get(0).getId();
			Product p1 = pService.getProductById(String.valueOf(p1Id));
			cart.add(p1,"杏","S", 1);
			
			CustomerService cService = new CustomerService();			
			Customer member = cService.login("A223456781", "123456");
			cart.setMember(member);			
			System.out.println(cart);
			
			List<Product> list1 = pService.getProductBySearch("洋裝");
			int p2Id = list1.get(0).getId();
			Product p2 = pService.getProductById(String.valueOf(p2Id));
			cart.add(p2, "藍","M", 2);			
			System.out.println(cart);
			
		
			System.out.println("********************************");
			System.out.println(cart);
			for(CartItem item : cart.getCartItemSet()) {
				System.out.println(item.getProduct().getName() + "," 
							+ (item.getColor()!=null?item.getColor().getColorName():"") 
							+ ",數量: " + cart.getQuantity(item));
			}			
			
			System.out.println(cart.size() + "項");
			System.out.println(cart.getTotalQuantity()+"件");
			System.out.println(cart.getTotalAmount()+"元");
			System.out.println(cart.getVIPTotalAmount()+"元");
			
			Order order = new Order();
			order.setMember(member);			
			order.add(cart);
			
			order.setPaymentType(PaymentType.ATM);
			order.setPaymentFee(PaymentType.ATM.getFee());
			order.setShippingType(ShippingType.HOME);
			order.setShippingFee(ShippingType.HOME.getFee());
			
			order.setRecipientName(member.getName());
			order.setRecipientEmail(member.getEmail());
			order.setRecipientPhone(member.getPhone());
			order.setShippingAddress(member.getAddress());
			System.out.println("--------------------------------------------------------------------");
			System.out.println(order);			
			
			OrderService service = new OrderService();
			service.checkOut(order);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}

}
