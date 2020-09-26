package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Date;
import java.io.File;
import java.io.FileWriter;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import com.core.bank.Helper;
import java.sql.Connection;
import com.core.bank.Validator;

public final class ValidateLoginPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Bank Application...Login</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <table style=\"width: 100%; height: 100%\">\n");
      out.write("            <tr>\n");
      out.write("                <td align=\"center\">\n");
      out.write("                    <form action=\"ValidateLoginPage.jsp\" method=\"Post\">\n");
      out.write("                            <table class=\"table-condensed\" style=\"border-color: green; border-style: double; border-width: 5px\">\n");
      out.write("                            <tr>\n");
      out.write("                                <td colspan=\"2\">\n");
      out.write("                                    <label class=\"btn btn-success form-control\">Bank Application Login</label>\n");
      out.write("                                </td>                                    \n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>User Code</td>\n");
      out.write("                                <td>\n");
      out.write("                                    <input type=\"text\" name=\"txt1\" size=\"30\" required=\"\" class=\"form-control\">\n");
      out.write("                                </td>                                    \n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Password</td>\n");
      out.write("                                <td>\n");
      out.write("                                    <input type=\"password\" name=\"txt2\" size=\"30\" required=\"\" class=\"form-control\">\n");
      out.write("                                </td>                                    \n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>User Type</td>\n");
      out.write("                                <td>\n");
      out.write("                                    <select name=\"cbo1\" class=\"form-control\">\n");
      out.write("                                        <option value=\"M\">Manager</option>\n");
      out.write("                                        <option value=\"C\">Clerk</option>\n");
      out.write("                                    </select>\n");
      out.write("                                </td>                                    \n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td align=\"center\" colspan=\"2\">\n");
      out.write("                                    <label class=\"btn-danger form-control\">\n");
      out.write("                                        ");

                                            try
                                            {
                                                if(Validator.isInteger(request.getParameter("txt1")))
                                                {
                                                    if(request.getParameter("txt2").length()>0)
                                                    {
                                                        Connection connection=(Connection)application.getAttribute("DB");
                                                        PreparedStatement ps=connection.prepareStatement("select password,name,type from user_details where usercode=?");
                                                        ps.setString(1, request.getParameter("txt1"));
                                                        ResultSet rs=ps.executeQuery();
                                                        if(rs.next())
                                                        {
                                                            if(request.getParameter("txt2").equals(rs.getString(1)))
                                                            {
                                                                String name=rs.getString(2).toUpperCase();
                                                                if(request.getParameter("cbo1").equalsIgnoreCase(rs.getString(3)))
                                                                {
                                                                    
                                                                    
                                                                    session.setAttribute("USER_CODE", request.getParameter("txt1"));
                                                                    session.setAttribute("N", name);
                                                                    session.setAttribute("T", request.getParameter("cbo1"));
                                                                    
                                                                    String str="["+request.getParameter("txt1")+"-"+name+"-"+request.getParameter("cbo1")+"]["+request.getRemoteAddr()+"]["+(new Date())+"]\n";
                                                                    FileWriter fw=new FileWriter(new File(application.getRealPath("log.txt")),true);
                                                                    fw.write(str);
                                                                    fw.close();
                                                                    
                                                                    response.sendRedirect(request.getParameter("cbo1").equals("M") ? "ManagerPage.jsp":"ClerkPage.jsp");
                                                                }
                                                                else
                                                                {
                                                                    out.println(name+" !.... ACCESS DENIED");
                                                                }
                                                            }
                                                            else
                                                            {
                                                                out.println("Password Authentication Failure");
                                                            }
                                                        }
                                                        else
                                                        {
                                                            out.println("User Not Found");
                                                        }
                                                        
                                                    }
                                                    else
                                                    {
                                                        throw new Exception("Password Is Missing");
                                                    }
                                                }
                                                else
                                                {
                                                    throw new Exception("Invalid User Code");
                                                }
                                            }
                                            catch(Exception e)
                                            {
                                                out.println(e.getMessage());
                                            }
                                        
      out.write("\n");
      out.write("                                    </label>\n");
      out.write("                                </td>                                    \n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>\n");
      out.write("                                    <input type=\"Reset\" name=\"Reset\" value=\"Reset\" class=\"btn btn-success\">\n");
      out.write("                                </td>\n");
      out.write("                                <td align=\"right\">\n");
      out.write("                                    <input type=\"Submit\" name=\"Submit\" value=\"Submit\"  class=\"btn btn-success\">\n");
      out.write("                                </td>                                    \n");
      out.write("                            </tr>\n");
      out.write("                        </table>\n");
      out.write("                    </form>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("        <script src=\"jquery.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
