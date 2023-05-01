package uuu.pg.test;

import uuu.pg.entity.Customer;
import uuu.pg.entity.Outlet;
import uuu.pg.entity.Product;
import uuu.pg.entity.VIP;
import uuu.pg.service.OrderService;

public class TestOrderService {

	public static void main(String[] args) {

		Customer c = new Customer("A123456789","123456","張三豐");
		System.out.println(c);
		
		Product p = new Product();
		p.setId(1);
		p.setName("襯衫");
		p.setUnitPrice(500);
		System.out.println(p);
		
		OrderService service = new OrderService();
		System.out.println(service.order(c, p, 2));
		
		VIP v = new VIP();
		 	v.setId("A223456781");
			v.setPassword("123456");
			v.setName("林梅莉");
			v.setDiscount(10);
		
		Outlet o = new Outlet();
		o.setId(2);
		o.setName("長褲");
		o.setUnitPrice(200);
		o.setDiscount(20);
		
		System.out.println(service.order(c, o, 1));
		System.out.println(service.order(v, o, 1));
		System.out.println(service.order(v, p, 1));
		
		System.out.println(VIP.class);
		System.out.println(v.getClass());
		
	}

}
