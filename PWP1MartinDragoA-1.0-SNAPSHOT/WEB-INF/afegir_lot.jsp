<%-- 
    Document   : afegir_lot
    Created on : 20 oct 2026, 16:51:34
    Author     : arnau
--%>
<%@page import="com.mycompany.pwp1martindragoa.model.Magatzem"%>
<%@page import="com.mycompany.pwp1martindragoa.model.RespostaTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Afegir Lot</title>
    </head>
    <body>
        <h1>Afegir Lot</h1>
        <%
            List<Magatzem> magatzems = (List<Magatzem>) request.getAttribute("magatzems");
            if(magatzems != null){
                if(magatzems.isEmpty()){
        %>
        <p>No hi ha magatzems disponibles</p>
        <%
                } else { 
        %>
        <form action="AltaLot" method="POST">
            <p>Producte: <input name="producte" type="text" maxlength="40" required></p>
            <p>Conservació: <select id="conservacio" name="conservacio">
                                    <option value="FRESC">FRESC</option>
                                    <option value="SEC">SEC</option></select></p>
            <p>Pes del lot en kg: <input name="pes" type="number" min="1"></p>
            <p>Any de recollida: <input name="any" type="number" min="1987"</p>
            <p>És urgent? <input type="checkbox" name="urgent"</p>
            <p>Magatzem: <select name="magatzem" required>
            <% 
                for (Magatzem magatzem : magatzems) {
            %>
            <option value="<%=magatzem.getNom()%>"><%=magatzem.getNom()%></option>
            <%
                }
            %>              
            </select>
            </p>
            <input type="submit" value="Afegir Lot">
        </form>
        <%
            }
        }else{
            RespostaTO resposta = (RespostaTO) request.getAttribute("resposta");
            if(resposta != null){
                if(resposta.getStatus().equalsIgnoreCase("OK")){
        %>
        <p><%=resposta.getMessage() %></p>
        <%
                }else{
        %>
        <p style="color:red"> <%=resposta.getMessage()%> </p>
        <%
                }
            }
        }
        %>
    </body>
</html>
