package uuu.pg.test;

import java.util.List;

import sun.util.logging.resources.logging;
import uuu.pg.entity.CartItem;
import uuu.pg.entity.Product;
import uuu.pg.entity.ShoppingCart;
import uuu.pg.service.ProductService;

public class TestShoppingCart {

	public static void main(String[] args) {
		ProductService pService = new ProductService();
		try {
			List<Product> allList = pService.getAllProduct();
			
			ShoppingCart cart = new ShoppingCart();
			int p1Id = allList.get(0).getId();
			Product p1 = pService.getProductById(String.valueOf(p1Id));
			cart.add(p1, "藍","S", 1);

			System.out.println(cart);
			
			List<Product> List1 = pService.getProductBySearch("洋裝");
			int p2Id = List1.get(0).getId();
			Product p2 = pService.getProductById(String.valueOf(p2Id));
			cart.add(p2, "藍","M", 1);
			
			System.out.println(cart);
			
			
			
			List<Product> List2 = pService.getProductBySearch("襯衫");
			int p3Id = List2.get(1).getId();
			Product p3 = pService.getProductById(String.valueOf(p3Id));
			
			cart.add(p3, "粉橘","L", 1);
			
			
			System.out.println(cart);
			System.out.println("*******************");
			
//			for(CartItem item:cart.getCartItemSet()) {
//				System.out.println(item.getProduct().getName()+","
//						+cart.size()+","
//						+cart.getTotalQuantity()+","
//						+cart.getTotalAmount());
//			}
			
			System.out.println(cart);
			System.out.println(cart.size()+"項");
			System.out.println(cart.getTotalQuantity()+"件");
			System.out.println(cart.getTotalAmount()+"元");
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			
		}
		
		
		
		
		
	}

}
