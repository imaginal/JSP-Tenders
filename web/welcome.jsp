<%
if(session.getAttribute("login") == null || session.getAttribute("login") == "")
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
        <title>PROZORRO Browse Tenders</title>
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
    </head>
    <body>

    <div class="main-content">

        <div class="left-panel">
                    
            <form class="form-register">

                <div class="form-register-with-email">

                    <div class="form-title-row">
                        <h1 style="color:#fff"><img src='img/logo.png'> Тендери</h1>
                        <p>Ваша роль: постачальник</p>
                        <p><a href="logout.jsp">[x] Вийти</a></p>
                    </div>
				   
                    <div class="form-row">
                        <input type="text" name="txt_tenderID" id="tenderID" placeholder="tenderID">
                    </div>
                    <div class="form-row">
                        <input type="text" name="txt_tenderTitle" id="tenderTitle" placeholder="назва">
                    </div>
                    <div class="form-row">
                        <input type="text" name="txt_tenderValue" id="tenderValue" placeholder="сума грн.">
                    </div>
                    <div class="form-row">
                        <input type="text" name="txt_startDate" id="startDate" placeholder="дата початку">
                    </div>
                    <div class="form-row">
                        <input type="text" name="txt_endDate" id="endDate" placeholder="дата завершення">
                    </div>
                    
                    <input type="submit" name="btn_filter" value="Фільтрувати">

                </div>
                
            </form>
            
        </div>
        
        <div class="tenders-table">
            
            <h2>Вітаю, <%=session.getAttribute("login")%> </h2>
            <p>Нові тендери спеціально для вас</p>
            <br>
            
            <table>
                <thead>
                    <tr>
                        <th>Код</th>
                        <th>Замовник</th>
                        <th>Предмет</th>
                        <th>Дата початку</th>
                        <th>Дата завершення</th>
                        <th>Сума</th>
                        <th>Валюта</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>ДК 021:2015 - 45310000-3</td>
                        <td>Харківський національний університет імені В.Н.Каразіна</td>
                        <td>Електромонтажні роботи, а саме: монтаж системи пожежної сигналізації та передавання сповіщень</td>
                        <td>22.01.2020</td>
                        <td>22.03.2020</td>
                        <td class="price">2,220,000</td>
                        <td>UAH</td>
                     </tr>                        
                    <tr>
                        <td>ДК 021:2015 79820000-8</td>
                        <td>ДП Харківський національний університет</td>
                        <td>Послуги, пов’язані з друком</td>
                        <td>12.01.2020</td>
                        <td>12.03.2020</td>
                        <td class="price">14,000</td>
                        <td>UAH</td>
                     </tr>                        
                    <tr>
                        <td>ДК 021:2015 09120000-6</td>
                        <td>Харківський національний університет імені В.Н.Каразіна</td>
                        <td>Газове паливо (природний газ для ботанічного саду)</td>
                        <td>02.02.2020</td>
                        <td>22.03.2020</td>
                        <td class="price">1,240,000</td>
                        <td>UAH</td>
                     </tr>                        
                    <tr>
                        <td>ДК 021:2015 09120000-6</td>
                        <td>ДП Харківський національний університет</td>
                        <td>Природний газ для навчальних корпусів, лабораторій, віварію, клініки, котельні</td>
                        <td>14.01.2020</td>
                        <td>14.03.2020</td>
                        <td class="price">1,920,000</td>
                        <td>UAH</td>
                     </tr>                
                    <tr>
                        <td>ДК 021:2015 09120000-6</td>
                        <td>Харківський національний університет імені В.Н.Каразіна</td>
                        <td>Газове паливо (природний газ для отоплення ботанічного саду та супутніх приміщень)</td>
                        <td>02.02.2020</td>
                        <td>22.03.2020</td>
                        <td class="price">1,240,000</td>
                        <td>UAH</td>
                     </tr>                        
                </tbody>
            </table>

            <br>
            <input type="button" value="&lt; Попередні">
            <input type="button" value="Наступні &gt;">
            
        </div>

    </div>
    </body>
</html>


