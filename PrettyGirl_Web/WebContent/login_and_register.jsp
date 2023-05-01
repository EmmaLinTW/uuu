<%@page import="uuu.pg.entity.Customer"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" >
<title>會員登入/註冊</title>
<%@include file="/subviews/global.jsp" %>

<style>
.loginDiv{
	box-sizing: border-box;
	display: block;
	width: 500px;
	/*border: 1px solid red;*/
}
#loginDiv{
	float:left;
	border-right: 2px solid #999;
}
#registerDiv{
	float:left;
}
.titleTd{
	text-align: center;
}
.titleSpan{
	font-size: 24px;
}
td{
	padding: 10px;
	
}
.lebelTd{
	width:25%;
}
.inputTd{
	width:75%;
}
.hintSpan{
	font-size: 14px;
    color: #666;
}
.submitTd{
	text-align: center;
}
.Submitbtn{
	padding: 15px 32px;
  font-size: 20px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #729ff3;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}
.Submitbtn:hover{
	background-color: #4984ef
}
.Submitbtn:active {
  background-color: #4984ef;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}


</style>
<script>
	function refreshLoginImage(){
		//alert("refresh Image");
		var captchaImage = document.getElementById("logincaptchaImage");
		captchaImage.src="images/captcha.jpg?refresh=" + new Date();
	}
	
	function refreshRegisterImage(){
		//alert("refresh Image");
		var captchaImage = document.getElementById("registercaptchaImage");
		captchaImage.src="images/register_captcha.jpg?refresh=" + new Date();
	}
	
	
	
	
</script>
</head>
<body>

	<div>
	<%
		//讀取Cookie
		String id = "";
		String auto = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if ("loginId".equals(cookie.getName())) {
					id = cookie.getValue();
				} else if ("auto".equals(cookie.getName())) {
					auto = cookie.getValue();
				}
			}
		}
	%>
		<div id="loginDiv" class="loginDiv">
		<form id="LoginFrom"
				action="<%= request.getContextPath()%>/login.do" method="POST"
				onsubmit="return (LoginAjax());">
			<table style="width: 100%;">
				<tbody>
					<tr>
						<td class="titleTd"colspan="2">
						<span class="titleSpan">登入會員</span>
						<div>${requestScope.loginErrors}</div>
						</td>
					</tr>
					<tr>
						<td class="labelTd">會員帳號</td>
						<td class="inputTd">
							<input type="text" name="loginId" required placeholder="請輸入身分證號或email" size="26"
									value="${param.loginId }">
							<input type="checkbox" name="auto"
									<%="GET".equals(request.getMethod()) ? auto : (request.getParameter("auto") != null ? "checked" : "")%>>
							<label>記住帳號</label>
						</td>
					</tr>
					<tr>
						<td class="labelTd">會員密碼</td>
						<td class="inputTd"><input type="password" name="password" required size="26"></td>
					</tr>
					
					<tr>
						<td class="labelTd">驗證碼</td>
						<td class="inputTd">
							<input type="text" value="" required name="captcha"> 
								<a href="javascript:refreshLoginImage()" title="點選圖片即可更新驗證碼"> 
									<img id="logincaptchaImage" src="images/captcha.jpg" style="vertical-align: middle;">
								</a>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="text-align: center;">
							<img style="width: 350px; padding: 22px 0px;"
							src="https://obcdn4.obdesign.com.tw/images/ObdesignBanner/WOMEN/images/191206-AB11806-1920x820_v1.jpg" >
						</td>
					</tr>
					<tr>
						<td class="submitTd" colspan="2">
							<input class="Submitbtn" type="submit" value="登入會員">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		</div>
		<div id="registerDiv" class="loginDiv">
		<form id="registerForm" action='<%= request.getContextPath()%>/register.do' method="POST"
				onsubmit="return (RegisterAjax());">
			<table style="width: 100%;">
				<tbody>
					<tr>
						<td class="titleTd"colspan="2">
							<span class="titleSpan">註冊會員</span>
							<span>${requestScope.registerErrors}</span>
						</td>
					</tr>
					<tr>
						<td class="labelTd">會員帳號</td>
						<td class="inputTd">
							<input type='text' name='id' required size="26"
								value="${param.id}"
								pattern="[A-Z][12][0-9]{8}">
							<span class="hintSpan">請輸入身分證號</span>
						</td>
					</tr>
					<tr>
						<td class="labelTd">會員姓名</td>
						<td class="inputTd">
							<input type='text' name='name' required size="26">
							<input type='radio' name='gender' id='male' 
								${param.gender.equals(String.valueOf(Customer.FEMALE))?"checked":""} 
								value="<%= Customer.FEMALE %>" required><label>小姐</label> 
							<input type='radio' name='gender' id='female'
								<%=(request.getParameter("gender")!=null && request.getParameter("gender").charAt(0)==Customer.MALE?"checked":"")%>
								value="<%= Customer.MALE %>" required><label>先生</label>
						</td>
					</tr>
					<tr>
						<td class="labelTd">密碼設定</td>
						<td class="inputTd">
							<input type='password' name='password1' required size="26">
							<span class="hintSpan">6~20個字元</span>
						</td>
					</tr>
					<tr>
						<td class="labelTd">密碼確認</td>
						<td class="inputTd">
							<input type='password' name='password2' required  size="26">
							<span class="hintSpan">請再次輸入以確認密碼</span>
						</td>
					</tr>
					<tr>
						<td class="labelTd">電子信箱</td>
						<td class="inputTd">
							<input type='email' name='email' required  size="26"
								value="${param.email}">
							<span class="hintSpan"></span>
						</td>
					</tr>
					<tr>
						<td class="labelTd">生日</td>
						<td class="inputTd">
							<input type='date' name='birthday' required  size="26"
								value="${param.birthday}">
						</td>
					</tr>
					<tr>
						<td class="labelTd">手機號碼</td>
						<td class="inputTd">
							<input type='tel' name='phone' required  size="26">
						</td>
					</tr>
					<tr>
						<td class="labelTd">驗證碼</td>
						<td class="inputTd">
							<input type="text" value="" required
						name="captcha" style="width: 6em"> 
						<a href="javascript:refreshRegisterImage()" title="點選圖片即可更新驗證碼">
							<img id="registercaptchaImage" src="images/register_captcha.jpg"
						style="vertical-align: middle;">
						</a>
						</td>
					</tr>
					<tr>
						<td class="submitTd" colspan="2">
							<input class="Submitbtn" type="submit" value="註冊會員">
						</td>
					</tr>
				</tbody>
			</table>
			</form>
		</div>
	</div>
</body>
</html>