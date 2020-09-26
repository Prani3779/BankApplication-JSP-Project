package com.core.bank;

import java.sql.Connection;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DatabaseListener implements ServletContextListener
{
    private Connection connection;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) 
    {
        try
        {
            connection=Helper.connect();
            if(!connection.isClosed())
            {
                sce.getServletContext().setAttribute("DB", connection);
            }
        }
        catch(Exception e){}
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) 
    {
        Helper.disconnect(connection);
    }
    
}
