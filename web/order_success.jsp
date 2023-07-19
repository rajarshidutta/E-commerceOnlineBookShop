<%-- 
    Document   : order_success
    Created on : 15-Jun-2023, 8:30:03 pm
    Author     : Rajarshi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Success Page</title>
        
        <%@include file="all_components/all_css.jsp" %>
        
    </head>
    
    <body style="background-color: #f0f1f2;">
        
        <%@include file="all_components/navbar.jsp" %>
        
        <div class="container text-center mt-3">
            <i class="fas fa-check-circle fa-5x text-success"></i>
            <h1>Thank You</h1>
            <h2>Your Order Successful</h2>
            <h5>Within 7 days Your Product will be Delivered In your Address</h5>
            <a href="index.jsp" class="btn btn-primary mt-3">Home</a>
            <a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
        </div>
        
        
    </body>
</html>
