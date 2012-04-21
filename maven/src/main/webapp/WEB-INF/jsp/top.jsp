<%-- 
    Document   : top
    Created on : 19-abr-2012, 23:39:44
    Author     : Jhon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css" media="all">
        body{ font: "Trebuchet MS";}
        
            table.contacts
        { width: 650px;
        background-color: #fafafa;
        border: 1px #000000 solid;
        border-collapse: collapse;
        border-spacing: 0px; }


        td.contactDept
        { background-color: #99CCCC;
        border: 1px #000000 solid;
        font-family: Verdana;
        font-weight: bold;
        font-size: 12px;
        color: #404040; }


        td.contact
        { border-bottom: 1px #6699CC dotted;
        text-align: left;
        font-family: Verdana, sans-serif, Arial;
        font-weight: normal;
        font-size: .7em;
        color: #404040;
        background-color: #fafafa;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 8px;
        padding-right: 0px; }
        
        </style>
        
        <script type="text/javascript">
            function alfanumerico(o){
		  o.value=o.value.toUpperCase().replace(/([^0-9A-Z])/g,"");
		}
            function numeros(o){
		  o.value=o.value.toUpperCase().replace(/([^0-9])/g,"");
		}    
             
          function aMayusculas(o){
		  o.value=o.value.toUpperCase();
		}
            
        </script>
        
        <title>JSP Page</title>
    </head>
    <body>
        <c:url var="bodega" value="bodega1.htm" />
        <c:url var="productor" value="productor1.htm" />
        <c:url var="producto" value="producto1.htm" />         
        <center> 
            <table class="contacts">
                <tr>
                    <td class="contactDept"><h2><a href="${bodega}">1.BODEGA</a></h2></td>
                    <td class="contactDept"><h2><a href="${productor}">2.PRODUCTOR</a></h2></td>
                    <td class="contactDept"><h2><a href="${producto}">3.PRODUCTO</a></h2></td>
                </tr>
            </table>
        
        </center>
                    <hr>
    </body>
</html>
