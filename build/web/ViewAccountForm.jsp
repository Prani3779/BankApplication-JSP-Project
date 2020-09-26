<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.core.bank.Helper"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title>Bank Application...Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <table class="table-condensed table-hover table-bordered" align="center">
            <tr>
                <td>
                    <label class="form-control btn btn-success">S.NO</label>
                </td>
                <td>
                    <label class="form-control btn btn-success">AC  / NO</label>
                </td>
                <td>
                    <label class="form-control btn btn-success">NAME</label>
                </td>
                <td>
                    <label class="form-control btn btn-success">BALANCE</label>
                </td>
            </tr>
            <%
                try
                {
                    int i=1;
                    Connection connection=Helper.connect();
                    PreparedStatement ps=connection.prepareStatement("select * from account order by name asc ");
                    ResultSet rs=ps.executeQuery();
                    while(rs.next())
                    {
                        %>
                        <tr>
                            <td align="center">
                                <label class="form-control"><%=(i++)%></label>
                            </td>
                            <td align="center">
                                <label class="form-control"><%=rs.getString(1)%></label>
                            </td>
                            <td>
                                <label class="form-control"><%=rs.getString(2).toUpperCase()%></label>
                            </td>
                            <td align="center">
                                <label class="form-control"><%=rs.getString(3)%></label>
                            </td>
                        </tr>
                        <%
                    }
                    Helper.disconnect(connection);
                }
                catch(Exception e)
                {
                    %>
                    <tr>
                        <td align="center">
                            <label class="form-control btn btn-danger">
                                <%out.println(e.getMessage());%>
                            </label>
                        </td>
                    </tr>
                    <%
                }
            %>
        </table>
        <script src="jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
