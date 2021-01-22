package com.mvc.controller;

import com.mvc.bean.LoginBean;
import com.mvc.dao.LoginDao;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        if(request.getParameter("btn_login")!=null) 
        {
            String username=request.getParameter("txt_username"); 
            String password=request.getParameter("txt_password"); 
            
            LoginBean loginBean=new LoginBean(); 
            loginBean.setUsername(username); 
            loginBean.setPassword(password); 
            
            LoginDao loginDao=new LoginDao();
            
            String authorize=loginDao.authorizeLogin(loginBean); 
            
            if(authorize.equals("SUCCESS LOGIN")) 
            {
                HttpSession session=request.getSession(); 
                session.setAttribute("login", loginBean.getUsername()); 
                RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp"); 
                rd.forward(request, response);
            }
            else
            {
                request.setAttribute("WrongLoginMsg",authorize); 
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
            }
        }
    }

}
