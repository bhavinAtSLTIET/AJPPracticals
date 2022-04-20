package org.apache.jsp.Practical9;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.util.List;

public final class getUserCart_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>User Cart</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");

            if (request.getParameter("add") != null) {

                if (session.getAttribute("items") != null) {
                    List<String> items = (List<String>) session.getAttribute("items");
                    items.add(request.getParameter("item"));
                    session.setAttribute("items", items);
                            } else {
                                List<String> items = new ArrayList<>();
                                items.add(request.getParameter("item"));
                                session.setAttribute("items", items);
                            }
                        } else if (request.getParameter("delete") != null) {
                            List<String> items = (List<String>) session.getAttribute("items");
                            items.remove(Integer.parseInt(request.getParameter("delete")));
                            session.setAttribute("items", items);
                        }
            if (!session.isNew()) {
                if (session.getAttribute("items") != null) {
                    List<String> items = (List<String>) session.getAttribute("items");
                    out.println("Items in cart: <form method='POST'><ol>");
                    int index = 0;
                    for (String item : items) {
                        out.println("<li>" + item + " <button type='submit' name='delete' value='" + index + "'>Delete</button></li>");
                        index++;
                    }
                    out.println("</ol></form>");
                } else {
                        out.println("No items in cart!");
                    }
            }
        
      out.write("\n");
      out.write("        <form action=\"\" method=\"POST\">\n");
      out.write("            Add Item: <input type=\"text\" name=\"item\" required>\n");
      out.write("            <input type=\"submit\" name=\"add\" value=\"Add to cart\">\n");
      out.write("        </form>\n");
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
