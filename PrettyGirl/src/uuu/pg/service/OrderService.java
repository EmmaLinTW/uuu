package uuu.pg.service;

import java.util.List;

import uuu.pg.entity.Customer;
import uuu.pg.entity.Order;
import uuu.pg.entity.Outlet;
import uuu.pg.entity.PGException;
import uuu.pg.entity.Product;
import uuu.pg.entity.VIP;

public class OrderService {

	private OrdersDAO  dao = new OrdersDAO();
	
	public void checkOut(Order order) throws PGException{
		if(order == null) {
			throw new IllegalArgumentException("結帳時的Order物件不得為null");
		}
		dao.insert(order);
	}

	public double getOrderHistoryRowByCustomerId(String id) throws PGException {
		return dao.selectOrderHistoryRowByCustomerId(id);
	}	
	public List<Order> getOrderHistoryByCustomerId(String id) throws PGException {
		return dao.selectOrderHistoryByCustomerId(id);
	}
	public List<Order> getOrderHistoryByCustomerIdPage(String id, String page) throws PGException {
		return dao.selectOrderHistoryByCustomerIdPage(id, page);
	}

	public Order getOrderById(String id) throws PGException {
		return dao.selectOrderById(id);
	}


	//成果展用不到
	public double order(Customer c, Product p, int quantity) {
		double amount = p.getUnitPrice() * quantity;
		
		if(c instanceof VIP && !(p instanceof Outlet)) {
			amount=amount*(100-((VIP)c).getDiscount())/100;
		}
		
		return amount;
		
	}

	
}
