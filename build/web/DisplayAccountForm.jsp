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
        <table style="width: 100%; height: 100%">
            <tr>
                <td align="center">
                    <%
                        try {
                            Connection connection = Helper.connect();
                            PreparedStatement ps = connection.prepareStatement("select * from account where accountnumber=?");
                            ps.setString(1, request.getParameter("txt1"));
                            ResultSet rs = ps.executeQuery();
                            if (rs.next()) {
                    %>
                    <form action="UpdateAccountPage.jsp" method="Post">
                        <table class="table-condensed" style="border-color: green; border-style: double; border-width: 5px">
                            <tr>
                                <td colspan="2" align="center">
                                    <label class="form-control btn-success">Update Account Form</label>
                                </td>
                            </tr>
                            <tr>
                                <td>Account Number</td>
                                <td>
                                    <input type="text" name="txt1" size="30" required="" class="form-control" value="<%=rs.getString(1)%>" readonly="">
                                </td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td>
                                    <input type="text" name="txt2" size="30" required="" class="form-control" value="<%=rs.getString(2)%>">
                                </td>
                            </tr>
                            <tr>
                                <td>Balance</td>
                                <td>
                                    <input type="text" name="txt3" size="30" required="" class="form-control" value="<%=rs.getString(3)%>">
                                </td>
                            </tr>
                            <tr>
                                <td><input type="Reset" name="Reset" value="Reset" class="btn btn-success"></td>
                                <td align="Right"><input type="Submit" name="Submit" value="Submit"  class="btn btn-success"></td>
                            </tr>
                        </table>
                    </form>
                    <%
                        } else {
                            out.println("Account Number Not Found...Try Again");
                        }
                        Helper.disconnect(connection);
                    } catch (Exception e) {
                    %>
                    <label class="form-control btn-danger"><%=e.getMessage()%></label>
                    <%
                        }
                    %>
                </td>
            </tr>
        </table>
        <script src="jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
