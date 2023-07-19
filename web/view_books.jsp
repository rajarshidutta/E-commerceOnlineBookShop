<%-- 
    Document   : view_books
    Created on : 12-Jun-2023, 9:05:08 pm
    Author     : Rajarshi
--%>

<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Books Page</title>
        
        <%@include file="all_components/all_css.jsp" %>
        
    </head>
    <body style="background-color: #f0f1f2;">
       
        <%
            User u=(User)session.getAttribute("userobj");
        %>
        
        <%@include file="all_components/navbar.jsp" %>
        
        <%
            int bid=Integer.parseInt(request.getParameter("bid"));
            BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
            BookDtls b=dao.getBookById(bid);
        %>
        
        <div class="container p-3">
            <div class="row p-5">
                <div class="col-md-6 text-center p-5 border bg-white">
                    <img src="book/<%= b.getPhotoName() %>" style="height: 150px; width: 150px;"><br>
                    <h4 class="mt-3">Book Name: <span class="text-success"><%= b.getBookname() %></span></h4>
                    <h4>Author Name: <span class="text-success"><%= b.getAuthor() %></span></h4>
                    <h4>Category: <span class="text-success"><%= b.getBookCategory() %></span></h4>
                </div>
                
                <div class="col-md-6 text-center p-5 border bg-white">
                    <h2><%= b.getBookname() %></h2>
                    
                    <%
                        if("Old".equals(b.getBookCategory()))
                        {%>
                            <h5 class="text-primary">Contact to Seller</h5>
                            <h5 class="text-primary"><i class="far fa-envelope"></i>  Email: <%= b.getEmail() %></h5>
                        <%}
                    
                    %>
                    
                    
                    
                    <div class="row">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-money-bill-wave fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-undo-alt fa-2x"></i>
                            <p>Return Available</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-truck-moving fa-2x"></i>
                            <p>Free Shipping</p>
                        </div>
             
                    </div>
                    
                    <%
                        if("Old".equals(b.getBookCategory()))
                        {%>
                                <div class="text-center p-3">
                                    <a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-shopping"></i> Continue Shopping</a>
                                    <a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> 200</a>
                                </div>
                        <%}
                        else
                        {%>
                                <div class="text-center p-3">
                                    <% 
                                                            if(u==null)
                                                            {%>
                                                                <a href="login.jsp" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                                                            <%}
                                                            else
                                                            {%>
                                                                <a href="cart?bid=<%= b.getBookId() %>&&uid=<%= u.getId() %>" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                                                            <%}                       

                                    %>
                                    
                                    <a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> 200</a>
                                </div>

                        <%}
                    
                    %>
                    
                    
                    
                    
                </div>
            </div>
        </div>
        
        
    </body>
</html>
