<%-- 
    Document   : gestionar_lots
    Created on : 21 oct 2026, 19:17:16
    Author     : arnau
--%>

<%@page import="com.mycompany.pwp1martindragoa.model.Lot"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.pwp1martindragoa.model.RespostaTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Lots</title>
    </head>
    <body>
        <h1>Gestionar Lots</h1>
        <%
            List<String> magatzems = (List<String>) request.getAttribute("magatzems");
            if(magatzems != null){
                if(magatzems.isEmpty()){
        %>
        <p>No hi ha cap magatzem amb lots registrats actualment.</p>
        <%
                }else{
        %>
        <form action="GestioLots" method="POST">
            <p>Escull el magatzem per veure'n els lots: 
                <select name="magatzem" required>
                    <%
                        for(String nomMagatzem : magatzems){
                    %>
                    <option value="<%= nomMagatzem %>"><%= nomMagatzem %></option>
                    <%
                        }
                    
                    %>
                </select>
            </p>
            <input type="hidden" name="accio" value="veure">
            <input type="submit" value="Veure Lots">
        </form>
        <%
                }
            }
            RespostaTO resposta =(RespostaTO) request.getAttribute("resposta");
            if(resposta != null){
                if(resposta.getStatus().equalsIgnoreCase("OK")){
        %>
        <p><%=resposta.getMessage()%></p>
        <%
                }else{
        %>
        <p style="color: red"> <%=resposta.getMessage()%></p>
        <%
                }
            }
            List<Lot> lots = (List<Lot>) request.getAttribute("lots");
            String magatzemSeleccionat = (String) request.getAttribute("magatzemSeleccionat");
            if(lots != null){
        %>
        <h2>Lots del magatzem: <%=magatzemSeleccionat%></h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Producte</th>
                <th>Kg</th>
                <th>Any</th>
                <th>Estat</th>
                <th>Urgent</th>
                <th>Acció</th>
            </tr>
            <%
                for(Lot lot : lots){
            %>
            <tr>
                <td><%= lot.getIdlot() %></td>
                <td><%= lot.getProducte() %></td>
                <td><%= lot.getKg() %></td>
                <td><%= lot.getAny_recollida() %></td>
                <td><%= lot.getEstat() %></td>
                <%
                    if(lot.isUrgent()){
                %>
                <td>Si</td>
                <%
                    }else{
                %>
                <td>No</td>
                <%
                    }
                %>
                <td>
                    <form action="GestioLots" method="POST" style="margin:0;">
                        <input type="hidden" name="accio" value="retirar">
                        <input type="hidden" name="idLot" value="<%= lot.getIdlot() %>">
                        <input type="hidden" name="magatzem" value="<%= magatzemSeleccionat %>">
                        <input type="submit" value="Retirar">
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </table>
            <%
            }
        %>
        
        
    </body>
</html>
