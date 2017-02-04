<%-- 
    Document   : listagemusuarios
    Created on : Feb 4, 2017, 11:46:46 AM
    Author     : ssdorneles
--%>

<%@page import="Controller.FuncaoController"%>
<%@page import="Controller.UsuarioController"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                <li><a href="listagemusuario.jsp?tipoRelatorio=Todos">Listar todos funcionários</a></li>
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

        <% String tipoRel = request.getParameter("tipoRelatorio");
            pageContext.setAttribute("tipoRel", tipoRel);
        %>

        <c:choose>
            <c:when test="${empty tipoRel}">
                <div style="background-color:#eeeeee; background-position:initial initial; background-repeat:initial initial; border:1px solid #cccccc; padding:5px 10px; text-align:center"><c:out value="Nenhum relatório selecionado" /></div>
            </c:when>
            <c:when test="${'Todos' == tipoRel}">
                <div style="background-color:#eeeeee; background-position:initial initial; background-repeat:initial initial; border:1px solid #cccccc; padding:5px 10px; text-align:center"><c:out value="Exibindo todos usuários" /></div>
            </c:when>
            <c:when test="${'Ativos' == tipoRel}">
                <div style="background-color:#eeeeee; background-position:initial initial; background-repeat:initial initial; border:1px solid #cccccc; padding:5px 10px; text-align:center"><c:out value="Exibindo usuários ativos" /></div>
            </c:when>
            <c:when test="${'Inativos' == tipoRel}">
                <div style="background-color:#eeeeee; background-position:initial initial; background-repeat:initial initial; border:1px solid #cccccc; padding:5px 10px; text-align:center"><c:out value="Exibindo usuários inativos" /></div>
            </c:when>
            <c:otherwise>
                <div style="background-color:#eeeeee; background-position:initial initial; background-repeat:initial initial; border:1px solid #cccccc; padding:5px 10px; text-align:center"><c:out value="Relatório inválido" /></div>
            </c:otherwise>
        </c:choose>


        <br>



        <table align="center" style="border-spacing: 35px 2px">
            <tr>
                <th>Nome</th>
                <th>Sobrenome</th> 
                <th>Função</th>
                <th>E-Mail</th>
                <th>Usuário</th>
                <th>Data de Nascimento</th>
                <th>Data do Cadastro</th>
                <th>Data da Exclusão</th>
                <th>Observação</th>
                <th>Telefone</th>
            </tr>
            <c:choose>
                <c:when test="${empty tipoRel}">

                </c:when>
                <c:when test="${'Todos' == tipoRel}">
                    <%
                        UsuarioController usuarioController = new UsuarioController();
                        List usuarios = usuarioController.listaTodosUsuarios();
                        pageContext.setAttribute("usuarios", usuarios);
                    %>
                    <c:forEach items="${usuarios}" var="item">
                        <c:set var="id" value="${item.getIdFuncao()}"/>
                        <%
                            String strIdFuncao = pageContext.getAttribute("id").toString();
                            int nrFuncao = Integer.parseInt(strIdFuncao);
                            FuncaoController funcaoController = new FuncaoController();
                            String strFuncao = funcaoController.listaFuncaoTxt(nrFuncao);
                            pageContext.setAttribute("strFuncao", strFuncao);
                        %>
                        <tr>
                            <td align="center"><c:out value="${item.getNome()}" /></td>
                            <td align="center"><c:out value="${item.getSobrenome()}" /></td>
                            <td align="center"><c:out value="${strFuncao}" /></td>
                            <td align="center"><c:out value="${item.getEmail()}" /></td>
                            <td align="center"><c:out value="${item.getUsuario()}" /></td>
                            <td align="center"><c:out value="${item.getDataNascimento()}" /></td>
                            <td align="center"><c:out value="${item.getDataAdmisssao()}" /></td>
                            <td align="center"><c:out value="${item.getDataDemissao()}" /></td>
                            <td align="center"><c:out value="${item.getObservacao()}" /></td>
                            <td align="center"><c:out value="${item.getTelefone()}" /></td>
                        </tr>
                    </c:forEach>

                </c:when>
                <c:when test="${'Ativos' == tipoRel}">

                </c:when>
                <c:when test="${'Inativos' == tipoRel}">

                </c:when>
                <c:otherwise>

                </c:otherwise>
            </c:choose>

        </table>

    </body>
</html>
