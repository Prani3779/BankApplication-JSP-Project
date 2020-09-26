<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
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
        <table style="height: 100%; width: 100%">
            <tr>
                <td align="center">
                    <form action="DepositPage.jsp" method="Post">
                        <table class="table-condensed" style="border-style: double; border-width: 5px; border-color: green">
                            <tr>
                                <td colspan="2">
                                    <label class="form-control btn btn-success">Deposit Transaction Form</label>
                                </td>
                            </tr>
                            <tr>
                                <td>Account Number</td>
                                <td>
                                    <input type="text" name="txt1" size="30" required="" class="form-control" value="<%out.println(request.getParameter("txt1"));%>">
                                </td>
                            </tr>                                
                            <tr>
                                <td>Date (dd/mm/yyyy)</td>
                                <td>
                                    <input type="text" name="txt2" size="30" required="" class="form-control" value="<%out.println(request.getParameter("txt2"));%>">
                                </td>
                            </tr>
                            <tr>
                                <td>Amount</td>
                                <td>
                                    <input type="text" name="txt3" size="30" required="" class="form-control" value="<%out.println(request.getParameter("txt3"));%>">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <label class="btn btn-danger form-control">
                                        <%
                                            try
                                            {
                                                if(Validator.isInteger(request.getParameter("txt1")))
                                                {
                                                    if(Validator.isDate(request.getParameter("txt2")))
                                                    {
                                                        if(Validator.isDouble(request.getParameter("txt3")))
                                                        {
                                                            double amt=Double.valueOf(request.getParameter("txt3"));
                                                            if(amt>0.0)
                                                            {
                                                                Connection connection=Helper.connect();
                                                                PreparedStatement ps=connection.prepareStatement("select * from account where accountnumber=?");
                                                                ps.setString(1, request.getParameter("txt1"));
                                                                ResultSet rs=ps.executeQuery();
                                                                if(rs.next())
                                                                {
                                                                    int tid=new Random().nextInt(1000000000);
                                                                    ps=connection.prepareStatement("insert into deposit values(?,?,?,?)");
                                                                    ps.setInt(1, tid);
                                                                    ps.setString(2, request.getParameter("txt2"));
                                                                    ps.setString(3, request.getParameter("txt3"));
                                                                    ps.setString(4, request.getParameter("txt1"));
                                                                    int a=ps.executeUpdate();
                                                                    if(a==1)
                                                                    {
                                                                        ps=connection.prepareStatement("update account set balance=balance+? where accountnumber=?");
                                                                        ps.setString(1, request.getParameter("txt3"));
                                                                        ps.setString(2, request.getParameter("txt1"));
                                                                        a+=ps.executeUpdate();
                                                                        if(a==2)
                                                                        {
                                                                            connection.commit();
                                                                            out.println("Transaction Successfull...TID : "+tid);
                                                                        }
                                                                        else
                                                                        {
                                                                            connection.rollback();
                                                                            out.println("Transaction Declined...Retry");
                                                                        }
                                                                    }
                                                                }
                                                                else
                                                                {
                                                                    out.println("Account Number Does Not Exists");
                                                                }
                                                                Helper.disconnect(connection);
                                                            }
                                                            else
                                                            {
                                                                throw new Exception("Amount Must Be More Than Zero");
                                                            }
                                                        }
                                                        else
                                                        {
                                                            throw new Exception("Invalid Transaction Amount");
                                                        }
                                                    }
                                                    else
                                                    {
                                                        throw new Exception("Invalid Date Format");
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
                                <td><input type="Reset" name="Reset" value="Reset" class="btn-success form-control"></td>
                                <td align="right"><input type="Submit" name="Submit" value="Submit" class="btn-success form-control"></td>
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
