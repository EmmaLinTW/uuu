package uuu.pg.test;

import java.util.List;

import uuu.pg.entity.Product;
import uuu.pg.service.ProductService;


public class TestProductServiceGetAllProducts {

	public static void main(String[] args) {
		ProductService service = new ProductService();
		//ProductsDAO dao = new ProductsDAO();
		try {
			//List<Product> list = service.getAllProduct();
			//List<Product> list = service.getProductBySearch("外");
			
			//System.out.println(list);
			System.out.println(service.getProductById("1"));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
