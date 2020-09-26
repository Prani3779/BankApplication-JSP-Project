<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
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
        <table style="width: 100%; height: 100%">
            <tr>
                <td align="center">
                    <form action="ValidateLoginPage.jsp" method="Post">
                            <table class="table-condensed" style="border-color: green; border-style: double; border-width: 5px">
                            <tr>
                                <td colspan="2">
                                    <label class="btn btn-success form-control">Bank Application Login</label>
                                </td>                                    
                            </tr>
                            <tr>
                                <td>User Code</td>
                                <td>
                                    <input type="text" name="txt1" size="30" required="" class="form-control">
                                </td>                                    
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td>
                                    <input type="password" name="txt2" size="30" required="" class="form-control">
                                </td>                                    
                            </tr>
                            <tr>
                                <td>User Type</td>
                                <td>
                                    <select name="cbo1" class="form-control">
                                        <option value="M">Manager</option>
                                        <option value="C">Clerk</option>
                                    </select>
                                </td>                                    
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <label class="btn-danger form-control">
                                        <%
                                            try
                                            {
                                                if(Validator.isInteger(request.getParameter("txt1")))
                                                {
                                                    if(request.getParameter("txt2").length()>0)
                                                    {
                                                        Connection connection=(Connection)application.getAttribute("DB");
                                                        PreparedStatement ps=connection.prepareStatement("select password,name,type from user_details where usercode=?");
                                                        ps.setString(1, request.getParameter("txt1"));
                                                        ResultSet rs=ps.executeQuery();
                                                        if(rs.next())
                                                        {
                                                            if(request.getParameter("txt2").equals(rs.getString(1)))
                                                            {
                                                                String name=rs.getString(2).toUpperCase();
                                                                if(request.getParameter("cbo1").equalsIgnoreCase(rs.getString(3)))
                                                                {
                                                                    
                                                                    
                                                                    session.setAttribute("USER_CODE", request.getParameter("txt1"));
                                                                    session.setAttribute("N", name);
                                                                    session.setAttribute("T", request.getParameter("cbo1"));
                                                                    
                                                                    String str="["+request.getParameter("txt1")+"-"+name+"-"+request.getParameter("cbo1")+"]["+request.getRemoteAddr()+"]["+(new Date())+"]\n";
                                                                    FileWriter fw=new FileWriter(new File(application.getRealPath("log.txt")),true);
                                                                    fw.write(str);
                                                                    fw.close();
                                                                    
                                                                    response.sendRedirect(request.getParameter("cbo1").equals("M") ? "ManagerPage.jsp":"ClerkPage.jsp");
                                                                }
                                                                else
                                                                {
                                                                    out.println(name+" !.... ACCESS DENIED");
                                                                }
                                                            }
                                                            else
                                                            {
                                                                out.println("Password Authentication Failure");
                                                            }
                                                        }
                                                        else
                                                        {
                                                            out.println("User Not Found");
                                                        }
                                                        
                                                    }
                                                    else
                                                    {
                                                        throw new Exception("Password Is Missing");
                                                    }
                                                }
                                                else
                                                {
                                                    throw new Exception("Invalid User Code");
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
                                <td>
                                    <input type="Reset" name="Reset" value="Reset" class="btn btn-success">
                                </td>
                                <td align="right">
                                    <input type="Submit" name="Submit" value="Submit"  class="btn btn-success">
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
