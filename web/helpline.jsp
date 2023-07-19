<%-- 
    Document   : helpline
    Created on : 14-Jun-2023, 10:34:04 pm
    Author     : Rajarshi
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Helpline No</title>
        
        <%@include file="all_components/all_css.jsp" %>
        
    </head>
    <body>
        
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
       
        <%@include file="all_components/navbar.jsp" %>
        
        <div class="container">
            <div class="row p-5">
                <div class="col-md-4 offset-md-4 text-center">
                    <div class="text-success">
                        <i class="fas fa-phone-square-alt fa-5x"></i>
                    </div>
                    <h3>24*7 Service</h3>
                    <h4>Help Line Number</h4>
                    <h5>+91 9937084560</h5>
                   
                    <a href="index.jsp" class="btn btn-primary">Home</a>
                    
                </div>
            </div>
        </div>
        
    </body>
</html>
