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
	
	<article>
	
	</article>
	
<%@include file="/subviews/footer.jsp" %>

</body>
</html>