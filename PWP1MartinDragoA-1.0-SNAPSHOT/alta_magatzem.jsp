<%-- 
    Document   : alta_magatzem
    Created on : 5 oct 2026, 19:26:55
    Author     : arnau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Afegir Magatzem</title>
    </head>
    <body>
        <h1>Afegir Magatzem</h1>
        <form action="AfegirMagatzem" method="POST">
            <p>Nom: <input name="nom" type="text" maxlength="100" required></p>
            <p>Conservació: <select id="conservacio" name="conservacio"></p>
                                    <option value="FRESC">FRESC</option>
                                    <option value="SEC">SEC</option></select></p>
            <p>Capacitat en kg: <input name="capacitat" type="number" min="1" required></p></p>

            <input type="submit" value="Afegir Magatzem">
        </form>
        <%
            String missatge = (String) request.getAttribute("missatge");
            if (missatge != null){      //<% --> para escribir java
                                        //<%= --> solo para escribir una variable
            %>
            <p><%= missatge %></p>   
            <%
                }
            %>
    </body>
</html>
