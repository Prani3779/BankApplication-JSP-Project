<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.core.bank.Helper"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title>Bank Application...Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <table style="width: 100%; height: 100%">
            <tr>
                <td align="center">
                    <form action="DisplayAccountForm.jsp" method="Post">
                        <table class="table-condensed" style="border-color: green; border-style: double; border-width: 5px">
                            <tr>
                                <td align="center">
                                    <label class="form-control btn-success">
                                        <%
                                            try
                                            {
                                                Connection connection=Helper.connect();
                                                PreparedStatement ps=connection.prepareStatement("update account set name=?,balance=? where accountnumber=?");
                                                ps.setString(1, request.getParameter("txt2"));
                                                ps.setString(2, request.getParameter("txt3"));
                                                ps.setString(3, request.getParameter("txt1"));
                                                
                                                int a=ps.executeUpdate();
                                                if(a>0)
                                                {
                                                    connection.commit();
                                                    out.println("Account Updated Successfully");
                                                }
                                                else
                                                {
                                                    connection.rollback();
                                                    out.println("Account Not Updated");
                                                }
                                                Helper.disconnect(connection);
                                            }
                                            catch(Exception e)
                                            {
                                                out.println(e.getMessage());
                                            }
                                        %>
                                    </label>
                                </td>                                
                            </tr>                                                        
                        </table>
                    </form>
                </td>
            </tr>
        </table>
        <script src="jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
