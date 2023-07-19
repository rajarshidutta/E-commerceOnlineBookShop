<%-- 
    Document   : all_recent_book
    Created on : 12-Jun-2023, 8:19:59 pm
    Author     : Rajarshi
--%>

<%@page import="com.entity.User"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Books</title>
        
        <%@include file="all_components/all_css.jsp" %>
        
        <style type="text/css">
            .crd-ho:hover{
                background-color: #fcf7f7;
            }
        </style>
        
        
    </head>
    <body style="background-color: #f0f1f2;">
       
        
        <%
            User u=(User)session.getAttribute("userobj");
        %>
        
        <%@include file="all_components/navbar.jsp" %>
        
        <div class="container-fluid">
            <div class="row p-3">
                <%
                    String ch=request.getParameter("ch");
                    BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
                    List<BookDtls> list=dao.getBookBySearch(ch);
                    
                    for(BookDtls b:list)
                    {%>
                            <div class="col-md-3">
                                <div class="card crd-ho mt-2">
                                    <div class="card-body text-center">
                                        <img style="width: 150px;height: 150px;" class="img-thumblin" src="book/<%= b.getPhotoName() %>" alt=""/>
                                        <p><%= b.getBookname() %></p>
                                        <p><%= b.getAuthor() %></p>
                                        <p>Category : <%= b.getBookCategory() %><p>
                                        
                                        <%
                                            if(b.getBookCategory().equals("Old"))
                                            {%>
                                                    <div class="row">
                                                        <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>
                                                        <a href="" class="btn btn-danger btn-sm ml-4"><i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></a>
                                                    </div>
                                            <%}
                                             else
                                            {%>
                                                    <div class="row">
                                                        <% 
                                                            if(u==null)
                                                            {%>
                                                                <a href="login.jsp" class="btn btn-danger btn-sm ml-4">Add Cart</a>
                                                            <%}
                                                            else
                                                            {%>
                                                                <a href="cart?bid=<%= b.getBookId() %>&&uid=<%= u.getId() %>" class="btn btn-danger btn-sm ml-4">Add Cart</a>
                                                            <%}

                                                        %>
                                                        <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
                                                        <a href="" class="btn btn-danger btn-sm ml-1 "><i class="fa-solid fa-indian-rupee-sign"></i><%= b.getPrice() %></a>
                                                    </div>

                                            <%}
                                        %>    
                                            
                                            

                                    </div>
                                </div>
                            </div>
                    <%}
                %>
            </div>
        </div>
        
        
    </body>
</html>
