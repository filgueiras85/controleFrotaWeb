<%-- 
    Document   : cadastroveiculo
    Created on : Feb 5, 2017, 8:52:57 AM
    Author     : ssdorneles
--%>

<%@page import="Model.Combustivel"%>
<%@page import="Controller.CombustivelController"%>
<%@page import="Model.TipoVeiculo"%>
<%@page import="Controller.TipoVeiculoController"%>
<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" type="text/css" href="util/view.css" media="all">
        <script type="text/javascript" src="util/view.js"></script>
        <script type="text/javascript" src="util/calendar.js"></script>
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
        <div style="background-color:#eeeeee; background-position:initial initial; background-repeat:initial initial; border:1px solid #cccccc; padding:5px 10px; text-align:center">Cadastre um novo veículo</div>


        <br>

        <form id="form_10712" class="appnitro"  method="post" action="cadastroveiculo">
            <div class="form_description">
                <p>* Campos obrigatórios</p>
                <p>&nbsp;</p>
            </div>						
            <p>&nbsp;</p>
            <%
                TipoVeiculoController tipoVeiculoController = new TipoVeiculoController();
                List tiposVeiculos = tipoVeiculoController.listaTodosTiposVeiculo();
                ArrayList tiposArray = new ArrayList();
                for (Object o : tiposVeiculos) {
                    TipoVeiculo f = (TipoVeiculo) o;
                    tiposArray.add(f.getTxtTipo());
                }

                pageContext.setAttribute("tiposArray", tiposArray);
            %>

            <%
                CombustivelController combustivelController = new CombustivelController();
                List combustiveis = combustivelController.listaTodosCombustiveis();
                ArrayList combustiveisArray = new ArrayList();
                for (Object o : combustiveis) {
                    Combustivel f = (Combustivel) o;
                    combustiveisArray.add(f.getTxtCombustivel());
                }

                pageContext.setAttribute("combustiveisArray", combustiveisArray);
            %>
            <ul >
                <li id="li_15" >
                    <span>
                        <label class="description" for="element_15">Tipo de veículo* </label>
                        <select class="element select medium" id="element_15" name="tipoVeiculo" required="required"> 
                            <c:forEach items="${tiposArray}" var="current">
                                <option><c:out value="${current}"/></option>
                            </c:forEach>
                        </select>
                    </span>
                    <span>
                        <label class="description" for="element_1">Placa* </label>
                        <input id="element_1" name="placa" class="element text small" type="text" maxlength="255" value="" required="required"/> 
                    </span>
                    <span>
                        <label class="description" for="element_2">Chassi* </label>
                        <input id="element_2" name="chassi" class="element text medium" type="text" maxlength="255" value="" required="required"/> 
                    </span>
                    <span>
                        <label class="description" for="element_3">Renavam* </label>
                        <input id="element_3" name="renavam" class="element text medium" type="text" maxlength="255" value="" required="required"/> 

                    </span>
                </li>		
                <li id="li_4" >
                    <span style="width:45%;">
                        <label class="description" for="element_4">Fabricante* </label>
                        <input id="element_4" name="fabricante" class="element text medium" type="text" maxlength="255" value="" required="required"/> 
                    </span>
                    <span style="width:45%;">
                        <label class="description" for="element_5">Modelo* </label>
                        <input id="element_5" name="modelo" class="element text medium" type="text" maxlength="255" value="" required="required"/> 
                    </span>

                </li>		
                <li id="li_6" >
                    <span style="width:20%;">
                        <label class="description" for="element_6">Ano de fabricação* </label>
                        <input id="element_6" name="anoFabricacao" class="element text small" type="text" maxlength="255" value="" required="required"/> 
                    </span>

                    <span style="width:20%;">
                        <label class="description" for="element_7">Ano de modelo* </label>
                        <input id="element_7" name="anoModelo" class="element text small" type="text" maxlength="255" value="" required="required"/> 
                    </span>
                    <span style="width:30%;">
                        <label class="description" for="element_8">Data de aquisição* </label>
                        <span style="margin-right: 4px">
                            <input id="element_8_1" name="dataAquisicaoDD" class="element text" size="2" maxlength="2" value="" type="text" required="required"> /
                            <label for="element_8_1">DD</label>
                        </span>
                        <span style="margin-right: 4px">
                            <input id="element_8_2" name="dataAquisicaoMM" class="element text" size="2" maxlength="2" value="" type="text" required="required"> /
                            <label for="element_8_2">MM</label>
                        </span>
                        <span style="margin-right: 4px">
                            <input id="element_8_3" name="dataAquisicaoAAAA" class="element text" size="4" maxlength="4" value="" type="text" required="required">
                            <label for="element_8_3">AAAA</label>
                        </span>

                        <span id="calendar_8">
                            <img id="cal_img_8" class="datepicker" src="util/calendar.gif" alt="Selecione uma data.">	
                        </span>
                        <script type="text/javascript">
                            Calendar.setup({
                                inputField: "element_8_3",
                                baseField: "element_8",
                                displayArea: "calendar_8",
                                button: "cal_img_8",
                                ifFormat: "%B %e, %Y",
                                onSelect: selectEuropeDate
                            });
                        </script>
                    </span>
                </li>		<li id="li_16" >
                    <label class="description" for="element_16">Combustível* </label>
                    <div>
                        <select class="element select medium" id="element_16" name="combustivel" required="required"> 
                            <c:forEach items="${combustiveisArray}" var="current">
                                <option><c:out value="${current}"/></option>
                            </c:forEach>
                        </select>
                    </div> 
                </li>		<li id="li_9" >
                    <label class="description" for="element_9">Cilindradas* </label>
                    <div>
                        <input id="element_9" name="cilindradas" class="element text small" type="text" maxlength="255" value="" required="required"/> 
                    </div> 
                </li>		<li id="li_10" >
                    <label class="description" for="element_10">Número de passageiros* </label>
                    <div>
                        <input id="element_10" name="capacidadePessoas" class="element text small" type="text" maxlength="255" value="" required="required"/> 
                    </div> 
                </li>		<li id="li_11" >
                    <label class="description" for="element_11">Capacidade de carga (Kg)* </label>
                    <div>
                        <input id="element_11" name="capacidadeCarga" class="element text small" type="text" maxlength="255" value="" required="required"/> 
                    </div> 
                </li>		<li id="li_12" >
                    <label class="description" for="element_12">Cor* </label>
                    <div>
                        <input id="element_12" name="cor" class="element text medium" type="text" maxlength="255" value="" required="required"/> 
                    </div> 
                </li>		<li id="li_17" >
                    <label class="description" for="element_17">Portas* </label>
                    <div>
                        <select class="element select small" id="element_17" name="portas" required="required"> 
                            <option value="1" >1</option>
                            <option value="2" selected="selected">2</option>
                            <option value="3" >3</option>
                            <option value="4" >4</option>
                            <option value="5" >5</option>

                        </select>
                    </div> 
                </li>		<li id="li_13" >
                    <label class="description" for="element_13">Odômetro atual* </label>
                    <div>
                        <input id="element_13" name="odometroAtual" class="element text small" type="text" maxlength="255" value="" required="required"/> 
                    </div> 
                </li>		<li id="li_18" >
                    <label class="description" for="element_18">Impedido de sair por algum problema?* </label>
                    <div>
                        <select class="element select small" id="element_18" name="bloqueado" required="required"> 
                            <option>Sim</option>
                            <option selected="selected">Não</option>

                        </select>
                    </div> 
                </li>		<li id="li_14" >
                    <label class="description" for="element_14">Observação </label>
                    <div>
                        <textarea id="element_14" name="observacao" class="element textarea medium"></textarea> 
                    </div> 
                </li>
            </ul>
            <br>
            <center>
                <input id="saveForm" class="button_text" type="submit" name="submit" value="Cadastrar Veículo" />
            </center>
        </form>	
    </body>
</html>
