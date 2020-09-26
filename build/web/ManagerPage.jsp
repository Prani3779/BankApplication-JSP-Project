<%
    if(session.getAttribute("T")==null)
    {
        response.sendRedirect("index.jsp");
    }
%>
<%@page import="com.core.bank.TransactionLock"%>
<%@page import="com.core.bank.Helper"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>

<html>
    <head>
        <title>Bank Application...Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script>
            function setFooterMessage()
            {
                var url="footerMessage.jsp";
                var req;
                try
                {
                    req=new XMLHttpRequest();
                }
                catch(e)
                {
                    req=new ActiveXObject("Microsoft.XMLHTTP");
                }
                
                req.open("get",url);
                req.onreadystatechange=function()
                {
                    
                    if(req.status==200 && req.readyState==4)
                    {
                        var p=document.getElementById("id1");
                        p.innerHTML=req.responseText;
                    }
                }
                req.send(null);
            }
        </script>
    </head>
    <body>
        <br>
        <table bgcolor="lightgreen" align="center" style="height: 95%; width: 95%;">
            <tr style="height: 20%">
                <td>
                    <p>
                        <label class="btn-success form-control">
                            Bank Application...[WELCOME : <%out.println(session.getAttribute("N"));%>]
                        </label>
                    </p>
                    <ul class="nav nav-pills">
                        <li class="btn-success"><a href="Logout.jsp" target="_top">Log Out</a></li>
                        <li><a href="DepositForm.jsp" target="WORKAREA">Deposit</a></li>
                        <li><a href="WithdrawForm.jsp" target="WORKAREA">Withdraw</a></li>
                        <li><a href="TransferForm.jsp" target="WORKAREA">Transfer</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                Options <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="CreateAccountForm.jsp" target="WORKAREA">Create Account</a></li>
                                <li><a href="UpdateAccountForm.jsp" target="WORKAREA">Update Account</a></li>
                                <li><a href="ViewAccountForm.jsp" target="WORKAREA">View Account</a></li>
                                <li class="divider"></li>
                                <li><a href="CreateUserForm.jsp" target="WORKAREA">Create User</a></li>
                                <li><a href="EditUserForm.jsp" target="WORKAREA">Edit User</a></li>
                                <li><a href="Upload.jsp" target="WORKAREA">Upload Photograph</a></li>
                            </ul>
                        </li>
                        <li><a href="TransactionLockForm.jsp" target="WORKAREA">Transaction Lock</a></li>
                    </ul>               
                </td>
            </tr>
            <tr style="height: 75%">
                <td>
                    <iframe frameborder="0" style="height: 100%; width: 100%" name="WORKAREA" src=""></iframe>
                </td>
            </tr>
            <tr style="height: 5%">
                <td>
                    <label class="form-control btn-success text-right">
                        <div id="id1">
                            
                        </div>
                    </label>
                </td>
            </tr>
        </table>
        <script src="jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
    </body>
</html>
