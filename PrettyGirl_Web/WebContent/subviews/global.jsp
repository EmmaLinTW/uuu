<%@ page pageEncoding="UTF-8"%>
	<link href="<%=request.getContextPath() %>/style/pg.css" rel="stylesheet" type="text/css" >	
	<link href="<%=request.getContextPath()%>/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" >
	<link rel="icon" href="/pg/image/LogoSmallIcon2.ico" type="image/x-icon" />
	<script
  		src="https://code.jquery.com/jquery-3.0.0.js"
  		integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
  		crossorigin="anonymous">
	</script>
	<script src="<%=request.getContextPath()%>/fancybox/jquery.fancybox.js"></script>
	<script>
		function logout(){
			var rtn = confirm("確定要登出嗎?");
			if(rtn){
				location.href="<%= request.getContextPath() %>/logout.do";
			}
		}
	</script> 