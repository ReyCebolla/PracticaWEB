<%-- 
    Document   : estadistiques
    Created on : 22 oct 2026, 14:17:22
    Author     : arnau
--%>

<%@page import="com.mycompany.pwp1martindragoa.model.EstadisticaTO"%>
<%@page import="com.mycompany.pwp1martindragoa.model.RespostaTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estadístiques</title>
    </head>
    <body>
        <h1>Estadístiques</h1>
        <%
            List<EstadisticaTO> estadistiques = (List<EstadisticaTO>) request.getAttribute("llistaEstadistiques");
            if(estadistiques != null){
                int totalMagatzems = 0;
                int totalEmmagatzemat = 0;
                int totalCapacitatLliure = 0;
                for(EstadisticaTO est : estadistiques){
                    totalMagatzems++;
                    int kgLliures = est.getCapacitat() - est.getKgOcupats();
                    totalEmmagatzemat += est.getKgOcupats();
                    totalCapacitatLliure += kgLliures;
        %>
        <p>
            <b>Magatzem:</b><%= est.getNomMagatzem()  %>
            <b>Conservacio:</b><%= est.getConservacio()  %>
            <b>Capacitat:</b><%= est.getCapacitat()  %>
            
            <%
                if(est.getKgOcupats() == 0){
            %>
            -- Actualment no té lots --
            <%
                }else if(kgLliures == 0){
            %>
            -- MAGATZEM PLE --
            <%
                }else{
            %>
            <b>Ocupats:</b> <%= est.getKgOcupats() %> kg
            <b>Lliures:</b> <%= kgLliures %> kg
            <%
                }
            %>
        </p>
        <%
                }
        %>
        <br>
        <h3>Total magatzems: <%= totalMagatzems %> Total emmagatzemat: <%= totalEmmagatzemat %> kg Capacitat lliure: <%= totalCapacitatLliure %> kg</h3>
        <%
            }
        %>
    </body>
</html>
