<%@ taglib prefix = "a" uri = "WEB-INF/custom.tld"%>
<%
    if(session.getAttribute("login") != null)
    {
        response.sendRedirect("welcome.jsp"); 
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>PROZORRO Login Page</title>
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">       
        <script language="javascript">
        setTimeout(function(){
            document.getElementById("username").focus();
        }, 500);
	function validateLoginForm()
	{
            var username = document.getElementById("username");
            var password = document.getElementById("password");
            username.style.background = '#fff'; 
            password.style.background = '#fff'; 

            if (username.value == null || username.value == "") 
            {
		window.alert("Будь ласка введіть логін"); 
		username.style.background = '#f08080'; 
		username.focus();
		return false;
            }
            if (password.value == null || password.value == "") 
            {
		window.alert("Будь ласка введіть пароль"); 
		password.style.background = '#f08080'; 
		password.focus();
		return false;
            }
	}		
	</script>
    </head>
    <body>
        
    <div class="main-content">

        <form class="form-register" method="post" action="LoginController" name="LoginForm" onsubmit="return validateLoginForm();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1><img src='img/logo.png'> Увійти</h1>
                    </div>		
                    
                    <a:Alert success="RegiseterSuccessMsg" error="WrongLoginMsg"/>
                    <br>
                    
                    <div class="form-row">
                        <label>
                            <span>Логін</span>
                            <input type="text" name="txt_username" id="username" placeholder="введіть логін">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Пароль</span>
                            <input type="password" name="txt_password" id="password" placeholder="введіть пароль">
                        </label>
                    </div>

                    <input type="submit" name="btn_login" value="Увійти">
                    
                </div>

                <a href="register.jsp" class="form-log-in-with-existing">Ще не зареєстровані? <b> Реєстрація тут </b></a>

            </div>

        </form>

    </div>

    </body>
</html>

