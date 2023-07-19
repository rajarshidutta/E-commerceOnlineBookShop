<%-- 
    Document   : all_books
    Created on : 09-Jun-2023, 8:47:19 pm
    Author     : Rajarshi
--%>

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin : All Books</title>
        
        <%@include file="all_css.jsp" %>
        
    </head>
    <body>
        
        <%@include file="navbar.jsp" %>
        
        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp"/>
        </c:if>
        
        
        <h3 class="text-center">Hello Admin</h3>
        
        
        <c:if test="${not empty succMsg}">
            <p class="text-center text-success">${succMsg}</p>
            <c:remove var="succMsg" scope="session"/>
        </c:if>
        <c:if test="${not empty failedMsg}">
            <p class="text-center text-danger">${failedMsg}</p>
            <c:remove var="failedMsg" scope="session"/>
        </c:if>
                                
        
        
        
        
        <table class="table table-striped">
            <thead class="bg-primary text-white">
              <tr>
                <th scope="col">Id</th>  
                <th scope="col">Image</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Category</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            
            <tbody>
                
                <%
                    BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
                    List<BookDtls> list=dao.getAllBooks();
                    for(BookDtls b:list)
                    {%>
                            <tr>
                                <td><%= b.getBookId() %></td>
                                <td><img src="../book/<%= b.getPhotoName() %>" style="width: 50px;height: 50px"></td>
                                <td><%= b.getBookname() %></td>
                                <td><%= b.getAuthor() %></td>
                                <td><%= b.getPrice() %></td>
                                <td><%= b.getBookCategory() %></td>
                                <td><%= b.getStatus() %></td>
                                <td>
                                    <a href="edit_books.jsp?id=<%= b.getBookId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a><!-- comment -->
                                    <a href="../delete?id=<%= b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
                                </td>
                            </tr>
                    <%}
                %>
               
            </tbody>
      </table>

      
        <div style="margin-top: 300px;">
            <%@include file="footer.jsp" %>
        </div>
        
    </body>
</html>
