
<%!
public boolean isLocked()
{
    boolean b=true;
    try
    {
        java.sql.Connection connection=com.core.bank.Helper.connect();
        b=com.core.bank.TransactionLock.isLocked(connection);
        com.core.bank.Helper.disconnect(connection);                
    }
    catch(Exception e){}
    return b;
}
%>