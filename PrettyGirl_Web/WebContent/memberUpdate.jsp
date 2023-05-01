<%@page import="uuu.pg.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" >
<title>title</title>
<%@include file="/subviews/global.jsp" %>
</head>
<body>

	<jsp:include page="/subviews/header.jsp" >
		<jsp:param value="File Not Found" name="subtitle"/>		
	</jsp:include>
	<%
		Customer member = (Customer)session.getAttribute("member");
	%>
	<article>
			<div>
		<form action='<%= request.getContextPath()%>/' method="POST">
			<table>
				<tbody>
					<tr>
						<td class="titleTd"colspan="2">
							<span>${requestScope.registerErrors}</span>
						</td>
					</tr>
					<tr>
						<td class="labelTd">會員帳號</td>
						<td class="inputTd">
							<div>${sessionScope.member.name}</div>
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
						<td class="submitTd" colspan="2">
							<input class="Submitbtn" type="submit" value="註冊會員">
						</td>
					</tr>
				</tbody>
			</table>
			</form>
		</div>
	</article>
	
<%@include file="/subviews/footer.jsp" %>

</body>
</html>