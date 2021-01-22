<%@ taglib prefix = "a" uri = "WEB-INF/custom.tld"%>
<%
    if(session.getAttribute("login")!=null)
    {
        response.sendRedirect("index.jsp");
    }
%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PROZORRO Register User</title>
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
        <script language="javascript">	
	function validateRegisterForm()
	{
            var first_name = /^[a-z A-Z]+$/; 
            var last_name = /^[a-z A-Z]+$/; 
            var user_name = /^[a-z A-Z]+$/; 
            var email_valid= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; 
            var password_valid = /^[A-Z a-z 0-9 !@#$%^&*()_=+?\/\\,\-\.]{8,30}$/; 
            
            var fname = document.getElementById("fname"); 
            var lname = document.getElementById("lname"); 
            var uname = document.getElementById("uname"); 
            var email = document.getElementById("email");
            var password = document.getElementById("password"); 
				
            if (fname.value == '' || !first_name.test(fname.value)) 
            {
		alert("Введіть ім'я латинкою!"); 
                fname.focus();
                fname.style.background = '#f08080';
                return false;                    
            }
            if (lname.value == '' || !last_name.test(lname.value)) 
            {
		alert("Введіть прізвище латинкою!"); 
                lname.focus();
                lname.style.background = '#f08080';
                return false;                    
            }
            if (uname.value == '' || !user_name.test(uname.value)) 
            {
		alert("Введіть логін латинкою!"); 
                uname.focus();
                uname.style.background = '#f08080'; 
                return false;                    
            }
            if(email.value == '' || !email_valid.test(email.value)) 
            {
		alert("Перевірте адресу e-mail");
                email.focus();
                email.style.background = '#f08080';
                return false;                    
            }
            if (password.value == '' || !password_valid.test(password.value)) 
            {
		alert("Пароль має бути латинкою від 8 до 30 символів"); 
                password.focus();
                password.style.background = '#f08080'; 
                return false;                    
            }
	}		
	</script>
    </head>
    <body>

    <div class="main-content">

        <form class="form-register" method="post" action="RegisterController" onsubmit="return validateRegisterForm();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1><img src='img/logo.png'> Реєстрація</h1>
                    </div>

                    <a:Alert success="RegisterSuccessMsg" error="RegisterErrorMsg"/>
                    <br>
				   
                    <div class="form-row">
                        <label>
                            <span>Ім'я</span>
                            <input type="text" name="txt_firstname" id="fname" placeholder="введіть ім'я">
                        </label>
                    </div>
                                   
                    <div class="form-row">
                        <label>
                            <span>Прізвище</span>
                            <input type="text" name="txt_lastname" id="lname" placeholder="введіть прізвище">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>E-mail</span>
                            <input type="text" name="txt_email" id="email" placeholder="введіть email">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Логін</span>
                            <input type="text" name="txt_username" id="uname" placeholder="введіть логін">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Пароль</span>
                            <input type="password" name="txt_password" id="password" placeholder="введіть пароль">
                        </label>
                    </div>

                    <input type="submit" name="btn_register" value="Реєстрація">
					
                </div>
				
                <a href="index.jsp" class="form-log-in-with-existing">Вже зареєстровані? <b> Увійдіть тут! </b></a>

            </div>

        </form>

    </div>
        
    </body>
    
</html>
