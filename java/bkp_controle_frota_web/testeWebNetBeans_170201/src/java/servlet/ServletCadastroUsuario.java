/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Controller.UsuarioController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ssdorneles
 */
public class ServletCadastroUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletCadastroUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletCadastroUsuario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        HttpSession sessao = request.getSession();
        String usuario = (String) sessao.getAttribute("jUsuario");
        if (usuario == null) {
            out.print("Nenhum usuário autenticado!<br/>");
            out.print("<a href='login.jsp'>Voltar para login</a>");
        } else {
            response.sendRedirect("admin/menu.jsp");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String nome, sobrenome, username, senha, datanascimento, telefone, email, funcao, observacao;
        nome = request.getParameter("nome");
        sobrenome = request.getParameter("sobrenome");
        username = request.getParameter("username");
        senha = request.getParameter("senha");
        datanascimento = request.getParameter("datanascimento");
        String dataNascimentoCorrigida = datanascimento.substring(8) + "/" + datanascimento.substring(5,7) + "/" + datanascimento.substring(0,4);
        telefone = request.getParameter("telefone");
        email = request.getParameter("email");
        funcao = request.getParameter("funcao");
        observacao = request.getParameter("observacao");

        try {
            UsuarioController usuarioController = new UsuarioController();
            String resultado = usuarioController.salvaUsuario(nome, sobrenome, funcao, telefone, email, username, senha, dataNascimentoCorrigida, observacao);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + resultado +"');");
            out.println("location='menu.jsp';");
            out.println("</script>");

        } catch (Exception e) {
            out.print(e.getMessage());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
