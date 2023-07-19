package com.user.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
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

@WebServlet("/delete_old_book")
public class DeleteOldBookServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            
            String email=req.getParameter("em");
            int bid=Integer.parseInt(req.getParameter("bid"));
            BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
            boolean f=dao.oldBookDelete(email, "Old",bid);
            
            HttpSession session=req.getSession();
            
            if(f)
            {
                session.setAttribute("succMsg", "Old Book Delete Successfully...");
                resp.sendRedirect("old_book.jsp");
            }
            else
            {
                session.setAttribute("failedMsg", "Something wrong on server...");
                resp.sendRedirect("old_book.jsp");
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
