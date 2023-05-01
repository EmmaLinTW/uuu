package uuu.pg.test;

import uuu.pg.entity.Outlet;

public class TestOutlet {

	public static void main(String[] args) {
		Outlet outlet = new Outlet();
		
		outlet.setId(1);
		outlet.setName("長裙");
		outlet.setUnitPrice(580);
		outlet.setDiscount(50);
		
		System.out.println(outlet.getId());
		System.out.println(outlet.getName());
		System.out.println(outlet.getDiscount());
		System.out.println(outlet.getDiscountString());
		System.out.println(outlet.getUnitPrice());
		System.out.println(outlet.getUnitPrice());
		System.out.println(outlet.getListPrice());
		System.out.println(outlet.getClass());
		System.out.println(outlet.getClass().getName());//fully-qualified class name
		System.out.println(outlet.getClass().getSimpleName());//simple class name
		
		System.out.println(outlet);
		
	}

}
