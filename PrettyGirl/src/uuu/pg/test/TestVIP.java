package uuu.pg.test;

import uuu.pg.entity.VIP;

public class TestVIP {

	public static void main(String[] args) {
		VIP vip = new VIP();
		vip.setId("A223456781");
		System.out.println(vip.getId());
		vip.setName("林梅莉");
		System.out.println(vip.getName());
		System.out.println(vip.getDiscount());
		System.out.println(vip.getDiscountString());
		vip.setDiscount(21);
		System.out.println(vip.getDiscountString());
		
		System.out.println(vip);
	}

}
