
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
