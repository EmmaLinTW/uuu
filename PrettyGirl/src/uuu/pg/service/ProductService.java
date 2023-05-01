package uuu.pg.service;

import java.util.List;
import java.util.Map;

import uuu.pg.entity.Product;
import uuu.pg.entity.Size;
import uuu.pg.entity.Color;
import uuu.pg.entity.PGException;
import uuu.pg.service.ProductsDAO;
import uuu.pg.entity.PGException;

public class ProductService {
	private ProductsDAO dao = new ProductsDAO();
	
	public Product getProductById(String id) throws PGException{
		return dao.selectProductById(id);
	}
	public Product getProductByIdWithSizePrice(String id) throws PGException{
		return dao.selectProductByIdWithSizePrice(id);
	}
	
	public List<Product> getAllProduct()throws PGException{
		return dao.selectAllProducts(); 
	}
	public List<Product> getHotItemsTop6()throws PGException{
		return dao.selectHotItemsTop6(); 
	}
	
	public List<Product> getProductBySearch(String search)throws PGException{
		return dao.selectProductsBySearch(search); 
	}
	
	public List<Product> getProductByType(String type)throws PGException{
		return dao.selectProductsByType(type); 
	}
	
	public List<Product> getProductByCategory(String category)throws PGException{
		return dao.selectProductsByCategory(category); 
	}
	
	public Map<Size, Integer> getProductColorSizeStockMap(String productId, String colorName) throws PGException {
		return dao.selectProductColorSizeStockMap(productId, colorName);
	}
	
	public int getRealTimeStock(int productId, Color color, Size size) throws PGException{
		return dao.selectRealTimeStock(productId, color, size);
	}
//	public double getProductSizePrice(int productId, Size size) throws PGException{
//		return dao.selectProductSizePrice(productId, size);
//	}
	
	
	
	
	
	
	
//	public double addPrice(double price) {
//		double rtn = price + 50;
//		return rtn;
//	}
//	
//	public double addPrice(Product p) {
//		double rtn = p.getUnitPrice()+50;
//		return rtn;
//	
//	public double addPrice(double price) {
//		double rtn = price + 50;
//		return rtn;
//	}
//	
//	public void addPrice(Product p) {
//		p = new Product();
//		p.setUnitPrice(p.getUnitPrice()+50);
//	
//		
//	}
	
	
}

	
