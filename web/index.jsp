<%-- 
    Document   : index
    Created on : 07-Jun-2023, 9:17:01 pm
    Author     : Rajarshi
--%>



<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook : Index Page</title>
        
        <%@include file="all_components/all_css.jsp" %>
        
        <style type="text/css">
            .back-img{
                background: url(img/bookhome.jpg);
                height: 50vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
            
            .crd-ho:hover{
                background-color: #fcf7f7;
            }
        </style>
        
        
    </head>
    <body  style="background-color: #f7f7f7">
        
        
        <%
            User u=(User)session.getAttribute("userobj");
        %>
        
        <%@include file="all_components/navbar.jsp" %>
        
        <div class="container-fluid back-img">
            <h2 class="text-center text-white"><i class="fa-solid fa-book"></i> Online College Street</h2>
        </div>
        
        
        <!--start recent book-->
        <div class="container">
            <h3 class="text-center">Recent Book</h3>
            <div class="row">
                
                <%
                    BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
                    List<BookDtls> list2=dao2.getRecentBooks();
                    
                    for(BookDtls b:list2)
                    {%>
                            <div class="col-md-3">
                                <div class="card crd-ho">
                                    <div class="card-body text-center">
                                        <img style="width: 200px;height: 200px;" class="img-thumblin" src="book/<%= b.getPhotoName() %>" alt=""/>
                                        <p><%= b.getBookname() %></p>
                                        <p><%= b.getAuthor() %></p>
                                        <p>Category : <%= b.getBookCategory() %><p>
                                        
                                        <%
                                            if(b.getBookCategory().equals("Old"))
                                            {%>
                                                    <div class="row">
                                                        <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>
                                                        <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></a>
                                                    </div>
                                            <%}
                                             else
                                            {%>
                                                    <div class="row">
                                                        
                                                         <% 
                                                            if(u==null)
                                                            {%>
                                                                <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                                            <%}
                                                            else
                                                            {%>
                                                                <a href="cart?bid=<%= b.getBookId() %>&&uid=<%= u.getId() %>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                                            <%}

                                                        %>
                                                        
                                                        <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
                                                        <a href="" class="btn btn-danger btn-sm "><i class="fa-solid fa-indian-rupee-sign"></i><%= b.getPrice() %></a>
                                                    </div>

                                            <%}
                                        %>    
                                            
                                            

                                    </div>
                                </div>
                            </div>
                    <%}
                %>
               
            </div>
            
            <div class="text-center mt-1">
                <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div> 
            
        </div>
        
        <!--end Recent book-->
        
        
        <hr>
        
         <!--start New book-->
        <div class="container">
            <h3 class="text-center">New Book</h3>
            <div class="row">
                
                
                    
                    <%
                        BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
                        List<BookDtls> list=dao.getNewBook();
                        
                        for(BookDtls b:list)
                        {%>
                            <div class="col-md-3">
                                <div class="card crd-ho">
                                    <div class="card-body text-center">
                                        <img style="width: 200px;height: 200px;" class="img-thumblin" src="book/<%= b.getPhotoName() %>" alt=""/>
                                        <p><%= b.getBookname() %></p>
                                        <p><%= b.getAuthor() %></p>
                                        <p>Category : <%= b.getBookCategory() %><p>

                                        <div class="row">
                                            
                                            <% 
                                                if(u==null)
                                                {%>
                                                    <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                                <%}
                                                else
                                                {%>
                                                    <a href="cart?bid=<%= b.getBookId() %>&&uid=<%= u.getId() %>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                                <%}
                                            
                                            %>
                                            
                                            
                                            <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
                                            <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></a>
                                        </div>    

                                    </div>
                                </div>
                             </div>            
                        <%}
                    %>
              
            </div>
            
            <div class="text-center mt-1">
                <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div> 
            
        </div>
        
        <!--end New book-->

        <hr>

         <!--start Old book-->
        <div class="container">
            <h3 class="text-center">Old Book</h3>
            <div class="row">
                
                
                <%
                    BookDAOImpl dao3=new BookDAOImpl(DBConnect.getConn());
                    List<BookDtls> list3=dao3.getOldBooks();
                    
                    for(BookDtls b: list3)
                    {%>
                            <div class="col-md-3">
                                <div class="card crd-ho">
                                    <div class="card-body text-center">
                                        <img style="width: 200px;height: 200px;" class="img-thumblin" src="book/<%= b.getPhotoName() %>" alt=""/>
                                        <p><%= b.getBookname() %></p>
                                        <p><%= b.getAuthor() %></p>
                                        <p>Category : <%= b.getBookCategory() %><p>

                                        <div class="row">
                                            <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>
                                            <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></a>
                                        </div>    

                                    </div>
                                </div>
                             </div>  
                    <%}
                
                %>
              
                
            </div>
                
                
                
            <div class="text-center mt-1">
                <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div> 
            
        </div>
        
        <!--end Old book-->

        <hr>

        
        <!--footer-->
        <%@include file="all_components/footer.jsp" %>
        
        
    </body>
</html>
