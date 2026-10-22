<%-- 
    Document   : fitxa_magatem
    Created on : 22 oct 2026, 0:13:12
    Author     : arnau
--%>

<%@page import="com.mycompany.pwp1martindragoa.model.Magatzem"%>
<%@page import="com.mycompany.pwp1martindragoa.model.Lot"%>
<%@page import="com.mycompany.pwp1martindragoa.model.RespostaTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fitxa Magatzem</title>
    </head>
    <body>
        <h1>Fitxa Magatzem</h1>
        <%
            List<Magatzem> magatzems = (List<Magatzem>) request.getAttribute("magatzems");
            if(magatzems != null){
                if(magatzems.isEmpty()){
        %>
        <p>No hi ha cap magatzem registrat.</p>
        <%
                }else{
        %>
        <form action="FitxaMagatzem" method="POST">
            <p>Escull el magatzem per veure la seva informació: 
                <select name="magatzem" required>
                    <%
                        for(Magatzem magatzem : magatzems){
                    %>
                    <option value="<%= magatzem.getNom() %>"><%= magatzem.getNom()%></option>
                    <%
                        }
                    %>
                </select>
            </p>
            <input type="hidden" name="accio" value="veure">
            <input type="submit" value="Veure Fitxa">
        </form>
        <%
                }
            }else{
                RespostaTO resposta = (RespostaTO) request.getAttribute("resposta");
                if(resposta != null){
                    if(resposta.getStatus().equalsIgnoreCase("OK")){
        %>
        <p <%= resposta.getMessage() %></p>
        <%
                    }else{
        %>
        <p style="color:red"> <%= resposta.getMessage() %></p>
        <%
                    }
                }
            }

            Magatzem magatzemSeleccionat = (Magatzem) request.getAttribute("magatzemSeleccionat");
            List<Lot> lots = (List<Lot>) request.getAttribute("lots");
            if(magatzemSeleccionat != null && lots != null){
        %>
        <h2>Fitxa Magatzem</h2>
        <p>Nom del magatzem: <%= magatzemSeleccionat.getNom() %></p>
        <p>Tipus de conservacio <%= magatzemSeleccionat.getConservacio() %></p>
        <br>
        <%
            if(lots.isEmpty()){
        %>
        <p>===> No hi ha lots registrats <===</p>
        <br>
        <p>Capacitat disponible: <%= magatzemSeleccionat.getCapacitat() %></p>
        <%
            }else{
                int kgOcupats = 0;
        %>
        <p>=== LOTS DEL MAGATZEM ===</p>
        <table>
        <%
                for(Lot lot: lots){
                    kgOcupats += lot.getKg();
        %>
        <tr>
            <td>ID: <%= lot.getIdlot() %></td>
            <td>Producte: <%= lot.getProducte() %></td>
            <td>Kg: <%= lot.getKg() %></td>
            <td>Any: <%= lot.getAny_recollida() %></td>
            <td>Estat: <%= lot.getEstat() %></td>
            <%
                    if(lot.isUrgent()){
            %>
            <td>Urgent: Si</td>
            <%
                }else{
            %>
            <td>Urgent: No</td>
            <%
                }
            %>
        </tr>
        <%
            }
            int kgLliures = magatzemSeleccionat.getCapacitat() - kgOcupats;
        %>
        </table>
        <br>
        <p>===> Capacitat Màxima: <%= magatzemSeleccionat.getCapacitat()%> Ocupats: <%= kgOcupats %> Lliures: <%= kgLliures%></p>
        <%
                }
            }
        
        %>
    </body>
</html>
