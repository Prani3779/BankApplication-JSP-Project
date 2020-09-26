<%@page import="java.util.Random"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.core.bank.Helper"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.core.bank.FileUploadManager"%>
<%@page import="java.io.File"%>
<%!
    boolean flag=false;
    String fileName="";
    int accountNumber=0;
%>
<%
    try
    {
        File file=new File(application.getRealPath("photograph"));
        FileUploadManager fum=new FileUploadManager(request, file);
        flag=fum.save();
        fileName=fum.getFileName();
        accountNumber=Integer.parseInt(fum.getFormValue("txt0"));
    }
    catch(Exception e)
    {
        response.sendError(501,e.getMessage());
    }
%>
<html>
    <head>
        <title>Bank Application...Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <table style="width: 100%; height: 100%">
            <tr>
                <td align="center">
                    <table class="table-condensed table-bordered">
                        <tr>                
                            <td>
                                <label class="form-control btn-success">USER CODE : <%out.println(session.getAttribute("USER_CODE"));%></label>
                            </td>
                            <td>
                                <label class="form-control btn-success">USER NAME : <%out.println(session.getAttribute("N"));%></label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <img src="photograph/<%=fileName%>" height="200" width="310"></img>                    
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="form-control btn-success">
                                    <%
                                        try
                                        {
                                            Connection connection=Helper.connect();
                                            PreparedStatement ps=connection.prepareStatement("insert into photo values(?,?,?)");
                                            ps.setInt(1, new Random().nextInt(100000000));                                            
                                            ps.setInt(2, accountNumber);
                                            ps.setString(3, fileName);
                                            int a=ps.executeUpdate();
                                            if(a==1)
                                            {
                                                connection.commit(); 
                                                out.println("Photograph Uploaded");
                                            }
                                            else
                                            {
                                                connection.rollback();
                                                out.println("Photograph Not Uploaded");
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
                </td>
            </tr>
        </table>

        <script src="jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
