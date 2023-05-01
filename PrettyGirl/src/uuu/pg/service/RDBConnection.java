package uuu.pg.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import uuu.pg.entity.PGException;

public class RDBConnection {
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/pg?serverTimezone=UTC";
	private static final String userid = "root";
	private static final String pwd = "89926041";

	public static Connection getConnection() throws PGException{
		try {
            Context ctx = new InitialContext();
            if (ctx == null) {
                throw new PGException("無法取得JNDI Context.");
            }
 
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/pg");//建議這裡紅色粗體字名稱必須與connection pool設定的名稱相同
            if (ds == null) {
                throw new PGException("無法取得DataSource");
            }
            Connection connection = ds.getConnection();
            System.out.println("從Connection Pool取得Connection:" + connection);
            return connection;
        } catch (Exception ex) {
        	System.out.println("無法從Connection Pool取得Connection:" + ex);
			//1.載入JDBC Driver
			try {
				Class.forName(driver);
				
				//2.建立連線			 
				try {
					Connection connection = DriverManager.getConnection(
							url,userid,pwd);
					return connection;
				} catch (SQLException e) {
					throw new PGException("建立資料庫連線失敗", e);
				}			
			} catch (ClassNotFoundException e) {
				throw new PGException("載入JDBC Driver失敗", e);
			}
        }
	}
	
}
