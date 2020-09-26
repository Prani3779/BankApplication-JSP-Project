<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.core.bank.Helper"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title>Bank Application...Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <form action="CreateUserPage.jsp" method="post">
        <table align="center" class="table-condensed" style="border-color: green; border-style: double; border-width: 5px;">
            <tr>
                <td colspan="2">
                    <label class="form-control btn-success">Create New User</label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>User Code :</label>
                </td>
                <td>
                    <input type="text" name="txt1" value="" class="form-control">
                </td>
            </tr>
            <tr>
                <td>
                    <label>User Name :</label>
                </td>
                <td>
                    <input type="text" name="txt2" value=""  class="form-control">
                </td>
            </tr>
            <tr>
                <td>
                    <label>Password :</label>
                </td>
                <td>
                    <input type="password" name="pass" value=""  class="form-control" >
                </td>
            </tr>
            <tr>
                <td>
                    <label>User Type :</label>
                </td>
                <td>
                    <select name="cmb1"  class="form-control">
                        <option>Manager</option>
                        <option>Clerk </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <label class="form-control btn-danger">
                        <%
                            try
                            {
                                Connection connection=Helper.connect();
                                PreparedStatement ps= connection.prepareStatement("insert into user values(?,?,?,?)");
                                ps.setString(1,request.getParameter("txt1"));
                                ps.setString(2,request.getParameter("txt2"));
                                ps.setString(3,request.getParameter("pass"));
                                ps.setString(4,request.getParameter("cmb1"));
                                int a=ps.executeUpdate();
                                if(a>0)
                                {
                                    connection.commit();
                                    out.println("User Created Successfully");
                                }
                                else
                                    
                                {
                                    connection.rollback();
                                     out.println("User Not Created .. Try Again");
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
              <tr>
                <td>
                    <input type="reset" name="reset" value="reset"  class="form-control btn-success">
                </td>
                <td align="right">
                <input type="submit" name="submit" value="submit"  class="form-control  btn-success"></td>
            </tr>
        </table>
        </form>
        <script src="jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
