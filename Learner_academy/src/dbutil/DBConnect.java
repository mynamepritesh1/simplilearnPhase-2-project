package dbutil;

import java.sql.Connection;
import java.sql.DriverManager;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;


public class DBConnect {
	


private static Connection conn;
	public static Connection getConn()
	{
		try {
			
			if(conn==null)
			{
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/schoolacademy","root","pritesh");
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}


	}