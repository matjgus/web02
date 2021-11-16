package jdbc;

import java.sql.DriverManager;

import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;


public class DBCPInit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DBCPInit() {
        loadJDBCDriver();
        initConnectionPool();
        
    }
	private void initConnectionPool() {
		try {
      		String url="jdbc:mysql://localhost:3307/javadb";
      		String user="root";
     		String pass="123456";
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(url, user, pass);

			PoolableConnectionFactory poolableConnFactory = 
					new PoolableConnectionFactory(connFactory, null);
			poolableConnFactory.setValidationQuery("select 1");

			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			poolConfig.setTestWhileIdle(true);
			poolConfig.setMinIdle(4);
			poolConfig.setMaxTotal(50);

			GenericObjectPool<PoolableConnection> connectionPool = 
					new GenericObjectPool<>(poolableConnFactory, poolConfig);
			poolableConnFactory.setPool(connectionPool);
			
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = 
					(PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			driver.registerPool("book", connectionPool);
			System.out.println("풀링 드라이버 로딩성공");
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}


	private void loadJDBCDriver() {
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				System.out.println("드라이버 로딩성공");
			} catch (ClassNotFoundException e) {
				throw new RuntimeException("fail to load JDBC Driver",e);
			}
	}

	

}
