package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import modeloDAO.TipoDocumentoDAO;
import modeloVO.TipoDocumentoVO;

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
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n");
      out.write("        <title>Biovet</title>\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <!-- CSS here -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/owl.carousel.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/magnific-popup.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/themify-icons.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/nice-select.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/flaticon.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/gijgo.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/animate.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/slicknav.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        ");

            TipoDocumentoVO documentoVO = new TipoDocumentoVO();
            TipoDocumentoDAO documentoDAO = new TipoDocumentoDAO();

            ArrayList<TipoDocumentoVO> arrayTipoDoc = documentoDAO.consultarGeneral();

        
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- Inicio Area Cabecera -->    \n");
      out.write("        <header>\n");
      out.write("            <div class=\"header-area\">\n");
      out.write("                <div id=\"sticky-header\" class=\"main-header-area\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <div class=\"row align-items-center\">\n");
      out.write("                            <div class=\"col-xl-3 col-lg-3\">\n");
      out.write("                                <div class=\"logo\">\n");
      out.write("                                    <a href=\"index.html\">\n");
      out.write("                                        <img src=\"img/logo.png\" alt=\"\">\n");
      out.write("                                    </a>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-xl-9 col-lg-9\">\n");
      out.write("                                <div class=\"main-menu  d-none d-lg-block\">\n");
      out.write("                                    <nav>\n");
      out.write("                                        <ul id=\"navigation\">\n");
      out.write("                                            <li><a  href=\"index.html\">Inicio</a></li>\n");
      out.write("                                            <li><a href=\"about.html\">Acerca de</a></li>\n");
      out.write("                                            <li><a href=\"service.html\">Servicios</a></li>\n");
      out.write("                                            <li><a href=\"contact.html\">Contáctenos</a></li>\n");
      out.write("                                            <li><a href=\"login.html\">Ingresar</a></li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </nav>\n");
      out.write("                                </div>  \n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-12\">\n");
      out.write("                                <div class=\"mobile_menu d-block d-lg-none\"></div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("        <!-- Fin Area Cabecera -->\n");
      out.write("        <a href=\"login.jsp\">Ingresar </a><br>\n");
      out.write("        <h1>Registrar Usuario</h1>\n");
      out.write("        <form method=\"post\" action=\"Usuario\">\n");
      out.write("\n");
      out.write("            <table border=\"2\">\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <th>\n");
      out.write("                        Tipo de Documento<br><br>\n");
      out.write("\n");
      out.write("                        <select  id=\"tipoDocumento\" name=\"textFkTipoDocu\" required>\n");
      out.write("                            ");
for (int i = 0; i < arrayTipoDoc.size(); i++) {
                                    documentoVO = arrayTipoDoc.get(i);
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(documentoVO.getIdTipoDocu());
      out.write("\"> ");
      out.print(documentoVO.getTipoDocu());
      out.write("</option>\n");
      out.write("\n");
      out.write("                            ");
}
      out.write("        \n");
      out.write("                        </select><br><br>\n");
      out.write("                        Numero<br>\n");
      out.write("                        <input type=\"text\" name=\"textCedula\"><br><br>\n");
      out.write("                        Nombre:<br>\n");
      out.write("                        <input type=\"text\" name=\"textNombreUsuario\"><br><br>\n");
      out.write("                        Apellido:<br>\n");
      out.write("                        <input type=\"text\" name=\"textApellidoUsuario\"><br><br>\n");
      out.write("                        Contraseña:<br>\n");
      out.write("                        <input type=\"password\" name=\"textContrasena\"><br><br>\n");
      out.write("                        Confirme su Contraseña:<br>\n");
      out.write("                        <input type=\"password\" name=\"textContrasena\"><br><br>\n");
      out.write("                        Correo:<br>\n");
      out.write("                        <input type=\"email\" name=\"textCorreoUsuario\"><br><br>\n");
      out.write("\n");
      out.write("                        <br><br>\n");
      out.write("\n");
      out.write("                    </th>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("            </table><br>\n");
      out.write("\n");
      out.write("            <button>Registrarse</button>\n");
      out.write("            <input type=\"hidden\" name=\"opcion\" value=\"1\">\n");
      out.write("\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        ");
 if (request.getAttribute(
                    "mensajeError") != null) {  
      out.write(" \n");
      out.write("        ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${mensajeError}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("        ");
 } else { 
      out.write("\n");
      out.write("        ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${mensajeExito}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("        ");
 }
      out.write("\n");
      out.write("        <br><br>\n");
      out.write("\n");
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
