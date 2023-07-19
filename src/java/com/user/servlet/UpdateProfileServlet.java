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

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            
            String name=req.getParameter("fname");
            String email=req.getParameter("email");
            String phno=req.getParameter("phno");
            String ps=req.getParameter("password");
            int id=Integer.parseInt(req.getParameter("id"));
            
            User u=new User();
            u.setId(id);
            u.setName(name);
            u.setEmail(email);
            u.setPhno(phno);
            u.setPassword(ps);
            
            UserDAOimpl dao=new UserDAOimpl(DBConnect.getConn());
            
            boolean f=dao.checkPassword(ps, id);
            
            HttpSession session=req.getSession();
            
            if(f)
            {
                boolean f2=dao.updateProfile(u);
                
                if(f2)
                {
                    session.setAttribute("succMsg", "Profile Update Successfully...");
                    resp.sendRedirect("edit_profile.jsp");
                }
                else
                {
                    session.setAttribute("failedMsg", "Something wrong on server...");
                    resp.sendRedirect("edit_profile.jsp");
                }
                
            }
            else
            {
                session.setAttribute("failedMsg", "Your Password is Incorrect...");
                resp.sendRedirect("edit_profile.jsp");
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
}
