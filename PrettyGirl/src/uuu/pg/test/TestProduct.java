package uuu.pg.test;

import uuu.pg.entity.Product;
import uuu.pg.service.ProductService;

public class TestProduct {
	
	public static void main(String[] args) {
		
		Product p = new Product();
			p.setId(1);
			p.setName("加厚內裡微透膚蕾絲雕花A字洋裝");
			p.setUnitPrice(659);
			p.setStock(5);
			p.setPhotoUrl("https://image.obdesign.com.tw/catalog/products/DA6109/DA6109@CB-1-1_70.jpg");
		
			System.out.println("id: "+p.getId());
			System.out.println("pname: "+p.getName());
			System.out.println("unitPrice: "+p.getUnitPrice());
			System.out.println("stock: "+p.getStock());
			System.out.println("photoUrl: "+p.getPhotoUrl());
		
			Product p2 = p.clone();
			System.out.println(p2.getName());
			p2.setName("長裙");
			System.out.println(p2.getName());
			
			System.out.println(p);
		
			ProductService service = new ProductService();
//			service.addPrice(p.getUnitPrice());
//			System.out.println(p.getUnitPrice());//659
//			
//			service.addPrice(p);
//			System.out.println(p.getUnitPrice());//709
		
			
	}
	

}
