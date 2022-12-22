package model1.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBUtil {
	// 필드가 없는건 this가 없으니까 객체를 생성할 필요가 없다 => static
	public static Connection getConnection() throws Exception {
		String driver = "org.mariadb.jdbc.Driver"; 
		String dbUrl = "jdbc:mariadb://localhost:3306/mvc";
		String dbUser = "root";
		String dbPw = "java1234";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
		return conn;
	}
	
	public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
		try {
			if(rs != null) {
				rs.close(); 
			}
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
