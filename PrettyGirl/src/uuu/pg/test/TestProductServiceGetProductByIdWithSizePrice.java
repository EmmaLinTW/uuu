package uuu.pg.test;

import uuu.pg.entity.PGException;
import uuu.pg.service.ProductService;

public class TestProductServiceGetProductByIdWithSizePrice {

	public static void main(String[] args) {
		ProductService service = new ProductService();
		try {
			System.out.println(service.getProductByIdWithSizePrice("8"));
			
		} catch (PGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
