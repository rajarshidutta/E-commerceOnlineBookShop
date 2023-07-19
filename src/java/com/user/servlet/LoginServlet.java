
package com.user.servlet;

import com.DAO.UserDAO;
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

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            
            UserDAOimpl dao=new UserDAOimpl(DBConnect.getConn());
            
            HttpSession session=req.getSession();
            
            String email=req.getParameter("email");
            String password=req.getParameter("password");
            
            if("admin@gmail.com".equals(email) && "rajarshi".equals(password))
            {
                User u=new User();
                u.setName("Admin");
                session.setAttribute("userobj", u);
                resp.sendRedirect("admin/home.jsp");
            }
            else
            {
                User u=dao.login(email, password);
                if(u!=null)
                {
                    session.setAttribute("userobj",u );
                    resp.sendRedirect("index.jsp");
                }
                else
                {
                    session.setAttribute("failedMsg", "Email & Password Invalid");
                    resp.sendRedirect("login.jsp");
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
    }
    
}
