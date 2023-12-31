<%-- 
    Document   : old_book
    Created on : 14-Jun-2023, 11:58:27 pm
    Author     : Rajarshi
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>

<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Old book</title>
        
        <%@include file="all_components/all_css.jsp" %>
        
    </head>
    
    
    <body>
        
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        
        <%@include file="all_components/navbar.jsp" %>
        
         <c:if test="${not empty succMsg}">
            <div class="alert alert-success" role="alert">
              ${succMsg}
            </div>
            <c:remove var="succMsg"/>
        </c:if>
        
        <c:if test="${not empty failedMsg}">
            <div class="alert alert-danger" role="alert">
              ${failedMsg}
            </div>
            <c:remove var="failedMsg"/>
        </c:if>
        
        <div class="container p-5">
            <table class="table table-striped">
                <thead class="bg-primary text-white">
                    
                  <tr>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>
                    <th scope="col">Action</th>
                  </tr>
                  
                </thead>
                
                <tbody>
                  
                  <%
                      User u=(User)session.getAttribute("userobj");
                      BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
                      String email=u.getEmail();
                      List<BookDtls> list=dao.getBookByOld(email, "Old");
                      
                      for(BookDtls b:list)
                      {%>
                              <tr>
                                <td><%= b.getBookname() %></td>
                                <td><%= b.getAuthor() %></td>
                                <td><%= b.getPrice() %></td>
                                <td><%= b.getBookCategory() %></td>
                                <td><a href="delete_old_book?em=<%= email %>&&bid=<%= b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a></td>
                              </tr>
                      
                      <%}
                  
                  %>  
          
                </tbody>
            </table>
        </div>
        
    </body>
</html>
