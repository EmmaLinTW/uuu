package uuu.pg.test;

import uuu.pg.entity.PGException;
import uuu.pg.service.OrderService;

public class TestOrderServiceGetOrderHistoryRowByCustomerId {

	public static void main(String[] args) {

		
		OrderService service = new OrderService();
		
//		try {
//			System.out.println
//			(service.getOrderHistoryRowByCustomerId("A223456781"));
//		} catch (PGException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		try {
//			System.out.println(service.getOrderHistoryByCustomerId("A223456781"));
//		} catch (PGException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		
		try {
			System.out.println
			(service.getOrderHistoryByCustomerIdPage("A223456781", "0"));
		} catch (PGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
