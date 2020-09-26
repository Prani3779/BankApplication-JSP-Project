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
                                    <input type="text" name="txt1" size="30" required="" class="form-control">
                                </td>
                            </tr>                                
                            <tr>
                                <td>Date (dd/mm/yyyy)</td>
                                <td>
                                    <input type="text" name="txt2" size="30" required="" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td>Amount</td>
                                <td>
                                    <input type="text" name="txt3" size="30" required="" class="form-control">
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
