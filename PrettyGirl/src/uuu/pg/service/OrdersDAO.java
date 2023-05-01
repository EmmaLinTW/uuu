package uuu.pg.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import uuu.pg.entity.Color;
import uuu.pg.entity.Customer;
import uuu.pg.entity.Order;
import uuu.pg.entity.OrderItem;
import uuu.pg.entity.PGException;
import uuu.pg.entity.PaymentType;
import uuu.pg.entity.Product;
import uuu.pg.entity.ShippingType;
import uuu.pg.entity.Size;

public class OrdersDAO {

	private static final String INSERT_ORDER="INSERT INTO orders" 
	+"(id, order_date, order_time, customer_id," 
	+ " payment_type, payment_fee, shipping_type, shipping_fee," 
	+ " recipient_name, recipient_email, recipient_phone, shipping_address)"
	+" VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String INSERT_ORDER_ITEMS="INSERT INTO order_items (order_id, product_id, color_name, size, price, quantity) VALUES (?,?,?,?,?,?)";
	public void insert(Order order) throws PGException {
		try(	Connection connection = RDBConnection.getConnection();//1,2取得連線
				PreparedStatement pstmt1 = connection.prepareStatement(INSERT_ORDER, Statement.RETURN_GENERATED_KEYS);//3.準備指令1
				PreparedStatement pstmt2 = connection.prepareStatement(INSERT_ORDER_ITEMS);//3.準備指令2
				){
			//3.1傳入指令1?的值
			pstmt1.setInt(1, order.getId());
			pstmt1.setString(2, order.getOrderDate().toString());
			pstmt1.setString(3, order.getOrderTime().toString());
			pstmt1.setString(4, order.getMember().getId());
			pstmt1.setString(5, order .getPaymentType().name());
			pstmt1.setDouble(6, order.getPaymentFee());
			pstmt1.setString(7, order.getShippingType().name());
			pstmt1.setDouble(8, order.getShippingFee());
			pstmt1.setString(9, order.getRecipientName());
			pstmt1.setString(10, order.getRecipientEmail());
			pstmt1.setString(11, order.getRecipientPhone());
			pstmt1.setString(12, order.getShippingAddress());
			
			//4.執行指令1
			pstmt1.executeUpdate();
			
			//4.1取得指令1自動給號的id
			try(ResultSet rs = pstmt1.getGeneratedKeys()){
				while(rs.next()) {
					int id = rs.getInt(1);
					order.setId(id);
				}
			}
			
			for(OrderItem item : order.getOrderItemSet()) {
				//3.1傳入指令2?的值
				pstmt2.setInt(1, order.getId());
				pstmt2.setInt(2, item.getProduct().getId());
				pstmt2.setString(3, item.getColor()!=null?item.getColor().getColorName():"");
				pstmt2.setString(4, item.getSize()!=null?item.getSize().name():"");
				pstmt2.setDouble(5, item.getPrice());
				pstmt2.setInt(6, item.getQuantity());
				
				
				//4.執行指令2
				pstmt2.executeUpdate();
			}
			
		}catch(SQLException ex) {
			throw new PGException("建立訂單失敗",ex);
		}
		
	}
	
	private static final String SELECT_ORDERS_BY_CUSTOMER_ID="SELECT id, order_date, order_time, "
	+ "customer_id, payment_type, shipping_type, status," 
	+" SUM(price * quantity) as total_amount " 
	+" FROM orders JOIN order_items " 
	+" ON orders.id = order_items.order_id "
	+" WHERE customer_id = ? " 
	+" GROUP BY orders.id " 
	+" ORDER BY orders.id DESC ";
	
	public List<Order> selectOrderHistoryByCustomerId(String id) 
			throws PGException{
		List<Order> list = new ArrayList<>();
		try(	Connection connection = RDBConnection.getConnection();//1,2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDERS_BY_CUSTOMER_ID);//3.準備指令
				){
			//3.1傳入?的值
			pstmt.setString(1, id);
			
			//4.執行指令
			try(ResultSet rs = pstmt.executeQuery()) {
				while(rs.next()) {
					Order order = new Order();
					order.setId(rs.getInt("id"));
					order.setOrderDate(LocalDate.parse(rs.getString("order_date")));
					order.setOrderTime(LocalTime.parse(rs.getString("order_time")));
					order.setPaymentType(PaymentType.valueOf(rs.getString("payment_type")));
					order.setShippingType(ShippingType.valueOf(rs.getString("shipping_type")));
					order.setStatus(rs.getInt("status"));
					order.setTotalAmount(rs.getDouble("total_amount"));
					
					list.add(order);
				}
				
			}
			
		}catch(SQLException ex) {
			throw new PGException("查詢歷史訂單失敗", ex);
		}
		return list;
	}
	
	private static final String SELECT_ORDERS_BY_CUSTOMER_ID_PAGE="SELECT id, order_date, order_time, "
			+ "customer_id, payment_type, shipping_type, status," 
			+" SUM(price * quantity) as total_amount " 
			+" FROM orders JOIN order_items " 
			+" ON orders.id = order_items.order_id "
			+" WHERE customer_id = ? " 
			+" GROUP BY orders.id " 
			+" ORDER BY orders.id DESC "
			+" LIMIT ?,5 ";
			
