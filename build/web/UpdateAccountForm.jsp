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
                                <td colspan="3" align="center">
                                    <label class="form-control btn-success">Update Account Form</label>
                                </td>                                
                            </tr>
                            <tr>
                                <td>Account Number</td>
                                <td>
                                    <input type="text" name="txt1" size="30" required="" class="form-control">
                                </td>
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
