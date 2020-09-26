<%@page import="com.core.bank.TransactionLock"%>
<%@page import="com.core.bank.Helper"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<marquee behavior="alternate">Designed By : Pie Infocomm Pvt ltd [Date : <%out.println(new Date());%>][Transaction  Mode :  <%
                        try
                        {
                            Connection connection=Helper.connect();
                            out.println(TransactionLock.getMessage(connection));
                            Helper.disconnect(connection);
                        }
                        catch(Exception e){}
                        %>]</marquee>