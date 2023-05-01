<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>會員登入</title>
<%@include file="/subviews/global.jsp" %>
</head>
<body>
	<jsp:include page="/subviews/header.jsp" />
	<%
		List<String> errors = (List<String>) request.getAttribute("errors");

		//讀取Cookie
		String id = "";
		String auto = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if ("id".equals(cookie.getName())) {
					id = cookie.getValue();
				} else if ("auto".equals(cookie.getName())) {
					auto = cookie.getValue();
				}
			}
		}
	%>
	<article style="min-height: 70vh; margin: auto; width: 80%;">
		<%=errors != null && errors.size() > 0 ? errors : ""%>
		<form action="login.do" method="POST">
			<p>
				<label>帳號:</label> 
				<input type="text" required name="id" 
					value="<%=request.getParameter("id") != null ? request.getParameter("id") : id%>"
					placeholder="必須輸入身分證號或email"> 
				<input type="checkbox" name="auto"
					<%="GET".equals(request.getMethod()) ? auto : (request.getParameter("auto") != null ? "checked" : "")%>>
				<label>記住我的帳號</label>
			</p>
			<p>
				<label>密碼:</label>
				<input type="password" required name="password" maxlength="20">
			</p>
			<p>		
						
				<script>
					function refreshImage() {
						//alert("refresh Image");
						var captchaImage = document.getElementById("captchaImage");
						captchaImage.src = "images/captcha.jpg?refresh="+ new Date();
					}
				</script>
				<label>驗證碼:</label>
				<input type="text" value="" required name="captcha"> 
				<a href="javascript:refreshImage()" title="點選圖片即可更新驗證碼"> 
					<img id="captchaImage" src="images/captcha.jpg" style="vertical-align: middle;">
				</a>
				
				<%-- 
				<pg:captcha imgSrc="images/captcha.jpg" paramName="captcha"/>
				--%>
			</p>
			<input type="submit" value="確定">
		</form>
	</article>
	<%@include file="/subviews/footer.jsp" %>
</body>
</html>