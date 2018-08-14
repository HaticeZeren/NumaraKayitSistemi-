package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BaseDAO {
	private String datasource;
	
	public BaseDAO(String datasource) {
		this.datasource=datasource;
		
	}

	public Connection getConnection() {
		Connection conn = null;
		try {
			InitialContext initCtx = new InitialContext();
			DataSource dataSource = (DataSource) initCtx.lookup(this.datasource);
		    conn = dataSource.getConnection();
	
			/*
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
                   */
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return conn;
	}

	public void closeConnection(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
