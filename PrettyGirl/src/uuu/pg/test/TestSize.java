package uuu.pg.test;

import uuu.pg.entity.Product;
import uuu.pg.entity.Size;

public class TestSize {

	public static void main(String[] args) {

//		Product p = new Product();
//		
//		p.setSize(Size.S);
//		System.out.println(p.getSize());
//		
//		p.setSize(Size.valueOf("M"));
//		System.out.println(p.getSize());
		
		Size[] values = Size.values();
		for(int i=0;i<values.length;i++) {
			System.out.println(values[i].ordinal());
			System.out.println(values[i].name());
			
		
		}
		
	}

}
