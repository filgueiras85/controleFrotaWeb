/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Controller.VeiculoController;
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
public class ServletAlteracaoDadosVeiculo extends HttpServlet {

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
            out.println("<title>Servlet ServletAlteracaoDadosVeiculo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletAlteracaoDadosVeiculo at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        HttpSession sessao = request.getSession();
        String usuario = (String) sessao.getAttribute("jUsuario");
        if (usuario == null) {
            out.print("Nenhum usuário autenticado!<br/>");
            out.print("<a href='../login.jsp'>Voltar para login</a>");
        } else {
            response.sendRedirect("alteracaodadosveiculo.jsp");
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
        request.setCharacterEncoding("UTF-8");
        String tipoVeiculo = request.getParameter("tipoVeiculo");
        String placa = request.getParameter("placa");
        String chassi = request.getParameter("chassi");
        int anoFabricacao = Integer.parseInt(request.getParameter("anoFabricacao"));
        int anoModelo = Integer.parseInt(request.getParameter("anoModelo"));
        int capacidadePessoas = Integer.parseInt(request.getParameter("capacidadePessoas"));
        double cilindradas = Double.parseDouble(request.getParameter("cilindradas").replace(",", "."));
        double capacidadeCarga = Double.parseDouble(request.getParameter("capacidadeCarga").replace(",", "."));
        String fabricante = request.getParameter("fabricante");
        String modelo = request.getParameter("modelo");
        String cor = request.getParameter("cor");
        String renavam = request.getParameter("renavam");
        String combustivel = request.getParameter("combustivel");
        int portas  = Integer.parseInt(request.getParameter("portas"));
        double odometroAtual = Double.parseDouble(request.getParameter("odometroAtual").replace(",", "."));
        String bloqueadoStr = request.getParameter("bloqueado");
        char bloqueado = 'n';
        if (bloqueadoStr.equals("Sim")) bloqueado = 's';
        String observacao = request.getParameter("observacao");
        String dataAquisicaoDD = request.getParameter("dataAquisicaoDD");
        String dataAquisicaoMM = request.getParameter("dataAquisicaoMM");
        String dataAquisicaoAAAA = request.getParameter("dataAquisicaoAAAA");
        String dataAquisicao = dataAquisicaoDD + "/" + dataAquisicaoMM + "/" + dataAquisicaoAAAA;

        try {
            VeiculoController veiculoController = new VeiculoController();
            String resultado = veiculoController.atualizaVeiculo(tipoVeiculo, 
                    placa, 
                    chassi, 
                    anoFabricacao, 
                    anoModelo, 
                    dataAquisicao, 
                    capacidadePessoas, 
                    cilindradas, 
                    capacidadeCarga, 
                    fabricante, 
                    modelo, 
                    cor, 
                    renavam, 
                    combustivel, 
                    portas, 
                    odometroAtual, 
                    bloqueado, 
                    observacao);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + resultado + "');");
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
