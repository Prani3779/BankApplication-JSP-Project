package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        \n");
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
