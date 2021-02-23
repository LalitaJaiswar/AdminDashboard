package com.tcs.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {
	public static Connection getDBConnection() {
		Connection cn=null;
		try {
			Class.forName("org.postgresql.Driver");
			cn=DriverManager.getConnection("jdbc:postgresql://ec2-52-70-67-123.compute-1.amazonaws.com:5432/d4egkf9ip1kjs7","fktnerteanhylj","dc92a762d0d6ec5c1d486378f11b748c2dc0a220933b9706fa5ad57320017446");
		}
		catch(Exception e) {
			System.out.println("Unable to establsih a connection!"+e);
		}
		return cn;
	}
}

