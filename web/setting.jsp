<%-- 
    Document   : setting
    Created on : 14-Jun-2023, 9:22:18 pm
    Author     : Rajarshi
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%@include file="all_components/all_css.jsp" %>
        
        <style type="text/css">
            a{
                text-decoration: none;
                color: black;
            }
            
            a:hover{
                text-decoration: none;
            }
            
        </style>
        
    </head>
    <body style="background-color: #f7f7f7;">
        
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        
        <%@include file="all_components/navbar.jsp" %>
        
        <div class="container">
            
            <c:if test="${not empty userobj}">
                <h3 class="text-center">Hello, ${userobj.name}</h3>
            </c:if>
        
            <div class="row">
                
                <div class="col-md-4">
                    <a href="sell_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-book-open fa-3x"></i>
                                </div>
                                <h4>Sell Old Book</h4>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-4">
                    <a href="old_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-book-open fa-3x"></i>
                                </div>
                                <h4>Old Book</h4>
                            </div>
                        </div>
                    </a>
                </div>
                
                 <div class="col-md-4">
                     <a href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-edit fa-3x"></i>
                                </div>
                                <h4>Edit Profile</h4>
                            </div>
                        </div>
                    </a>
                </div>
                
<!--                 <div class="col-md-4 mt-3">
                     <a href="user_address.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary  text-warning">
                                    <i class="fas fa-map-marker-alt fa-3x"></i>
                                </div>
                                <h4>Your Address</h4>
                                <p>Edit Address</p>
                            </div>
                        </div>
                    </a>
                </div>-->
                
                <div class="col-md-6 mt-3">
                    <a href="order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary  text-danger">
                                    <i class="fas fa-box-open fa-3x"></i>
                                </div>
                                <h4>My Order</h4>
                                <p>Track Your Order</p>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-6 mt-3">
                    <a href="helpline.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary  text-primary">
                                    <i class="fas fa-user-circle fa-3x"></i>
                                </div>
                                <h4>Help center</h4>
                                <p>24*7 Service</p>
                            </div>
                        </div>
                    </a>
                </div>
                
                
            </div>
        </div>
        
        
        <!--//footer-->
        
        <div style="margin-top: 101px;">
            <%@include file="all_components/footer.jsp" %>
        </div>
        
    </body>
</html>
