<%-- 
    Document   : list
    Created on : 29-ene-2014, 12:26:53
    Author     : al037684
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.daw.helper.Conexion"%>
<%@page import="net.daw.dao.ComentarioDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%
    ComentarioDao oComentarioDao = new ComentarioDao(Conexion.getConection());
    ArrayList<String> alColumnsNames = (ArrayList<String>) oComentarioDao.getColumnsNames();
    Iterator<String> oIterador = alColumnsNames.listIterator();
    String strNombreMantenimiento = "comentario";
%>
<div id="<%=strNombreMantenimiento%>_list">
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-7">       
                <h2><%=strNombreMantenimiento%></h2>
                <div id="order"></div>
                <div id="filter"></div>            
                <div id="registers"></div>
                <div id="pagination"></div>
            </div>
            <div class="col-md-5">
                <div class="text-right">
                    <legend>Filtro</legend> 
                    <form class="navbar-form pull-right" action="Controller" method="post" id="empresaForm">
                        <fieldset>                                                                     
                            <span>
                                <select id="selectFilter" name="filter" width="80" style="width: 100px">
                                    <%
                                        while (oIterador.hasNext()) {
                                            String strNombreColumna = oIterador.next();
                                            String strNombreColumnaPretty = strNombreColumna.charAt(0) + strNombreColumna.substring(1);
                                    %>
                                    <option value="<%=strNombreColumna%>"><%=strNombreColumnaPretty%></option>
                                    <% }%>
                                </select>
                            </span>
                            <span>
                                <select id="selectFilteroperator" name="filteroperator" width="80" style="width: 100px">
                                    <option>like</option>
                                    <option>notlike</option>
                                    <option>equals</option>
                                    <option>notequalto</option>
                                    <option>less</option>
                                    <option>lessorequal</option>
                                    <option>greater</option>
                                    <option>greaterorequal</option> 
                                </select>
                                <input id="inputFiltervalue" name="filtervalue" type="text" size="20" maxlength="50" value=""  width="100" style="width: 90px"/>
                            </span>
                            <span>
                                <input type="submit" class="btn" id="btnFiltrar" name="btnFiltrar" value="Filtrar <%=strNombreMantenimiento%>" />
                            </span>
                        </fieldset>
                    </form>
                </div>
                <div class="text-right">
                    <legend>Registros por página</legend> 
                    <form class="navbar-form pull-right" action="Controller" method="post" id="nrrpForm" >
                        <fieldset>                                               
                            <span>
                                <select  id="rpp" name="nrpp" value="select" style="width: 80px">                        
                                    <option>5</option>
                                    <option selected>10</option>
                                    <option>20</option>
                                    <option>50</option>
                                    <option>100</option>
                                </select>  
                            </span>                   
                        </fieldset>
                    </form>                
                </div> 
                <button class="btn" id="crear">Crear <%=strNombreMantenimiento%></button>
            </div>
        </div>
        <br>
        <div id="datos"></div>
        <div id="datos2"></div>
    </div>

    <!-- Modales -->
    <div id="modal01" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header"></div>
        <div class="modal-body"></div>
        <div class="modal-footer"></div>
    </div>
    <div id="modal02" class="modal container hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header"></div>
        <div class="modal-body"></div>
        <div class="modal-footer"></div>
    </div>
</div>

