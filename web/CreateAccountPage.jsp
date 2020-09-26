<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.core.bank.Helper"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.core.bank.Validator"%>
<html>
    <head>
        <title>Bank Application...Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <table style="width: 100%; height: 100%">
            <tr>
                <td align="center">
                    <form action="CreateAccountPage.jsp" method="Post">
                        <table class="table-condensed" style="border-color: green; border-style: double; border-width: 5px">
                            <tr>
                                <td colspan="2" align="center">
                                    <label class="form-control btn-success">Create Account Form</label>
                                </td>
                            </tr>
                            <tr>
                                <td>Account Number</td>
                                <td>
                                    <input type="text" name="txt1" size="30" required="" class="form-control" value="<%out.println(request.getParameter("txt1"));%>">
                                </td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td>
                                    <input type="text" name="txt2" size="30" required="" class="form-control" value="<%out.println(request.getParameter("txt2"));%>">
                                </td>
                            </tr>
                            <tr>
                                <td>Balance</td>
                                <td>
                                    <input type="text" name="txt3" size="30" required="" class="form-control" value="<%out.println(request.getParameter("txt3"));%>">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <label class="form-control btn-danger">
                                        <%
                                            try
                                            {
                                                if(Validator.isInteger(request.getParameter("txt1")))
                                                {
                                                    if(Validator.isName(request.getParameter("txt2")))
                                                    {
                                                        if(Validator.isDouble(request.getParameter("txt3")))
                                                        {
                                                            if(Double.parseDouble(request.getParameter("txt3"))>=1000)
                                                            {
                                                                Connection connection=Helper.connect();
                                                                PreparedStatement ps=connection.prepareStatement("insert into account values(?,?,?)");
                                                                ps.setString(1, request.getParameter("txt1"));
                                                                ps.setString(2, request.getParameter("txt2"));
                                                                ps.setString(3, request.getParameter("txt3"));
                                                                int a=ps.executeUpdate();
                                                                if(a>0)
                                                                {
                                                                    connection.commit();
                                                                    out.println("Account Created Successfully");
                                                                }
                                                                else
                                                                {
                                                                    connection.rollback();
                                                                    out.println("Account Not Created");
                                                                }
                                                                Helper.disconnect(connection);
                                                            }
                                                            else
                                                            {
                                                                throw new Exception("Opening Balance Must Be Rs.1000 or Above");
                                                            }
                                                        }
                                                        else
                                                        {
                                                            throw new Exception("Invalid Balance");
                                                        }
                                                    }
                                                    else
                                                    {
                                                        throw new Exception("Invalid Name");
                                                    }
                                                }
                                                else
                                                {
                                                    throw new Exception("Invalid Account Number");
                                                }
                                            }
                                            catch(Exception e)
                                            {
                                                out.println(e.getMessage());
                                            }
                                        %>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="Reset" name="Reset" value="Reset" class="btn btn-success"></td>
                                <td align="Right"><input type="Submit" name="Submit" value="Submit"  class="btn btn-success"></td>
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
