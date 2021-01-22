package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.mvc.bean.RegisterBean;

public class RegisterDao 
{
    public String authorizeRegister(RegisterBean registerBean) 
    {
        String firstname = registerBean.getFirstname();
        String lastname = registerBean.getLastname();
        String email = registerBean.getEmail();  
        String username = registerBean.getUsername();  
        String password = registerBean.getPasswordHash();
        
        String url = "jdbc:mysql://localhost:33306/prozorro_java"; 
        String uname = "root"; 
        String pass = "mysql";
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection(url, uname, pass);
            
            PreparedStatement pstmt=null; 
            
            pstmt = con.prepareStatement("insert into user(firstname,lastname,email,username,password) values(?,?,?,?,?)"); 
            pstmt.setString(1,firstname);
            pstmt.setString(2,lastname);
            pstmt.setString(3,email);
            pstmt.setString(4,username);
            pstmt.setString(5,password); 
            pstmt.executeUpdate(); 
            
            pstmt.close(); 
            con.close(); 
            
            return "SUCCESS REGISTER";
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return "FAIL REGISTER";
    }
}
