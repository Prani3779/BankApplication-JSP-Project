package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import com.core.bank.Helper;
import java.sql.Connection;

public final class DisplayAccountForm_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Bank Application...Login</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <table style=\"width: 100%; height: 100%\">\n");
      out.write("            <tr>\n");
      out.write("                <td align=\"center\">\n");
      out.write("                    ");

                        try {
                            Connection connection = Helper.connect();
                            PreparedStatement ps = connection.prepareStatement("select * from account where accountnumber=?");
                            ps.setString(1, request.getParameter("txt1"));
                            ResultSet rs = ps.executeQuery();
                            if (rs.next()) {
                    
      out.write("\n");
      out.write("                    <form action=\"UpdateAccountPage.jsp\" method=\"Post\">\n");
      out.write("                        <table class=\"table-condensed\" style=\"border-color: green; border-style: double; border-width: 5px\">\n");
      out.write("                            <tr>\n");
      out.write("                                <td colspan=\"2\" align=\"center\">\n");
      out.write("                                    <label class=\"form-control btn-success\">Update Account Form</label>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Account Number</td>\n");
      out.write("                                <td>\n");
      out.write("                                    <input type=\"text\" name=\"txt1\" size=\"30\" required=\"\" class=\"form-control\" value=\"");
      out.print(rs.getString(1));
      out.write("\" readonly=\"\">\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Name</td>\n");
      out.write("                                <td>\n");
      out.write("                                    <input type=\"text\" name=\"txt2\" size=\"30\" required=\"\" class=\"form-control\" value=\"");
      out.print(rs.getString(2));
      out.write("\">\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Balance</td>\n");
      out.write("                                <td>\n");
      out.write("                                    <input type=\"text\" name=\"txt3\" size=\"30\" required=\"\" class=\"form-control\" value=\"");
      out.print(rs.getString(3));
      out.write("\">\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td><input type=\"Reset\" name=\"Reset\" value=\"Reset\" class=\"btn btn-success\"></td>\n");
      out.write("                                <td align=\"Right\"><input type=\"Submit\" name=\"Submit\" value=\"Submit\"  class=\"btn btn-success\"></td>\n");
      out.write("                            </tr>\n");
      out.write("                        </table>\n");
      out.write("                    </form>\n");
      out.write("                    ");

                        } else {
                            out.println("Account Number Not Found...Try Again");
                        }
                        Helper.disconnect(connection);
                    } catch (Exception e) {
                    
      out.write("\n");
      out.write("                    <label class=\"form-control btn-danger\">");
      out.print(e.getMessage());
      out.write("</label>\n");
      out.write("                    ");

                        }
                    
      out.write("\n");
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
