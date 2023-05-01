package uuu.pg.test;

import uuu.pg.entity.ProductPhotos;

public class TestProductPhotos {

	public static void main(String[] args) {

		ProductPhotos productphotos = new ProductPhotos();
		
		productphotos.setProduct_id(1);
		productphotos.setPhoto1("https://image.obdesign.com.tw/catalog/products/DA6243/DA6243@PIC-2.jpg");
		productphotos.setPhoto2("https://image.obdesign.com.tw/catalog/products/DA6243/DA6243@PIC-3.jpg");
		
		System.out.println(productphotos.getProduct_id());
		System.out.println(productphotos.getPhoto1());
		System.out.println(productphotos.getPhoto2());
		
	}

}
