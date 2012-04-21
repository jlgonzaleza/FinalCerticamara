<%-- 
    Document   : bodega
    Created on : 18-abr-2012, 22:14:54
    Author     : Jhon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bodega</title>
        <script type="text/javascript">
            function validar(){
                mensaje="";
                bien = true;
                if(window.document.getElementById('code').value == ''){
                    bien = false;
                    mensaje+="* El campo CODIGO esta vacio\n";
                }
                
                if(window.document.getElementById('dir').value == ''){
                    bien = false;
                    mensaje+="* El campo DIRECCION esta vacio\n";
                }
                
                if(bien){
                    window.document.getElementById('formBodega').submit();
                }else{
                    alert(mensaje);
                }
            }
            
        </script>
    </head>
    <body>
    <center>
        <jsp:include page="top.jsp"></jsp:include>
        <form id="formBodega" method="POST" action="bodega1.htm">
             <table class="contacts" >
            <tr>
                <td class="contactDept" colspan="2"><center>CREAR UNA BODEGA</center></td>
            </tr>
            <tr>
                <td class="contact">CODIGO *</td>
                <td class="contact"><input type="text" id="code" name="code" onkeydown="alfanumerico(this)" 
                                           onkeypress="alfanumerico(this)" onkeyup="alfanumerico(this)" 
                                           onchange="alfanumerico(this)" value="${valor.codigo}"/></td>
            </tr>
            <tr>
                <td class="contact">DIRECCION *</td>
                <td class="contact"><input type="text" id="dir" name="dir" onkeydown="aMayusculas(this)" 
                                           onkeypress="aMayusculas(this)" onkeyup="aMayusculas(this)" 
                                           onchange="aMayusculas(this)" value="${valor.direccion}"/></td>
            </tr>
            <tr>
                <td class="contactDept" colspan="2"><center>
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
                <td class="contactDept" colspan="8">PRODUCTOS EN LA BODEGA</td>
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
                <td class="contactDept" colspan="4">BODEGAS</td>
            </tr>
            <tr>
                <td class="contactDept">CODIGO</td>
                <td class="contactDept">DIRECCION</td>
                <td class="contactDept">EDITAR</td>
                <td class="contactDept">ELIMINAR</td>
            </tr>
             <c:forEach items="${lista}" var="car">
                 <c:url var="editar" value="bodega1.htm?function=actualizar&id=${car.codigo}" />
                 <c:url var="eliminar" value="bodega1.htm?function=eliminar&id=${car.codigo}" />
                 <tr>
                     
                <td class="contact">${car.codigo} </td>
                <td class="contact">${car.direccion} </td>
                <td class="contact"><a href="${editar}">Editar</a></td>
                <td class="contact"><a href="${eliminar}">Eliminar</a></td>
            </tr>
            
            </c:forEach>
            
        </table>
        <hr>
        </center>
    </body>
</html>
