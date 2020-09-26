<%@page import="com.core.bank.Helper"%>
<%@page import="com.core.bank.TransactionLock"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@include file="module.jsp"%>
<html>
    <head>
        <title>Bank Application...Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script>
            var flag=true;
            
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
                        <li><a href="DepositForm.jsp" target="WORKAREA"  onclick="javascript: return <%=!isLocked()%>;">Deposit</a></li>
                        <li><a href="WithdrawForm.jsp" target="WORKAREA" onclick="javascript: return <%=!isLocked()%>;">Withdraw</a></li>
                        <li><a href="TransferForm.jsp" target="WORKAREA" onclick="javascript: return <%=!isLocked()%>;">Transfer</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                Options <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="" target="WORKAREA" onclick="javascript: return false;">Create Account</a></li>
                                <li><a href="" target="WORKAREA" onclick="javascript: return false;">Update Account</a></li>
                                <li><a href="ViewAccountForm.jsp" target="WORKAREA" onclick="javascript: return <%=!isLocked()%>;">View Account</a></li>
                                <li class="divider"></li>
                                <li><a href="" target="WORKAREA" onclick="javascript: return false;">Create User</a></li>
                                <li><a href="EditUserForm.jsp" target="WORKAREA">Edit User</a></li>
                            </ul>
                        </li>
                        <li><a onclick="setFooterMessage()">Transaction Lock Status</a></li>
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
