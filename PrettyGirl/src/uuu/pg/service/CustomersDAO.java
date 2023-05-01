package uuu.pg.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import uuu.pg.entity.Customer;
import uuu.pg.entity.PGException;
import uuu.pg.entity.VIP;
import uuu.pg.service.RDBConnection;

public class CustomersDAO {
	
	private static final String SELECT_CUSTOMER_BY_ID = "SELECT id,name,email,gender,password,birthday,"
			+ "phone,address,discount,class_name "
			+ " FROM customers " 
			+ " WHERE id=? OR email=?";
	public Customer selectCustomerById(String id) throws PGException {
		if(id==null || id.length()==0) {
			throw new IllegalArgumentException("查詢會員時帳號必須給值");
		}
		
		Customer member = null;
		try(Connection connection = RDBConnection.getConnection();//1,2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);//3.準備指令
				){
			//3.1 傳入?的值
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			//4.執行指令
			try(					
				ResultSet rs = pstmt.executeQuery();
			){
				//5.處理rs
				while(rs.next()){
					String className = rs.getString("class_name");
					if("VIP".equals(className)) {
						member = new VIP();
					}else {
						member = new Customer();
					}
					member.setId(rs.getString("id"));
					member.setName(rs.getString("name"));
					member.setEmail(rs.getString("email"));
					member.setGender(rs.getString("gender").charAt(0));
					member.setPassword(rs.getString("password"));
					member.setBirthday(rs.getString("birthday"));
					
					member.setPhone(rs.getString("phone"));
					member.setAddress(rs.getString("address"));
					
					
					if(member instanceof VIP) {
						((VIP)member).setDiscount(rs.getInt("discount"));
					}					
				}
				return member;
			}
		}catch(SQLException e) {			
			throw new PGException("查詢會員失敗", e);			
		}
	}
	
	private static final String INSERT_CUSTOMER = "INSERT INTO customers " 
			+ "	(id, name, password, email, gender, birthday,"
			+ 	" married, phone, address, class_name, discount) " 
			+ "	VALUES(?,?,?,?,?,?,?,?,?,?,?)";
	public void insert(Customer customer) throws PGException{
		try (
				Connection connection = RDBConnection.getConnection();		//1, 2. 取得連線
				PreparedStatement pstmt = connection.prepareStatement(INSERT_CUSTOMER); //3.準備指令
				){
			//3.1傳入?的值
			pstmt.setString(1, customer.getId());
			pstmt.setString(2, customer.getName());
			pstmt.setString(3, customer.getPassword());
			pstmt.setString(4, customer.getEmail());
			pstmt.setString(5, String.valueOf(customer.getGender()));
			pstmt.setString(6, 
				customer.getBirthday()==null?null:String.valueOf(customer.getBirthday()));
			pstmt.setBoolean(7, customer.isMarried());
			pstmt.setString(8, customer.getPhone());
			pstmt.setString(9, customer.getAddress());
			pstmt.setString(10, customer.getClass().getSimpleName());
			if(customer instanceof VIP) {
				pstmt.setInt(11, ((VIP)customer).getDiscount());		
			}else {
				pstmt.setInt(11, 0);
			}
			
			//4.執行指令
			int rows = pstmt.executeUpdate();
			//System.out.println("新增會員成功: " + rows);
		}catch(java.sql.SQLIntegrityConstraintViolationException ex) {
			if(ex.getMessage().indexOf("email_UNIQUE")>=0) {
				throw new PGException("新增會員失敗-email已重複註冊", ex);
			}else if(ex.getMessage().indexOf("PRIMARY")>=0) {
				throw new PGException("新增會員失敗-帳號已重複註冊", ex);
			}else {
				throw new PGException("新增會員失敗-" 
						+ ex.getErrorCode() + ", "+ex.getMessage(), ex);
			}
		} catch (SQLException e) {
			throw new PGException("新增會員失敗", e);
		}
	}

	private static final String UPDATE_CUSTOMER="UPDATE customers " 
			+ "SET name = ?,email = ?,gender = ?,password = ?,birthday = ?," 
			+ "	married = ?,phone = ?,address = ?," 
			+ " discount = ?,class_name = ? " 
			+ " WHERE id = ?";	
	public void update(Customer customer) throws PGException{
		try(
				Connection connection = RDBConnection.getConnection(); //1,2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(UPDATE_CUSTOMER);//3.準備指令
				){
			//3.1 傳入?的值
			pstmt.setString(1, customer.getName());
			pstmt.setString(2, customer.getEmail());
			pstmt.setString(3, String.valueOf(customer.getGender()));
			pstmt.setString(4, customer.getPassword());
			pstmt.setString(5, 
					customer.getBirthday()==null?null:String.valueOf(customer.getBirthday()));
			pstmt.setBoolean(6, customer.isMarried());
			pstmt.setString(7, customer.getPhone());
			pstmt.setString(8, customer.getAddress());
			if(customer instanceof VIP) {
				pstmt.setInt(9, ((VIP)customer).getDiscount());		
			}else {
				pstmt.setInt(9, 0);
			}
			pstmt.setString(10, customer.getClass().getSimpleName());
			pstmt.setString(11, customer.getId());
			
			//4. 執行指令s
			int rows = pstmt.executeUpdate();
			//System.out.println("修改會員成功: " + rows);
		}catch(SQLException ex) {
			throw new PGException("修改會員失敗", ex);
		}		
	}

}
