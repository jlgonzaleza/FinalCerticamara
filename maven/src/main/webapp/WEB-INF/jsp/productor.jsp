<%-- 
    Document   : proveedor
    Created on : 19-abr-2012, 23:12:42
    Author     : Jhon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productor</title>
        <script type="text/javascript">
            function validar(){
                mensaje="";
                bien = true;
                if(window.document.getElementById('code').value == ''){
                    bien = false;
                    mensaje+="* El campo ID esta vacio\n";
                }
                if(window.document.getElementById('nombre').value == ''){
                    bien = false;
                    mensaje+="* El campo NOMBRE esta vacio\n";
                }
                if(window.document.getElementById('tel').value == ''){
                    bien = false;
                    mensaje+="* El campo TELEFONO esta vacio\n";
                }
                
                if(window.document.getElementById('dir').value == ''){
                    bien = false;
                    mensaje+="* El campo DIRECCION esta vacio\n";
                }
                
                if(bien){
                    window.document.getElementById('formProductor').submit();
                }else{
                    alert(mensaje);
                }
            }
            
        </script>
    </head>
    <body>
    <center>
        <jsp:include page="top.jsp"></jsp:include>
        <form id="formProductor" method="POST" action="productor1.htm">
             <table class="contacts">
            <tr>
                <td class="contactDept" colspan="2" ><center>CREAR UN PRODUCTOR</center></td>
            </tr>
            <tr>
                <td class="contact">ID *</td>
                <td class="contact"><input id="code" type="text" name="id" onkeydown="alfanumerico(this)" 
                                           onkeypress="alfanumerico(this)" onkeyup="alfanumerico(this)" 
                                           onchange="alfanumerico(this)"
                                           value="${valor.idProductor}"/></td>
            </tr>
            <tr>
                <td class="contact">NOMBRE *</td>
                <td class="contact"><input id="nombre" type="text" name="nombre"  onkeydown="aMayusculas(this)" 
                                           onkeypress="aMayusculas(this)" onkeyup="aMayusculas(this)" 
                                           onchange="aMayusculas(this)"  value="${valor.nombre}"/></td>
            </tr>
             <tr>
                <td class="contact">TELEFONO *</td>
                <td class="contact"><input id="tel" type="text" name="tel" onkeydown="numeros(this)" 
                                           onkeypress="numeros(this)" onkeyup="numeros(this)" 
                                           onchange="numeros(this)"  value="${valor.telefono}"/></td>
            </tr>
            <tr>
                <td class="contact">DIRECCION *</td>
                <td class="contact"><input id="dir" type="text" name="dir" onkeydown="aMayusculas(this)" 
                                           onkeypress="aMayusculas(this)" onkeyup="aMayusculas(this)" 
                                           onchange="aMayusculas(this)"  value="${valor.direccion}"/></td>
            </tr>
             <tr>
                <td class="contact">EMAIL</td>
                <td class="contact"><input id="email" type="text" name="email"  onkeydown="aMayusculas(this)" 
                                           onkeypress="aMayusculas(this)" onkeyup="aMayusculas(this)" 
                                           onchange="aMayusculas(this)"  value="${valor.mail}"/></td>
            </tr>
            
            <tr>
                <td class="contactDept" colspan="2" ><center>
                    <input type="button" value="Enviar" onclick="validar()"/>
                <input type="hidden" name="act" value="${act}">
                </center></td>
            </tr>
            </table>
            
        </form>
                <br/>
        <c:if test="${act}">
               <table class="contacts">
            <tr>
                <td class="contactDept" colspan="8">PRODUCTOS DEL PRODUCTOR</td>
            </tr>
            <tr>
                <td class="contactDept">ID</td>
                <td class="contactDept">NOMBRE</td>
                <td class="contactDept">PRECIO</td>
                <td class="contactDept">CANTIDAD</td>
                <td class="contactDept">PRODUCTOR</td>
                <td class="contactDept">BODEGA</td>
                <td class="contactDept">EDITAR</td>
                <td class="contactDept">ELIMINAR</td>
            </tr>
             <c:forEach items="${listaP}" var="car">
                 <c:url var="editar" value="producto1.htm?function=actualizar&id=${car.pid}" />
                 <c:url var="eliminar" value="producto1.htm?function=eliminar&id=${car.pid}" />
                 <c:url var="productor" value="productor1.htm?function=actualizar&id=${car.pidProductor}" />
                 <c:url var="bodega" value="bodega1.htm?function=actualizar&id=${car.pidBodega}" />
                 <tr>
                     
                <td class="contact">${car.pid} </td>
                <td class="contact">${car.nombre} </td>
                <td class="contact">${car.precio} </td>
                <td class="contact">${car.cantidad} </td>
                <td class="contact"><a href="${productor}">${car.pidProductor} </a></td>
                <td class="contact"><a href="${bodega}">${car.pidBodega} </a></td>
                <td class="contact"><a href="${editar}">Editar</a></td>
                <td class="contact"><a href="${eliminar}">Eliminar</a></td>
            </tr>
            </c:forEach>
            
        </table>
        </c:if>
        <hr>
        <table class="contacts">
            <tr>
                <td class="contactDept" colspan="7">PRODUCTORES</td>
            </tr>
            <tr>
                <td class="contactDept">ID</td>
                <td class="contactDept">NOMBRE</td>
                <td class="contactDept">TELEFONO</td>
                <td class="contactDept">DIRECCION</td>
                <td class="contactDept">EMAIL</td>
                <td class="contactDept">EDITAR</td>
                <td class="contactDept">ELIMINAR</td>
            </tr>
             <c:forEach items="${lista}" var="car">
                 <c:url var="editar" value="productor1.htm?function=actualizar&id=${car.idProductor}" />
                 <c:url var="eliminar" value="productor1.htm?function=eliminar&id=${car.idProductor}" />
                 <tr>
                     
                <td class="contact">${car.idProductor} </td>
                <td class="contact">${car.nombre} </td>
                <td class="contact">${car.telefono} </td>
                <td class="contact">${car.direccion} </td>
                <td class="contact">${car.mail} </td>
                <td class="contact"><a href="${editar}">Editar</a></td>
                <td class="contact"><a href="${eliminar}">Eliminar</a></td>
            </tr>
            </c:forEach>
            
        </table>
        <hr>
        </center>
    </body>
</html>
