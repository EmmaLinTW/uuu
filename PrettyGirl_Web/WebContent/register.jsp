<jsp:directive.page import="java.util.List" />
<%@page import="uuu.pg.entity.Customer"%>
<%@ page pageEncoding="UTF-8" contentType="text/html;"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link href="style/vgb.css" rel="stylesheet" type="text/css" >
<title>會員註冊</title>
<%@include file="/subviews/global.jsp" %>
<script>
	function refreshImage(){
		//alert("refresh Image");
		var captchaImage = document.getElementById("captchaImage");
		captchaImage.src="images/register_captcha.jpg?refresh=" + new Date();
	}
</script>
</head>
<body>	
	<jsp:include page="/subviews/header.jsp" >
		<jsp:param value="會員註冊" name="subtitle"/>		
	</jsp:include>
	<article style="min-height: 70vh;margin:auto; width:80%;">
		<%
			List<String> errors = (List<String>)request.getAttribute("errors");
		%>
		<%= errors!=null && errors.size()>0?errors:""  %>
		<form action='register.do' method="POST">
			<p>
				<label>帳號:</label> 
				<input name='id' type='text' required 
					value="<%= request.getParameter("id")!=null ? request.getParameter("id"):""%>"
					pattern="[A-Z][12][0-9]{8}" placeholder='請輸入身分證號'>
			</p>
			<p>
				<label>姓名:</label> 
				<input name='name' type='text' required 
					value="${param.name}" placeholder='請輸入姓名'>
			</p>
			<p>
				<label>密碼:</label> 
				<input name='password1' type='password'
					placeholder='請輸入密碼(6~20個字)' minlength="6" maxlength="20" required><br>
				<label>確認:</label> 
				<input name='password2' type='password'
					placeholder='請再確認密碼(6~20個字)' minlength="6" maxlength="20" required>
			</p>
			<p>
				<label>性別:</label> 
				<input type='radio' name='gender' id='male' 
					<%=(request.getParameter("gender")!=null && request.getParameter("gender").charAt(0)==Customer.MALE?"checked":"")%>
					value="<%= Customer.MALE %>" required><label>男</label> 
				<input type='radio' name='gender' id='female'				
					${param.gender.equals(String.valueOf(Customer.FEMALE))?"checked":""} 
					value="<%= Customer.FEMALE %>" required><label>女</label>
			</p>
			<p>
				<label>Email: </label> 
				<input name='email' type='email' required value="${param.email}" placeholder='請輸入Email'>
			</p>
			<p>
				<label>生日:</label> 
				<input name='birthday' value="${param.birthday}" required type='date'>
			</p>
			<p>
				<label>地址:</label>
				<textarea name='address'>${param.address}</textarea>
			</p>
			<p>
				<label>電話:</label> 
				<input name='phone' type='tel'
					value="<%= request.getParameter("phone")!=null?request.getParameter("phone"):""%>">
			</p>
			<p>
				<label>婚姻:</label> 
				<input type="checkbox" name='married' <%=request.getParameter("married")!=null?"checked":""%>>
				<label>已婚</label>
			</p>
			
			<p>
				<label>驗證碼:</label> 
				<input type="text" value="" required
					name="captcha" style="width: 6em"> <a
					href="javascript:refreshImage()" title="點選圖片即可更新驗證碼">
				<img id="captchaImage" src="images/register_captcha.jpg"
					style="vertical-align: middle;">
				</a>
			</p>		
			<input type='submit' value="確定">
		</form>
	</article>	
	<%@include file="/subviews/footer.jsp" %>
</body>
</html>