			public List<Order> selectOrderHistoryByCustomerIdPage(String id, String page) 
					throws PGException{
				List<Order> list = new ArrayList<>();
				try(	Connection connection = RDBConnection.getConnection();//1,2取得連線
						PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDERS_BY_CUSTOMER_ID_PAGE);//3.準備指令
						){
					//3.1傳入?的值
					pstmt.setString(1, id);
					int p = Integer.parseInt(page);
					if(p==0) {
						p=0;
					}else {
						p = (p-1)*5;
					}
					pstmt.setInt(2, p);
					
					//4.執行指令
					try(ResultSet rs = pstmt.executeQuery()) {
						while(rs.next()) {
							Order order = new Order();
							order.setId(rs.getInt("id"));
							order.setOrderDate(LocalDate.parse(rs.getString("order_date")));
							order.setOrderTime(LocalTime.parse(rs.getString("order_time")));
							order.setPaymentType(PaymentType.valueOf(rs.getString("payment_type")));
							order.setShippingType(ShippingType.valueOf(rs.getString("shipping_type")));
							order.setStatus(rs.getInt("status"));
							order.setTotalAmount(rs.getDouble("total_amount"));
							
							list.add(order);
						}
						
					}
					
				}catch(SQLException ex) {
					throw new PGException("查詢歷史訂單分頁", ex);
				}
				return list;
			}
	
	private static final String SELECT_ORDER_BY_ORDER_ID="SELECT orders.id, orders.order_date, orders.order_time, orders.customer_id, "
		+ "orders.payment_type, orders.payment_fee, orders.payment_note, " 
		+"orders.shipping_type, orders.shipping_fee, orders.shipping_note, orders.shipping_address," 
		+"orders.recipient_name, orders.recipient_email, orders.recipient_phone, orders.status," 
		+"order_items.product_id, order_items.color_name, size, price, quantity," 
		+"products.name," 
		+"product_color.color_photo_url " 
		+"FROM orders " 
		+"LEFT JOIN order_items " 
		+"ON orders.id = order_items.order_id " 
		+"LEFT JOIN products "
		+"ON order_items.product_id=products.id " 
		+"LEFT JOIN product_color " 
		+"ON products.id=product_color.product_id " 
		+"AND order_items.color_name = product_color.color_name " 
		+"WHERE orders.id= ? ";
	
	public Order selectOrderById(String id) throws PGException {
		Order order = null;
		try(	//1,2取得連線
				Connection connection = RDBConnection.getConnection();
				//3.準備指令
				PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDER_BY_ORDER_ID);
				){
			//3.1傳入?的值
			pstmt.setString(1, id);
			//4.執行指令
			try(ResultSet rs = pstmt.executeQuery()){
			//5.處理rs
				while(rs.next()) {
					if(order==null) {
						order = new Order();
						order.setId(rs.getInt("orders.id"));
						order.setOrderDate(LocalDate.parse(rs.getString("orders.order_date")));
						order.setOrderTime(LocalTime.parse(rs.getString("orders.order_time")));
						Customer member = new Customer();
						member.setId(rs.getString("orders.customer_id"));
						order.setMember(member);
						order.setPaymentType(PaymentType.valueOf(rs.getString("orders.payment_type")));
						order.setPaymentFee(rs.getDouble("orders.payment_fee"));
						order.setPaymentNote(rs.getString("orders.payment_note"));
						order.setShippingType(ShippingType.valueOf(rs.getString("orders.shipping_type")));
						order.setShippingFee(rs.getDouble("orders.shipping_fee"));
						order.setShippingNote(rs.getString("shipping_note"));
						order.setRecipientName(rs.getString("orders.recipient_name"));
						order.setRecipientEmail(rs.getString("orders.recipient_email"));
						order.setRecipientPhone(rs.getString("orders.recipient_phone"));
						order.setShippingAddress(rs.getString("orders.shipping_address"));
						order.setStatus(rs.getInt("orders.status"));
						
					}
					
					OrderItem item = new OrderItem();
					item.setOrderId(order.getId());
					Product product = new Product();
					product.setId(rs.getInt("order_items.product_id"));
					product.setName(rs.getString("products.name"));
					item.setProduct(product);
					Color color = new Color();
					color.setColorName(rs.getString("order_items.color_name"));
					color.setPhotoUrl(rs.getString("product_color.color_photo_url"));
					item.setColor(color);
					item.setSize(Size.valueOf(rs.getString("size")));
					item.setPrice(rs.getDouble("price"));
					item.setQuantity(rs.getInt("quantity"));
					
					
					order.add(item);
					
				}
			}
		}catch(SQLException ex) {
			throw new PGException("查詢訂單明細失敗", ex);
		}
		return order;
	}

	
	private static final String SELECT_ORDERS_ROWS_BY_CUSTOMER_ID="SELECT COUNT(*) FROM " 
			+" (SELECT id, order_date, order_time, customer_id, payment_type, shipping_type, status," 
			+" SUM(price * quantity) as total_amount " 
			+" FROM orders JOIN order_items " 
			+" ON orders.id = order_items.order_id " 
			+" WHERE customer_id = ? " 
			+" GROUP BY orders.id " 
			+" ORDER BY orders.id DESC) AS A";
			
			public double selectOrderHistoryRowByCustomerId(String id) 
					throws PGException{
				int row = 0;
				try(	Connection connection = RDBConnection.getConnection();//1,2取得連線
						PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDERS_ROWS_BY_CUSTOMER_ID);//3.準備指令
						){
					//3.1傳入?的值
					pstmt.setString(1, id);
					//4.執行指令
					try(ResultSet rs = pstmt.executeQuery()) {
						while(rs.next()) {
							row = rs.getInt(1);
						}
					}
				}catch(SQLException ex) {
					throw new PGException("查詢歷史訂單筆數", ex);
				}
				return row;
			}
			
}
