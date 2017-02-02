<%-- 
    Document   : login
    Created on : 31/01/2017, 09:20:57
    Author     : sergio.dorneles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de Frotas</title>
    </head>
    <body>
        <h1 style="text-align:center">Controle de Frotas</h1>

        <p style="text-align:center"><span style="color:#999999">versão 0.1 - desenvolvido por Sergio Dorneles</span></p>

        <p>&nbsp;</p>

        <h1 style="text-align:center">Módulo Gerencial</h1>

        <form action="login" method="post">
            <table align="center">
                <tbody>
                    <tr>
                        <td>
                            <p>Usuário:</p>
                        </td>
                        <td><input maxlength="20" name="usuario" required="required" size="20" type="text" /></td>
                    </tr>
                    <tr>
                        <td>
                            <p>Senha:</p>
                        </td>
                        <td><input maxlength="20" name="senha" required="required" size="20" type="password"/></td>
                    </tr>
                </tbody>
            </table>

            <p style="text-align:center"><input type="submit" value="Validar"/></p>

            <p>&nbsp;</p>
        </form>

        <p>&nbsp;</p>
    </body>
</html>
