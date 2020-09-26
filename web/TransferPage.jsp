<%@page import="com.core.bank.TransferFund"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.core.bank.Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.core.bank.Validator"%>
<html>
    <head>
        <title>Bank Application...Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script lang="javascript">
            function myfunction()
            {                 
                var p=document.all("id1");
                if(p.style.visibility=="hidden")
                {
                    p.style.visibility="visible";
                }
                else
                {
                    p.style.visibility="hidden";
                }
            }
            
        </script>
    </head>
    <body>
        <table style="height: 100%; width: 100%">
            <tr>
                <td align="center">
                    <form action="TransferPage.jsp" method="Post">
                        <table class="table-condensed" style="border-style: double; border-width: 5px; border-color: green">
                            <tr>
                                <td colspan="2">
                                    <label class="form-control btn btn-success">Transfer Fund Transaction Form</label>
                                </td>
                            </tr>
                            <tr>
                                <td>Debit Account Number</td>
                                <td>
                                    <input type="text" name="txt1" size="30" required="" class="form-control" value="<%out.println(request.getParameter("txt1"));%>">
                                </td>
                            </tr>                                
                            <tr>
                                <td>Credit Account Number</td>
                                <td>
                                    <input type="text" name="txt2" size="30" required="" class="form-control" value="<%out.println(request.getParameter("txt2"));%>">
                                </td>
                            </tr> 
                            <tr>
                                <td>Date</td>
                                <td>
                                    <input type="text" name="txt3" size="30" required="" class="form-control" value="<%out.println(request.getParameter("txt3"));%>">
                                </td>
                            </tr>
                            <tr>
                                <td>Amount</td>
                                <td>
                                    <input type="text" name="txt4" size="30" required="" class="form-control" value="<%out.println(request.getParameter("txt4"));%>">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    
                                    <label class="form-control btn-danger">
                                        <div id="id1" style="visibility: visible">
                                        <%
                                            try {
                                                if (Validator.isInteger(request.getParameter("txt1")) && Validator.isInteger(request.getParameter("txt2"))) {
                                                    if (Validator.isDate(request.getParameter("txt3"))) {
                                                        if (Validator.isDouble(request.getParameter("txt4"))) {
                                                            double amt = Double.valueOf(request.getParameter("txt4"));
                                                            if (amt > 0.0) {
                                                                Connection connection = Helper.connect();
                                                                TransferFund transferFund=new TransferFund();
                                                                
                                                                transferFund.setDebitAccountNumber(Integer.valueOf(request.getParameter("txt1")));
                                                                transferFund.setCreditAccountNumber(Integer.valueOf(request.getParameter("txt2")));
                                                                transferFund.setDate(request.getParameter("txt3"));
                                                                transferFund.setAmount(Double.valueOf(request.getParameter("txt4")));
                                                                
                                                                if(transferFund.exists(connection))
                                                                {
                                                                    transferFund.withdraw(connection);
                                                                    out.println(TransferFund.MESSAGE);
                                                                }
                                                                else
                                                                {
                                                                    out.println(TransferFund.MESSAGE);
                                                                }
                                                                Helper.disconnect(connection);

                                                            } else {
                                                                throw new Exception("Amount Must Be More Than Zero");
                                                            }
                                                        } else {
                                                            throw new Exception("Invalid Transaction Amount");
                                                        }
                                                    } else {
                                                    }
                                                } else {
                                                    out.println("Account Number Does Not Exists");
                                                }
                                                
                                            } catch (Exception e) {
                                                out.println(e.getMessage());
                                            }
                                        %>
                                        </div>
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
        <script>
            var win=window.setInterval("myfunction()",500);
        </script>
    </body>
</html>
