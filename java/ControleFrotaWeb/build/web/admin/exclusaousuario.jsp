<%-- 
    Document   : exclusaofuncionario
    Created on : Feb 4, 2017, 10:40:04 AM
    Author     : ssdorneles
--%>

<%@page import="Model.Usuario"%>
<%@page import="Controller.UsuarioController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Funcao"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.FuncaoController" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de Frotas</title>
        <link href="util/ddmenu/ddmenu.css" rel="stylesheet" type="text/css"/>
        <script src="util/ddmenu/ddmenu.js" type="text/javascript"></script>
    </head>
    <body>
        <h1 style="text-align:center">Controle de Frotas</h1>

        <p style="text-align:center"><span style="color:#999999">vers&atilde;o 0.1 - desenvolvido por Sergio Dorneles</span></p>

        <p>&nbsp;</p>

        <h1 style="text-align:center">M&oacute;dulo Gerencial</h1>

        <p>&nbsp;</p>

        <nav id="ddmenu">
            <ul>
                <li>
                    <a class="top-heading">Funcionário</a>
                    <i class="caret"></i>
                    <div class="dropdown">
                        <div class="dd-inner">
                            <ul class="column">
                                <li><a href="cadastrousuario">Cadastrar novo funcionário</a></li>
                                <li><a href="alteracaousuario">Alterar funcionário existente</a></li>
                                <li><a href="exclusaousuario">Excluir funcionário</a></li>
                            </ul>
                            <ul class="column">
                                <li><a href="#">Listar todos funcionários</a></li>
                                <li><a href="#">Listar funcionários ativos</a></li>
                                <li><a href="#">Listar funcionários excluídos</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li>
                    <a class="top-heading">Veículo</a>
                    <i class="caret"></i>
                    <div class="dropdown">
                        <div class="dd-inner">
                            <ul class="column">
                                <li><a href="#">Cadastrar novo veículo</a></li>
                                <li><a href="#">Alterar veículo existente</a></li>
                                <li><a href="#">Excluir veículo</a></li>
                            </ul>
                            <ul class="column">
                                <li><a href="#">Listar todos veículos</a></li>
                                <li><a href="#">Listar veículos ativos</a></li>
                                <li><a href="#">Listar veículos excluídos</a></li>
                                <li><a href="#">Listar veículos na rua</a></li>
                                <li><a href="#">Listar veículos em revisão</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li>
                    <a class="top-heading">Revisão</a>
                    <i class="caret"></i>
                    <div class="dropdown right-aligned">
                        <div class="dd-inner">
                            <ul class="column">
                                <li><a href="#">Cadastrar nova revisão</a></li>
                                <li><a href="#">Alterar revisão existente</a></li>
                                <li><a href="#">Cancelar revisão</a></li>
                            </ul>
                            <ul class="column">
                                <li><a href="#">Listar todas revisões</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li>
                    <a class="top-heading">Saída</a>
                    <i class="caret"></i>
                    <div class="dropdown right-aligned">
                        <div class="dd-inner">
                            <ul class="column">
                                <li><a href="#">Cadastrar nova saída</a></li>
                                <li><a href="#">Alterar saída existente</a></li>
                                <li><a href="#">Cancelar saída</a></li>
                            </ul>
                            <ul class="column">
                                <li><a href="#">Cadastrar nova entrada</a></li>
                                <li><a href="#">Alterar entrada existente</a></li>
                                <li><a href="#">Cancelar entrada</a></li>
                            </ul>
                            <ul class="column">
                                <li><a href="#">Listar todas saídas</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </nav>


        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <div style="background-color:#eeeeee; background-position:initial initial; background-repeat:initial initial; border:1px solid #cccccc; padding:5px 10px; text-align:center">Exclua um usu&aacute;rio</div>


        <%
            UsuarioController usuarioController = new UsuarioController();
            List usuarios = usuarioController.listaTodosUsuariosAtivos();
            ArrayList usernamesArray = new ArrayList();
            for (Object o : usuarios) {
                Usuario f = (Usuario) o;
                usernamesArray.add(f.getUsuario());
            }

            pageContext.setAttribute("usernamesArray", usernamesArray);
        %>

        <br>

        <form action="exclusaousuario" method="post">

            <table align="center" style="border-spacing: 35px 2px">
                <tbody>
                    <tr>
                        <td>Qual usuário deseja excluir?</td>
                        <td><select id="dropdownUsername" name="username">
                                <c:forEach items="${usernamesArray}" var="current">
                                    <option><c:out value="${current}"/></option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>

            



            <p style="text-align:center"><input type="submit" value="Excluir Usuário" /></p>
        </form>
    </body>
</html>

