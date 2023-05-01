<%@ page pageEncoding="UTF-8" contentType="text/html; charset=BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" >
 
<meta http-equiv="refresh" content ="5;url=<%=request.getContextPath() %>" />

<title>註冊成功</title>
<%@include file="/subviews/global.jsp" %>
<style>
#Register_ok{
	width:300px;
	height:300px;
}

</style>

</head>
<body>	

	<div id="Register_ok">
		Hi,
		<h2>${requestScope.customer.getName()} 註冊完成</h2>
		5秒將直接進入<a href="<%=request.getContextPath() %>">首頁</a>
	</div>
		
	

</body>
</html>