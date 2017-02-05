<%-- 
    Document   : listagemveiculo
    Created on : Feb 5, 2017, 3:39:30 PM
    Author     : ssdorneles
--%>

<%@page import="Controller.CombustivelController"%>
<%@page import="Controller.TipoVeiculoController"%>
<%@page import="Controller.VeiculoController"%>
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
                <div style="background-color:#eeeeee; background-position:initial initial; background-repeat:initial initial; border:1px solid #cccccc; padding:5px 10px; text-align:center"><c:out value="Exibindo todos veículos" /></div>
            </c:when>
            <c:when test="${'Ativos' == tipoRel}">
                <div style="background-color:#eeeeee; background-position:initial initial; background-repeat:initial initial; border:1px solid #cccccc; padding:5px 10px; text-align:center"><c:out value="Exibindo veículos ativos" /></div>
            </c:when>
            <c:when test="${'Inativos' == tipoRel}">
                <div style="background-color:#eeeeee; background-position:initial initial; background-repeat:initial initial; border:1px solid #cccccc; padding:5px 10px; text-align:center"><c:out value="Exibindo veículos inativos" /></div>
            </c:when>
            <c:otherwise>
                <div style="background-color:#eeeeee; background-position:initial initial; background-repeat:initial initial; border:1px solid #cccccc; padding:5px 10px; text-align:center"><c:out value="Relatório inválido" /></div>
            </c:otherwise>
        </c:choose>


        <br>



        <table align="center" style="border-spacing: 35px 2px">
            <tr>
                <th>Placa</th>
                <th>Fabricante</th>
                <th>Modelo</th>
                <th>Cor</th>
                <th>Tipo</th> 
                <th>Ano de Fabricação</th>
                <th>Ano de Modelo</th>
                <th>Data de Aquisição</th>
                <th>Data de Exclusão</th>
                <th>Número de Passageiros</th>
                <th>Cilindradas</th>
                <th>Capacidade de Carga</th>
                <th>Chassi</th>
                <th>Renavam</th>
                <th>Combustível</th>
                <th>Portas</th>
                <th>Odômetro Atual</th>
                <th>Bloqueado</th>
                <th>Observação</th>
            </tr>
            <c:choose>
                <c:when test="${empty tipoRel}">

                </c:when>
                <c:when test="${'Todos' == tipoRel}">
                    <%
                        List veiculos = new VeiculoController().listaTodosVeiculos();
                        pageContext.setAttribute("veiculos", veiculos);
                    %>
                    <c:forEach items="${veiculos}" var="item">
                        <c:set var="idTipo" value="${item.getIdTipoVeiculo()}"/>
                        <c:set var="idCombustivel" value="${item.getIdCombustivel()}"/>
                        <%
                            String strIdTipo = pageContext.getAttribute("idTipo").toString();
                            String strIdCombustivel = pageContext.getAttribute("idCombustivel").toString();
                            int nrTipo = Integer.parseInt(strIdTipo);
                            int nrCombustivel = Integer.parseInt(strIdCombustivel);
                            String strTipo = new TipoVeiculoController().listaTipoVeiculoTxt(nrTipo);
                            String strCombustivel = new CombustivelController().listaCombustivelTxt(nrCombustivel);
                            pageContext.setAttribute("strTipo", strTipo);
                            pageContext.setAttribute("strCombustivel", strCombustivel);
                        %>
                        <tr>
                            <td align="center"><c:out value="${item.getPlaca()}" /></td>
                            <td align="center"><c:out value="${item.getFabricante()}" /></td>
                            <td align="center"><c:out value="${item.getModelo()}" /></td>
                            <td align="center"><c:out value="${item.getCor()}" /></td>
                            <td align="center"><c:out value="${strTipo}" /></td>
                            <td align="center"><c:out value="${item.getAnoFabricacao()}" /></td>
                            <td align="center"><c:out value="${item.getAnoModelo()}" /></td>
                            <td align="center"><c:out value="${item.getDataAquisicao()}" /></td>
                            <td align="center"><c:out value="${item.getDataExclusao()}" /></td>
                            <td align="center"><c:out value="${item.getCapacidadePessoas()}" /></td>
                            <td align="center"><c:out value="${item.getCilindradas()}" /></td>
                            <td align="center"><c:out value="${item.getCapacidadeCarga()}" /></td>
                            <td align="center"><c:out value="${item.getChassi()}" /></td>
                            <td align="center"><c:out value="${item.getRenavam()}" /></td>
                            <td align="center"><c:out value="${strCombustivel}" /></td>
                            <td align="center"><c:out value="${item.getPortas()}" /></td>
                            <td align="center"><c:out value="${item.getOdometroAtual()}" /></td>
                            <td align="center"><c:out value="${item.getBloqueado()}" /></td>
                            <td align="center"><c:out value="${item.getObservacao()}" /></td>
                        </tr>
                    </c:forEach>

                </c:when>
                <c:when test="${'Ativos' == tipoRel}">
                    <%
                        List veiculos2 = new VeiculoController().listaTodosVeiculosAtivos();
                        pageContext.setAttribute("veiculos2", veiculos2);
                    %>
                    <c:forEach items="${veiculos2}" var="item">
                        <c:set var="idTipo" value="${item.getIdTipoVeiculo()}"/>
                        <c:set var="idCombustivel" value="${item.getIdCombustivel()}"/>
                        <%
                            String strIdTipo2 = pageContext.getAttribute("idTipo").toString();
                            String strIdCombustivel2 = pageContext.getAttribute("idCombustivel").toString();
                            int nrTipo2 = Integer.parseInt(strIdTipo2);
                            int nrCombustivel2 = Integer.parseInt(strIdCombustivel2);
                            String strTipo2 = new TipoVeiculoController().listaTipoVeiculoTxt(nrTipo2);
                            String strCombustivel2 = new CombustivelController().listaCombustivelTxt(nrCombustivel2);
                            pageContext.setAttribute("strTipo2", strTipo2);
                            pageContext.setAttribute("strCombustivel2", strCombustivel2);
                        %>
                        <tr>
                            <td align="center"><c:out value="${item.getPlaca()}" /></td>
                            <td align="center"><c:out value="${item.getFabricante()}" /></td>
                            <td align="center"><c:out value="${item.getModelo()}" /></td>
                            <td align="center"><c:out value="${item.getCor()}" /></td>
                            <td align="center"><c:out value="${strTipo2}" /></td>
                            <td align="center"><c:out value="${item.getAnoFabricacao()}" /></td>
                            <td align="center"><c:out value="${item.getAnoModelo()}" /></td>
                            <td align="center"><c:out value="${item.getDataAquisicao()}" /></td>
                            <td align="center"><c:out value="${item.getDataExclusao()}" /></td>
                            <td align="center"><c:out value="${item.getCapacidadePessoas()}" /></td>
                            <td align="center"><c:out value="${item.getCilindradas()}" /></td>
                            <td align="center"><c:out value="${item.getCapacidadeCarga()}" /></td>
                            <td align="center"><c:out value="${item.getChassi()}" /></td>
                            <td align="center"><c:out value="${item.getRenavam()}" /></td>
                            <td align="center"><c:out value="${strCombustivel2}" /></td>
                            <td align="center"><c:out value="${item.getPortas()}" /></td>
                            <td align="center"><c:out value="${item.getOdometroAtual()}" /></td>
                            <td align="center"><c:out value="${item.getBloqueado()}" /></td>
                            <td align="center"><c:out value="${item.getObservacao()}" /></td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:when test="${'Inativos' == tipoRel}">
                    <%
                        List veiculos3 = new VeiculoController().listaTodosVeiculosInativos();
                        pageContext.setAttribute("veiculos3", veiculos3);
                    %>
                    <c:forEach items="${veiculos3}" var="item">
                        <c:set var="idTipo" value="${item.getIdTipoVeiculo()}"/>
                        <c:set var="idCombustivel" value="${item.getIdCombustivel()}"/>
                        <%
                            String strIdTipo3 = pageContext.getAttribute("idTipo").toString();
                            String strIdCombustivel3 = pageContext.getAttribute("idCombustivel").toString();
                            int nrTipo3 = Integer.parseInt(strIdTipo3);
                            int nrCombustivel3 = Integer.parseInt(strIdCombustivel3);
                            String strTipo3 = new TipoVeiculoController().listaTipoVeiculoTxt(nrTipo3);
                            String strCombustivel3 = new CombustivelController().listaCombustivelTxt(nrCombustivel3);
                            pageContext.setAttribute("strTipo3", strTipo3);
                            pageContext.setAttribute("strCombustivel3", strCombustivel3);
                        %>
                        <tr>
                            <td align="center"><c:out value="${item.getPlaca()}" /></td>
                            <td align="center"><c:out value="${item.getFabricante()}" /></td>
                            <td align="center"><c:out value="${item.getModelo()}" /></td>
                            <td align="center"><c:out value="${item.getCor()}" /></td>
                            <td align="center"><c:out value="${strTipo3}" /></td>
                            <td align="center"><c:out value="${item.getAnoFabricacao()}" /></td>
                            <td align="center"><c:out value="${item.getAnoModelo()}" /></td>
                            <td align="center"><c:out value="${item.getDataAquisicao()}" /></td>
                            <td align="center"><c:out value="${item.getDataExclusao()}" /></td>
                            <td align="center"><c:out value="${item.getCapacidadePessoas()}" /></td>
                            <td align="center"><c:out value="${item.getCilindradas()}" /></td>
                            <td align="center"><c:out value="${item.getCapacidadeCarga()}" /></td>
                            <td align="center"><c:out value="${item.getChassi()}" /></td>
                            <td align="center"><c:out value="${item.getRenavam()}" /></td>
                            <td align="center"><c:out value="${strCombustivel3}" /></td>
                            <td align="center"><c:out value="${item.getPortas()}" /></td>
                            <td align="center"><c:out value="${item.getOdometroAtual()}" /></td>
                            <td align="center"><c:out value="${item.getBloqueado()}" /></td>
                            <td align="center"><c:out value="${item.getObservacao()}" /></td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>

                </c:otherwise>
            </c:choose>

        </table>

    </body>
</html>
