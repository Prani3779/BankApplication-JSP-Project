<html>
    <head>
        <title>Bank Application...Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <form action="ActivateTransactionPage.jsp" method="Post">
            <table class="table-condensed" align="center">
            <tr>
                <td>
                    <label>Transaction Lock :</label>
                </td>
                <td>
                    <select name="cbo1" class="form-control">
                        <option value="1">Lock</option>
                        <option value="0">Unlock</option>
                    </select>
                </td>
                <td>
                    <input type="Submit" name="Submit" value="Submit" class="form-control btn-success">
                </td>
            </tr>
        </table>
        </form>
        <script src="jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
