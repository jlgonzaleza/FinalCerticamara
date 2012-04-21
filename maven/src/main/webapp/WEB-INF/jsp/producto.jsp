<%-- 
    Document   : producto
    Created on : 19-abr-2012, 23:48:31
    Author     : Jhon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto</title>
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
                if(window.document.getElementById('precio').value == ''){
                    bien = false;
                    mensaje+="* El campo PRECIO esta vacio\n";
                }else if(isNaN(window.document.getElementById('precio').value)){
                    bien = false;
                    mensaje+="* El campo PRECIO debe ser un numero\n";
                }
                
                if(window.document.getElementById('cant').value == ''){
                    bien = false;
                    mensaje+="* El campo CANTIDAD esta vacio\n";
                }
                
                if(bien){
                    window.document.getElementById('producto').submit();
                }else{
                    alert(mensaje);
                }
            }
            
        </script>
    </head>
    <body>
    <center>
        <jsp:include page="top.jsp"></jsp:include>
        <form id="producto" method="POST" action="producto1.htm">
             <table class="contacts">
            <tr>
                <td class="contactDept" colspan="2" ><center>CREAR UN PRODUCTO</center></td>
            </tr>
            <tr>
                <td class="contact">ID *</td>
                <td class="contact"><input id="code" type="text" name="id" onkeydown="alfanumerico(this)" 
                                           onkeypress="alfanumerico(this)" onkeyup="alfanumerico(this)" 
                                           onchange="alfanumerico(this)" value="${valor.pid}"/></td>
            </tr>
            <tr>
                <td class="contact">NOMBRE *</td>
                <td class="contact"><input type="text" name="nombre"  id="nombre" onkeydown="aMayusculas(this)" 
                                           onkeypress="aMayusculas(this)" onkeyup="aMayusculas(this)" 
                                           onchange="aMayusculas(this)" value="${valor.nombre}"/></td>
            </tr>
             <tr>
                <td class="contact">PRECIO *</td>
                <td class="contact"><input type="text" name="precio" id="precio" value="${valor.precio}"/></td>
            </tr>
            <tr>
                <td class="contact">CANTIDAD *</td>
                <td class="contact"><input type="text" name="cant" id="cant"  onkeydown="numeros(this)" 
                                           onkeypress="numeros(this)" onkeyup="numeros(this)" 
                                           onchange="numeros(this)" value="${valor.cantidad}"/></td>
            </tr>
             <tr>
                <td class="contact">PRODUCTOR</td>
                <td class="contact"><select id="prod" name="prod" style="width:200px;" >
                        <c:forEach items="${listaP}" var="car">
                            <option value="${car.idProductor}">${car.nombre}</option>
                        </c:forEach></select>
                </td>
            </tr>
            <tr>
                <td class="contact">BODEGA</td>
                <td class="contact"><select id="bode" name="bode" style="width:200px;">
                        <c:forEach items="${listaB}" var="car">
                            <option value="${car.codigo}">${car.codigo}</option>
                        </c:forEach></select></td>
            </tr>
            
            <tr>
                <td class="contactDept" colspan="2" ><center>
                    <input type="button" value="Enviar" onclick="validar()"/>
                <input type="hidden" name="act" value="${act}">
                </center></td>
            </tr>
            </table>
            
        </form>
        
        <hr>
        <table class="contacts">
            <tr>
                <td class="contactDept" colspan="8">PRODUCTOS</td>
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
             <c:forEach items="${lista}" var="car">
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
        
        <hr>
        </center>
    </body>
</html>
