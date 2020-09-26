package com.core.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TransactionLock 
{
    public static String MESSAGE;
    public static void lock(Connection connection)
    {
        try
        {
            PreparedStatement ps=connection.prepareStatement("update lockmode set mode=1");
            int a=ps.executeUpdate();
            if(a>0)
            {
                connection.commit();
                MESSAGE="Transaction Locked";
            }
            else
            {
                connection.rollback();
                MESSAGE="Transaction Lock failed...Retry";
            }
        }
        catch(Exception e)
        {
            MESSAGE=e.getMessage();
        }
    }
    public static void unlock(Connection connection)
    {
        try
        {
            PreparedStatement ps=connection.prepareStatement("update lockmode set mode=0");
            int a=ps.executeUpdate();
            if(a>0)
            {
                connection.commit();
                MESSAGE="Transaction Unlocked";
            }
            else
            {
                connection.rollback();
                MESSAGE="Transaction Unlock failed...Retry";
            }
        }
        catch(Exception e)
        {
            MESSAGE=e.getMessage();
        }
    }
    public static boolean isLocked(Connection connection)
    {
        int a=1;
        try
        {
            PreparedStatement ps=connection.prepareStatement("select * from lockmode");
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                a=rs.getInt(1);
            }            
        }
        catch(Exception e)
        {
            MESSAGE=e.getMessage();
        }
        return a==1;
    }
    public static String getMessage(Connection connection)
    {
        return isLocked(connection) ? "Transaction Locked":"Transacion Unlocked";
    }
    
}
