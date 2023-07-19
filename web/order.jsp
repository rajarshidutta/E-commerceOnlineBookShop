<%-- 
    Document   : order
    Created on : 14-Jun-2023, 10:23:38 pm
    Author     : Rajarshi
--%>


<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Book</title>
        
        <%@include file="all_components/all_css.jsp" %>
        
    </head>
    <body>
        
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        
        <%@include file="all_components/navbar.jsp" %>
        
        <div class="container p-1">
            <h3 class="text-center text-primary">Your Order</h3>
            <table class="table table-striped mt-3">
                
                <thead class="bg-primary text-white">
                  <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment Type</th>
                  </tr>
                </thead>
                
                <tbody>
                  
                  <%
                      User u=(User)session.getAttribute("userobj");
                      BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
                      List<Book_Order> list=dao.getBook(u.getEmail());
                      
                      for(Book_Order b:list)
                      {%>
                            <tr>
                               <th scope="row"><%= b.getOrderId() %></th>
                               <td><%= b.getUserName() %></td>
                               <td><%= b.getBookName() %></td>
                               <td><%= b.getAuthor() %></td>
                               <td><%= b.getPrice() %></td>
                               <td><%= b.getPaymentType() %></td>
                             </tr>
                      
                      <%}
                  %>  
               
                </tbody>
                
            </table>
        </div>
        
    </body>
</html>