package uuu.pg.test;

import uuu.pg.entity.PGException;
import uuu.pg.service.ProductService;

public class TestProductServiceGetStock {

	public static void main(String[] args) {
		ProductService service = new ProductService();
		try {
			System.out.println(service.getProductColorSizeStockMap("1", "杏"));
			
			
		} catch (PGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
