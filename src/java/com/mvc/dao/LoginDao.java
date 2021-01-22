package com.mvc.dao;

import com.mvc.bean.LoginBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt;


public class LoginDao 
{
    public String authorizeLogin(LoginBean loginBean) 
    {
        String username = loginBean.getUsername(); 
        String password = loginBean.getPassword(); 
        
        String dbusername = "";  
        String dbpassword = "";
        
        String url = "jdbc:mysql://localhost:33306/prozorro_java"; 
        String uname = "root"; 
        String pass = "mysql";
        String result = "WRONG USERNAME OR PASSWORD"; 
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection(url,uname,pass); 
            
            PreparedStatement pstmt = null; 
            
            pstmt = con.prepareStatement("select * from user where username=?"); 
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery(); 
             
            while(rs.next())
            {    
                dbusername = rs.getString("username");   
                dbpassword = rs.getString("password"); 
                
                if (username.equals(dbusername) && 
                        BCrypt.checkpw(password, dbpassword))  
                {
                    result = "SUCCESS LOGIN";
                    break;
                }
            } 
           
            pstmt.close();
            con.close(); 
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return result;
    }
}
