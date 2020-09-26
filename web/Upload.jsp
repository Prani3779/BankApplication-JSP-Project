<html>
    <head>
        <title>Bank Application...Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <form action="UploadPage.jsp" method="Post" enctype="multipart/form-data">
            <table class="table-condensed" align="center">
            <tr>
                <td>
                    <label>Account No :</label>
                </td>
                <td>
                    <input type="text" name="txt0" size="10" required="">
                </td>
                <td>
                    <label>Select Photograph :</label>
                </td>
                <td>
                    <input type="file" name="txt1" size="30" required="">
                </td>
                <td>
                    <input type="Submit" name="Submit" value="Upload" class="form-control btn-success">
                </td>
            </tr>
        </table>
        </form>
        <script src="jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
