<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/subviews/global.jsp" %>
</head>
<script>


$("#checkbox_all").clcik(function(){
	alert("hello");
});

function div(){
	alert("123");
}

</script>
<body>
<input type="checkbox" id="checkbox_all">
<div id="div" onclick="div()">123</div>
</body>
</html>