package uuu.pg.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import uuu.pg.entity.Color;
import uuu.pg.entity.Outlet;
import uuu.pg.entity.PGException;
import uuu.pg.entity.Product;
import uuu.pg.entity.ProductPhotos;
import uuu.pg.entity.Size;

public class ProductsDAO {

	
	private static final String SELECT_PRODUCT_BY_ID = "SELECT id, name, unit_price, photo_url, stock, description,"
			+" colors, class_name, discount, type," 
			+" product_photos.product_id, photo1, photo2, photo3, photo4, photo5, photo6," 
			+" product_color.product_id, color_name, color_photo_url, color_icon "
			+" FROM products LEFT JOIN product_photos " 
			+" ON products.id = product_photos.product_id " 
			+" LEFT JOIN product_color " 
			+" ON products.id = product_color.product_id " 
			+" Where id = ?";
	
	public Product selectProductById(String id) throws PGException{
		Product p = null;
		try(Connection connection = RDBConnection.getConnection();//1,2 取得連線
			PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCT_BY_ID);//3.準備指令				
		){
			//3.1 傳入?的值
			pstmt.setString(1, id);
		
			//4.執行指令
			try(ResultSet rs = pstmt.executeQuery()){
				String prev_color_name=null;
				Color color = null;
				while(rs.next()) {
						if(p==null ) {
							String className = rs.getString("class_name"); 
							if("Outlet".equals(className)) {
								p = new Outlet();
								((Outlet)p).setDiscount(rs.getInt("discount"));
							}else {
								p = new Product();
							}
							p.setId(rs.getInt("id"));
							p.setName(rs.getString("name"));
							p.setUnitPrice(rs.getDouble("unit_price"));
							p.setPhotoUrl(rs.getString("photo_url"));
							//p.setStock(rs.getInt("stock"));
							p.setDescription(rs.getString("description"));
							p.setType(rs.getString("type"));
								ProductPhotos productPhotos = new ProductPhotos();
								productPhotos.setPhoto1(rs.getString("photo1"));
								productPhotos.setPhoto2(rs.getString("photo2"));
								productPhotos.setPhoto3(rs.getString("photo3"));
								productPhotos.setPhoto4(rs.getString("photo4"));
								productPhotos.setPhoto5(rs.getString("photo5"));
								productPhotos.setPhoto6(rs.getString("photo6"));
							p.setProductphotos(productPhotos);
						}
						String colorName = rs.getString("product_color.color_name");
						if(colorName!=null) {
							color = new Color();
							color.setColorName(colorName);
							color.setPhotoUrl(rs.getString("color_photo_url"));
							color.setColoricon(rs.getString("color_icon"));
							p.addColor(color);
						}
						
				}
			}
			
		}catch(SQLException ex) {
			throw new PGException("查詢產品失敗", ex);
		}
		return p;
	}
	
	
	private static final String SELECT_SIZE_PRICE_BY_ID = "SELECT product_id, size, unit_price "
			+ "FROM pg.size_price "
			+ "WHERE product_id = ?";
	
	public Product selectProductByIdWithSizePrice(String id) throws PGException{
		Product p = null;
		try(Connection connection = RDBConnection.getConnection();//1,2 取得連線
			PreparedStatement pstmt1 = connection.prepareStatement(SELECT_PRODUCT_BY_ID);//3.準備指令				
			PreparedStatement pstmt2 = connection.prepareStatement(SELECT_SIZE_PRICE_BY_ID);//3.準備指令				
		){
			//3.1 傳入?的值
			pstmt1.setString(1, id);
		
			//4.執行指令
			try(ResultSet rs = pstmt1.executeQuery()){
				//String prev_color_name=null;
				Color color = null;
				while(rs.next()) {
						if(p==null ) {
							String className = rs.getString("class_name"); 
							if("Outlet".equals(className)) {
								p = new Outlet();
								((Outlet)p).setDiscount(rs.getInt("discount"));
							}else {
								p = new Product();
							}
							p.setId(rs.getInt("id"));
							p.setName(rs.getString("name"));
							p.setUnitPrice(rs.getDouble("unit_price"));
							p.setPhotoUrl(rs.getString("photo_url"));
							//p.setStock(rs.getInt("stock"));
							p.setDescription(rs.getString("description"));
							p.setType(rs.getString("type"));
								ProductPhotos productPhotos = new ProductPhotos();
								productPhotos.setPhoto1(rs.getString("photo1"));
								productPhotos.setPhoto2(rs.getString("photo2"));
								productPhotos.setPhoto3(rs.getString("photo3"));
								productPhotos.setPhoto4(rs.getString("photo4"));
								productPhotos.setPhoto5(rs.getString("photo5"));
								productPhotos.setPhoto6(rs.getString("photo6"));
							p.setProductphotos(productPhotos);
						}
						String colorName = rs.getString("product_color.color_name");
						if(colorName!=null) {
							color = new Color();
							color.setColorName(colorName);
							color.setPhotoUrl(rs.getString("color_photo_url"));
							color.setColoricon(rs.getString("color_icon"));
							p.addColor(color);
						}
						
				}
					pstmt2.setString(1, id);
					try(ResultSet rs2 = pstmt2.executeQuery()){
						while(rs2.next()){
							String sizeName = rs2.getString("size");
							if(sizeName!=null) {
								Size size = Size.valueOf(sizeName);
								p.addSizePrice(size, rs2.getDouble("unit_price"));
							}
						
						}
					}
				
				}
	
			}catch(SQLException ex) {
				throw new PGException("查詢產品失敗", ex);
		}
			return p;
			
	}
		
	
	private static final String SELECT_ALL_PRODUCTS = "SELECT id, name, unit_price, photo_url,"
			+ " stock, description,"
			+ "	colors, class_name, discount, type,"
			+" product_id, color_name, color_photo_url, color_icon "
			+" FROM products LEFT JOIN product_color"
			+" ON products.id = product_color.product_id";
	
	public List<Product> selectAllProducts() throws PGException{
		List<Product> list = new ArrayList<>();
		try(Connection connection = RDBConnection.getConnection(); //1.2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_ALL_PRODUCTS); //3.準備指令
				ResultSet rs = pstmt.executeQuery();//3.執行指令				
			){
			//5. 處理rs
			
			int prevId=0;
			Product p = null;
			while(rs.next()) {
				int thisId = rs.getInt("id");
				
				if(prevId!=thisId) {
					String className = rs.getString("class_name");
					
					if("Outlet".equals(className)) {
						p = new Outlet();
						((Outlet)p).setDiscount(rs.getInt("discount"));
					}else {
						p = new Product();
					}					
					p.setId(thisId);
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setDescription(rs.getString("description"));
					p.setType(rs.getString("type"));
					list.add(p);
					prevId = thisId;
				}
				String colorName = rs.getString("color_name");
				if(colorName!=null) {
					Color color = new Color();
					color.setColorName(colorName);
					color.setPhotoUrl(rs.getString("color_photo_url"));
					color.setColoricon(rs.getString("color_icon"));
					p.addColor(color);
				}	
				
			}
			
		}catch(SQLException ex) {
			throw new PGException("查詢全部的產品失敗", ex);
		}
		return list;
	}

	private static final String SELECT_HOT_ITEMS_TOP_6 = "SELECT id, name, unit_price, photo_url, stock, description," 
			+ "	colors, class_name, discount, type, " 
			+ " product_id, color_name, color_photo_url, color_icon " 
			+ " FROM products LEFT JOIN product_color " 
			+ " ON products.id = product_color.product_id " 
			+ " WHERE id in " 
			+ " (SELECT product_id FROM hot_item)";
	
	public List<Product> selectHotItemsTop6() throws PGException{
		List<Product> list = new ArrayList<>();
		try(Connection connection = RDBConnection.getConnection(); //1.2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_HOT_ITEMS_TOP_6); //3.準備指令
				ResultSet rs = pstmt.executeQuery();//3.執行指令				
			){
			//5. 處理rs
			
			int prevId=0;
			Product p = null;
			while(rs.next()) {
				int thisId = rs.getInt("id");
				
				if(prevId!=thisId) {
					String className = rs.getString("class_name");
					
					if("Outlet".equals(className)) {
						p = new Outlet();
						((Outlet)p).setDiscount(rs.getInt("discount"));
					}else {
						p = new Product();
					}					
					p.setId(thisId);
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setDescription(rs.getString("description"));
					p.setType(rs.getString("type"));
					list.add(p);
					prevId = thisId;
				}
				String colorName = rs.getString("color_name");
				if(colorName!=null) {
					Color color = new Color();
					color.setColorName(colorName);
					color.setPhotoUrl(rs.getString("color_photo_url"));
					color.setColoricon(rs.getString("color_icon"));
					p.addColor(color);
				}	
				
			}
			
		}catch(SQLException ex) {
			throw new PGException("查詢熱門top6產品失敗", ex);
		}
		return list;
	}
	
	private static final String SELECT_PRODUCTS_BY_SEARCH = "SELECT id, name, unit_price, photo_url,"
			+ " stock, description,"
			+ "	colors, class_name, discount, type, category,"
			+" product_id, color_name, color_photo_url, color_icon "
			+" FROM products LEFT JOIN product_color"
			+" ON products.id = product_color.product_id" 
			+" WHERE name LIKE ? ";
			//"    GROUP BY products.id ";	
	public List<Product> selectProductsBySearch(String search) throws PGException {
		List<Product> list = new ArrayList<>();
		try(Connection connection = RDBConnection.getConnection(); //1.2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCTS_BY_SEARCH); //3.準備指令
								
			){
			//3.1傳入?的值
			pstmt.setString(1, "%" + search +"%");
			try(
					ResultSet rs = pstmt.executeQuery();//4.執行指令
			){
				//5. 處理rs
				int prevId=0;
				Product p = null;
				while(rs.next()) {
					int thisId = rs.getInt("id");
					
					if(prevId!=thisId) {
						String className = rs.getString("class_name");
						
						if("Outlet".equals(className)) {
							p = new Outlet();
							((Outlet)p).setDiscount(rs.getInt("discount"));
						}else {
							p = new Product();
						}					
						p.setId(thisId);
						p.setName(rs.getString("name"));
						p.setUnitPrice(rs.getDouble("unit_price"));
						p.setStock(rs.getInt("stock"));
						p.setPhotoUrl(rs.getString("photo_url"));
						p.setDescription(rs.getString("description"));
						p.setType(rs.getString("type"));
						p.setCategory(rs.getString("category"));
						list.add(p);
						prevId = thisId;
					}
					String colorName = rs.getString("color_name");
					if(colorName!=null) {
						Color color = new Color();
						color.setColorName(colorName);
						color.setPhotoUrl(rs.getString("color_photo_url"));
						color.setColoricon(rs.getString("color_icon"));
						p.addColor(color);
					}	
				}
			}
		}catch(SQLException ex) {
			throw new PGException("用部分名稱查詢產品失敗", ex);
		}
		return list;
	}
	
	
	private static final String SELECT_PRODUCTS_BY_TYPE = "SELECT id, name, unit_price, photo_url,"
			+ " stock, description,"
			+ "	colors, class_name, discount, type,"
			+" product_id, color_name, color_photo_url, color_icon "
			+" FROM products LEFT JOIN product_color"
			+" ON products.id = product_color.product_id" 
			+" WHERE type = ? ";
	public List<Product> selectProductsByType(String type) throws PGException {
		List<Product> list = new ArrayList<>();
		try(Connection connection = RDBConnection.getConnection(); //1.2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCTS_BY_TYPE); //3.準備指令
								
			){
			//3.1傳入?的值
			pstmt.setString(1,type);
			try(
					ResultSet rs = pstmt.executeQuery();//4.執行指令
			){
				//5. 處理rs
				int prevId=0;
				Product p = null;
				while(rs.next()) {
					int thisId = rs.getInt("id");
					
					if(prevId!=thisId) {
						String className = rs.getString("class_name");
						
						if("Outlet".equals(className)) {
							p = new Outlet();
							((Outlet)p).setDiscount(rs.getInt("discount"));
						}else {
							p = new Product();
						}					
						p.setId(thisId);
						p.setName(rs.getString("name"));
						p.setUnitPrice(rs.getDouble("unit_price"));
						p.setStock(rs.getInt("stock"));
						p.setPhotoUrl(rs.getString("photo_url"));
						p.setDescription(rs.getString("description"));
						p.setType(rs.getString("type"));
						list.add(p);
						prevId = thisId;
					}
					String colorName = rs.getString("color_name");
					if(colorName!=null) {
						Color color = new Color();
						color.setColorName(colorName);
						color.setPhotoUrl(rs.getString("color_photo_url"));
						color.setColoricon(rs.getString("color_icon"));
						p.addColor(color);
					}	
				}
			}
		}catch(SQLException ex) {
			throw new PGException("用種類查詢產品失敗", ex);
		}
		return list;
	}
	
	private static final String SELECT_PRODUCTS_BY_CATEGORY = "SELECT id, name, unit_price, photo_url,"
			+ " stock, description,"
			+ "	colors, class_name, discount, category,"
			+" product_id, color_name, color_photo_url, color_icon "
			+" FROM products LEFT JOIN product_color"
			+" ON products.id = product_color.product_id" 
			+" WHERE category = ? ";
	public List<Product> selectProductsByCategory(String category) throws PGException {
		List<Product> list = new ArrayList<>();
		try(Connection connection = RDBConnection.getConnection(); //1.2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCTS_BY_CATEGORY); //3.準備指令
								
			){
			//3.1傳入?的值
			pstmt.setString(1,category);
			try(
					ResultSet rs = pstmt.executeQuery();//4.執行指令
			){
				//5. 處理rs
				int prevId=0;
				Product p = null;
				while(rs.next()) {
					int thisId = rs.getInt("id");
					
					if(prevId!=thisId) {
						String className = rs.getString("class_name");
						
						if("Outlet".equals(className)) {
							p = new Outlet();
							((Outlet)p).setDiscount(rs.getInt("discount"));
						}else {
							p = new Product();
						}					
						p.setId(thisId);
						p.setName(rs.getString("name"));
						p.setUnitPrice(rs.getDouble("unit_price"));
						p.setStock(rs.getInt("stock"));
						p.setPhotoUrl(rs.getString("photo_url"));
						p.setDescription(rs.getString("description"));
						p.setType(rs.getString("category"));
						list.add(p);
						prevId = thisId;
					}
					String colorName = rs.getString("color_name");
					if(colorName!=null) {
						Color color = new Color();
						color.setColorName(colorName);
						color.setPhotoUrl(rs.getString("color_photo_url"));
						color.setColoricon(rs.getString("color_icon"));
						p.addColor(color);
					}	
				}
			}
		}catch(SQLException ex) {
			throw new PGException("用category查詢產品失敗", ex);
		}
		return list;
	}
	
	private static final String SELECT_PRODUCT_COLOR_SIZE_STOCK="SELECT  product_color.product_id, product_color.color_name, color_photo_url, color_icon," 
			+"product_color_size_stock.product_id, product_color_size_stock.color_name, size, product_color_size_stock.stock " 
			+"FROM product_color LEFT JOIN product_color_size_stock " 
			+"ON product_color.product_id = product_color_size_stock.product_id " 
			+"AND product_color.color_name = product_color_size_stock.color_name " 
			+"Where product_color_size_stock.product_id = ? " 
			+"AND product_color_size_stock.color_name = ? ";
	
	public Map<Size,Integer> selectProductColorSizeStockMap(String productId, String colorName) throws PGException{
		Map<Size, Integer> map = new TreeMap<>();//若有產品是沒有尺寸的，那此map有可能是0筆
		try(	Connection connection = RDBConnection.getConnection();//1.2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCT_COLOR_SIZE_STOCK);//3.準備指令
				){
				//3.1傳入?的值
				pstmt.setString(1, productId);
				pstmt.setString(2, colorName);
			
				//4.執行指令
				try(ResultSet rs = pstmt.executeQuery()){
					while(rs.next()) {
						String id = rs.getString("product_color.product_id");
						String color = rs.getString("product_color.color_name");
						System.out.println("查到"+id+","+color);
						
						String sizeName = rs.getString("size");
						if(sizeName!=null) {
							Size size = Size.valueOf(sizeName);
							map.put(size, rs.getInt("product_color_size_stock.stock"));
						}
					}
				}
				
			
		}catch(SQLException ex) {
			throw new PGException("用顏色查詢產品的尺寸庫存失敗", ex);
			
		}
		
		return map;
	}

	
	private static final String SELECT_REAL_TIME_PRODUCT_STOCK="SELECT product_id, color_name, size, stock "
			+" FROM product_color_size_stock " 
			+" WHERE product_id = ? "
			+" AND color_name= ? "
			+" AND size = ? ";
	public int selectRealTimeStock(int productId, Color color, Size size) throws PGException{
		
		try(	Connection connection = RDBConnection.getConnection();//1,2.建立連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_REAL_TIME_PRODUCT_STOCK);//3.準備指令
				){
			//3.1傳入?的值
			pstmt.setInt(1, productId);
			pstmt.setString(2, color.getColorName());
			pstmt.setString(3, size.name());
			
			int stock=0;
			
			try(ResultSet rs = pstmt.executeQuery()){//4.執行指令
				while(rs.next()) {
					stock = rs.getInt("stock");
				}
			}
			System.out.println("ProductId:"+productId+",Color:"+color+",Size:"+size+",stock:"+stock);
			return stock;
		}catch(SQLException ex) {
			throw new PGException("用顏色尺寸查詢即時庫存失敗",ex);
		}
	}
	
	
	
//	private static final String SELECT_PRODUCT_SIZE_PRICE=
//					" SELECT product_id, size, unit_price FROM size_price " 
//				   +" WHERE product_id = ? ";
//	public double selectProductSizePrice(int productId, Size size) throws PGException{
//		
//		try(	Connection connection = RDBConnection.getConnection();//1,2.建立連線
//				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCT_SIZE_PRICE);//3.準備指令
//				){
//			//3.1傳入?的值
//			pstmt.setInt(1, productId);
//			pstmt.setString(3, size.name());
//			
//			double price=0;
//			
//			try(ResultSet rs = pstmt.executeQuery()){//4.執行指令
//				while(rs.next()) {
//					price = rs.getInt("unit_price");
//				}
//			}
//			System.out.println("ProductId:"+productId+",Size:"+size+",price:"+price);
//			return price;
//		}catch(SQLException ex) {
//			throw new PGException("用Id尺寸查詢價格失敗",ex);
//		}
//	}
//	
	
	
	
	
}
