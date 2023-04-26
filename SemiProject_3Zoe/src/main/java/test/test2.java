package test;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.jdbc.pool.DataSource;

public class test2 {

	public static void main(String[] args) {
		Connection conn=null;
	    
	    Boolean connect=false;
	    try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/junDB");
			
			conn = ds.getConnection();
			connect = true;
	    }catch(Exception e){
	       connect=false;
	       e.printStackTrace();
	    }
	    
	    if(connect){
	    	System.out.println("연결o");
	    }else{
	    	System.out.println("연결x");
	    }

	}

}
