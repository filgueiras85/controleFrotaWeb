<%-- 
    Document   : alteracaodadosusuario
    Created on : Feb 1, 2017, 11:55:36 PM
    Author     : ssdorneles
--%>

<%@page import="Model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Funcao"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.FuncaoController" %>
<%@page language="java" import="java.util.*" %>
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
        <div style="background-color:#eeeeee; background-position:initial initial; background-repeat:initial initial; border:1px solid #cccccc; padding:5px 10px; text-align:center">Altere os dados do usu&aacute;rio</div>


        <% Usuario usuario = (Usuario) request.getAttribute("usuario");
            Calendar cal = Calendar.getInstance();
            cal.setTime(usuario.getDataNascimento());
            int dia = cal.get(Calendar.DAY_OF_MONTH);
            int mes = cal.get(Calendar.MONTH);
            int ano = cal.get(Calendar.YEAR);
            String dataCorrigida = ano + "-" + mes + "-" + dia;
        %>
        <br>

        <form action="alteracaodadosusuario" method="post">
            <table align="center">
                <tbody>
                    <tr>
                        <td>Nome</td>
                        <td>Sobrenome</td>
                    </tr>
                    <tr>
                        <td><input maxlength="100" name="nome" required="required" size="20" type="text" value="<%=usuario.getNome()%>"/></td>
                        <td><input maxlength="200" name="sobrenome" required="required" size="40" type="text" value="<%=usuario.getSobrenome()%>"/></td>
                    </tr>
                </tbody>
            </table>

            <br>

            <table align="center">
                <tbody>
                    <tr>
                        <td>Nome de Usuário (não pode ser alterado)</td>
                    </tr>
                    <tr>
                        <td><input maxlength="100" name="username" required="required" size="62" type="text" value="<%=usuario.getUsuario()%>" readonly/></td>
                    </tr>
                </tbody>
            </table>

            <br>

            <table align="center">
                <tbody>
                    <tr>
                        <td>Crie uma senha</td>
                    </tr>
                    <tr>
                        <td><input maxlength="100" name="senha" required="required" size="62" type="password" oninput="document.getElementById('confirmasenha').pattern = this.value.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, '\\$&')"></td>
                    </tr>
                </tbody>
            </table>

            <br>

            <table align="center">
                <tbody>
                    <tr>
                        <td>Confirme a senha</td>
                    </tr>
                    <tr>
                        <td><input maxlength="100" size="62" type="password" id="confirmasenha" name="confirmasenha" pattern="" title="Senhas devem ser iguais"></td>
                        </td>
                    </tr>
                </tbody>
            </table>

            <br>

            <table align="center" style="border-spacing: 35px 2px">
                <tbody>
                    <tr>
                        <td>Data de Nascimento</td>
                        <td>Telefone</td>
                    </tr>
                    <tr>
                        <td><input maxlength="10" name="datanascimento" required="required" size="20" type="date"/></td>
                        <td><input maxlength="200" name="telefone" size="34" type="tel" value="<%=usuario.getTelefone()%>"/></td>
                    </tr>
                </tbody>
            </table>

            <br>


            <%
                FuncaoController funcaoController = new FuncaoController();
                List funcoes = funcaoController.listaTodasFuncoes();
                ArrayList funcoesArray = new ArrayList();
                for (Object o : funcoes) {
                    Funcao f = (Funcao) o;
                    funcoesArray.add(f.getTxtFuncao());
                }

                pageContext.setAttribute("funcoesArray", funcoesArray);
            %>


            <table align="center" style="border-spacing: 35px 2px">
                <tbody>
                    <tr>
                        <td>Fun&ccedil;&atilde;o</td>
                        <td>email</td>
                    </tr>
                    <tr>

                        <td><select id="dropdown" name="funcao"> 
                                <c:forEach items="${funcoesArray}" var="current">
                                    <option><c:out value="${current}"/></option>
                                </c:forEach>
                            </select></td>
                        <td><input maxlength="200" name="email" size="43" type="email" value="<%=usuario.getEmail()%>"/></td>
                    </tr>
                </tbody>
            </table>

            <br>

            <table align="center">
                <tbody>
                    <tr>
                        <td>Observa&ccedil;&atilde;o</td>
                    </tr>
                    <tr>
                        <td><textarea cols="62" rows="10" name="observacao" ><%=usuario.getObservacao()%></textarea></td>
                    </tr>
                </tbody>
            </table>

            <br>



            <p style="text-align:center"><input type="submit" value="Salvar alterações" /></p>
        </form>
    </body>
</html>
