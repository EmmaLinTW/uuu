package uuu.pg.service;

import uuu.pg.entity.Customer;
import uuu.pg.entity.PGException;
import uuu.pg.service.CustomersDAO;

public class CustomerService {
	private CustomersDAO dao = new CustomersDAO();
	
	public Customer login(String id, String pwd)
				throws PGException{
		Customer member = null;
		member = dao.selectCustomerById(id);
		if(member!=null && pwd.equals(member.getPassword())) {
			return member;			
		}else {
			throw new PGException("登入失敗，帳號或密碼不正確");
		}	
	}	
	
	public void register(Customer customer)throws PGException{
		if(customer==null) {
			throw new java.lang.IllegalArgumentException(
					"會員註冊時customer物件不得為null");
		}
		dao.insert(customer);
	}
	
	public void update(Customer customer) throws PGException {
		if(customer==null) {
			throw new java.lang.IllegalArgumentException(
					"會員修改時customer物件不得為null");
		}
		dao.update(customer);
	}

}
