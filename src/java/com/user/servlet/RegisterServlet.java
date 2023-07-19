package com.user.servlet;

import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import com.entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rajarshi
 */

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     
            try {
            
                String fname=req.getParameter("fname");
                String email=req.getParameter("email");
                String phno=req.getParameter("phno");
                String password=req.getParameter("password");
                String check=req.getParameter("check");
                
//                System.out.println(fname+" "+email+" "+phno+" "+password+" "+check+" ");

                User u=new User();
                u.setName(fname);
                u.setEmail(email);
                u.setPhno(phno);
                u.setPassword(password);
                
                HttpSession session=req.getSession();
                
                if(check!=null)
                {
                    UserDAOimpl dao=new UserDAOimpl(DBConnect.getConn());
                    
                    boolean f2=dao.checkUser(email);
                    
                    if(f2)
                    {
                        boolean f=dao.userRegister(u);
                        if(f)
                        {
    //                        System.out.println("User Register Success...");
                            session.setAttribute("succMsg", "Registration Successfully...");
                            resp.sendRedirect("register.jsp");
                        }
                        else
                        {
    //                        System.out.println("Something wrong on server...");
                            session.setAttribute("failedMsg", "Something wrong on server...");
                            resp.sendRedirect("register.jsp");
                        }
                    }
                    else
                    {
                        session.setAttribute("failedMsg", "User Already Exist Try Anothter Email id...");
                        resp.sendRedirect("register.jsp");
                    }
               
                }
                else
                {
//                    System.out.println("Please Check Agree the terms & conditions...");
                    session.setAttribute("failedMsg", "Please Agree terms & conditions...");
                    resp.sendRedirect("register.jsp");
                }
                
                
               
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        
        
    }
    
    
    
}
