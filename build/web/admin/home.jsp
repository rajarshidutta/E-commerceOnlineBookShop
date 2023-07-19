<%-- 
    Document   : home
    Created on : 08-Jun-2023, 10:10:31 pm
    Author     : Rajarshi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin : home</title>
        
        <%@include file="all_css.jsp" %>
        
        <style type="text/css">
            a{
                text-decoration: none;
                color: black;
            }
            a:hover{
                text-decoration: none;
                color: black;
            }
            
            
        </style>
        
        
    </head>
    <body style="background-color: #f0f1f2;">
        
        <%@include file="navbar.jsp" %>
        
        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp"/>
        </c:if>
        
        
        <div class="container">
            <div class="row p-5">
                
                <div class="col-md-3">
                    <a href="add_books.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-plus-square fa-3x text-primary"></i><br>
                                <h4>Add Books</h4>
                                <p>--------</p>
                            </div>
                        </div>
                    </a>    
                </div>
                
                 <div class="col-md-3">
                     <a href="all_books.jsp"> 
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
                                <h4>All Books</h4>
                                <p>--------</p>
                            </div>
                        </div>
                     </a>     
                </div>
                
                 <div class="col-md-3">
                     <a href="orders.jsp"> 
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-box-open fa-3x text-warning"></i><br>
                                <h4>Orders</h4>
                                <p>--------</p>
                            </div>
                        </div>
                     </a>     
                </div>
                
                 <div class="col-md-3">
                     <a data-toggle="modal" data-target="#exampleModalCenter"> 
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
                                <h4>Logout</h4>
                                <p>--------</p>
                            </div>
                        </div>
                     </a>
                </div>
                
                
            </div>
        </div>
        
        <!-- logout modal -->

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <div class="text-center">
                      <h4>Do you want Logout</h4>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
                  </div>
              </div>
              <div class="modal-footer">
              </div>
            </div>
          </div>
        </div>
        <!--end logout modal-->

        
        
        
        
        <div style="margin-top: 200px;">
            <%@include file="footer.jsp" %>
        </div>
        
        
    </body>
</html>
