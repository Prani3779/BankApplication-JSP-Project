<%@page import="com.core.bank.TransactionLock"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.core.bank.Helper"%>
<html>
    <head>
        <title>Bank Application...Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <label class="h1 btn-danger form-control">
            <%
            if(session.getAttribute("T")!=null)
            {
                String str=(String)session.getAttribute("T");
                if(str.equalsIgnoreCase("M"))
                {
                    int option=Integer.parseInt(request.getParameter("cbo1"));
                    try
                    {
                        Connection connection=Helper.connect();
                        switch(option)
                        {
                            case 1:
                                if(!TransactionLock.isLocked(connection))
                                {
                                    TransactionLock.lock(connection);
                                    out.println(TransactionLock.MESSAGE);
                                }
                                break;
                            case 0:
                                if(TransactionLock.isLocked(connection))
                                {
                                    TransactionLock.unlock(connection);
                                    out.println(TransactionLock.MESSAGE);
                                }
                                break;
                        }
                        Helper.disconnect(connection);
                    }
                    catch(Exception e)
                    {
                        response.sendError(501,e.getMessage());
                    }
                }
                else
                {
                    response.sendError(501,"You Are Not Authorized To Perform This Action");
                }
            }
            else
            {
                response.sendError(501,"You Are Not Authorized To View This Page");
            }
        %>
        </label>
        <script src="jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

