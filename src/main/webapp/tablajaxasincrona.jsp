<%-- 
    Document   : tablajaxasincrona
    Created on : 19-sep-2014, 10:18:09
    Author     : rafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/main.css" media="screen" />
    </head>
    <body>
        <h1>Tabla de multiplicaciones en cliente con AJAX</h1>
        <div id="tablacliente"></div>
        <script type="text/javascript">
            $(document).ready(function () {
                var tabla = "<table>";
                for (var i = 1; i <= 10; i++) {
                    tabla += "<tr>"
                    for (var j = 1; j <= 10; j++) {
                        tabla += "<td>";
                        tabla += "<div id=\"" + i + "x" + j + "\"></div>";
                        tabla += "</td>\n";
                    }
                    tabla += "</tr>";
                }
                tabla += "</table>";
                document.getElementById('tablacliente').innerHTML = tabla;
                //aqui ya tengo la tabla
                //ahora voy a rellenarla
                for (i = 1; i <= 10; i++) {
                    for (j = 1; j <= 10; j++) {
                        (function (i, j) {
                            $.ajax({
                                url: "<%=request.getContextPath()%>/calculadorajaxretardo?operacion=multiplicacion&op1=" + i + "&op2=" + j,
                                type: "GET",
                                dataType: "json",                             
                                success: function (source) {
                                    document.getElementById(i + 'x' + j).innerHTML = source.resultado;
                                }
                            });
                        })(i, j);
                    }
                }
            });
        </script>
    </body>
</html>
