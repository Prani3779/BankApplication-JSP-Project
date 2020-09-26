package com.core.bank;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class Helper 
{   
    
    public static Connection connect()
    {
        Connection cn=null;
        try
        {
         Class.forName("oracle.jdbc.driver.OracleDriver");
            cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PriyaRani","abc");
            if(!cn.isClosed())
            {
                cn.setAutoCommit(false);
            }
        }
        catch(Exception e)
        {
            
        }
        return cn;
    }
    public static void disconnect(Connection connection)
    {        
        try
        {
            if(!connection.isClosed())
            {
                connection.close();
            }
        }
        catch(Exception e){}
        
    }

    
}
