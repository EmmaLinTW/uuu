<%@page import="uuu.pg.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
	<!--header.jsp -->
	<script>
	$(document).ready(init);
	function init()
	{
		$(window).scroll(scrollHandler);
		scrollHandler();
	}
	function scrollHandler(){
		var scrollTop = $(window).scrollTop();
		//$("#myMenu").text(scrollTop+" / "+(100-scrollTop));
		if(scrollTop<=88){
			$("#navbar").css({top:(88-scrollTop)+"px"});
		}else{
			$("#navbar").css({top:"0px"});
		}
	}
	function getLoginAndRegisterView(){
		//同步GET請求
		<%--
			location.href="<%= request.getContextPath() %>/login_and_register.jsp";
		--%>
		//非同步GET請求
		$.ajax({
			url:'<%= request.getContextPath() %>/login_and_register.jsp',
			method:'GET'
			}).done(getLoginAndRegisterViewDoneHandler);
		}
			
	function getLoginAndRegisterViewDoneHandler(result){
		//alert("Done"+result);
			$("#loginAndRegisterView").html(result);
		//用fancybox來呈現login/Register畫面
			$.fancybox.open({
				src  : '#loginAndRegisterView',
			});
		}
			
	function LoginAjax(){
		var url = $("#LoginFrom").attr("action").replace(".do",".ajax");		
		$.ajax({
			url:url,
			method:$("#LoginFrom").attr("method"),
			data:$("#LoginFrom").serialize()
		}).done(addLoginAjaxDoneHandler);
		return false;
	}
	
	function addLoginAjaxDoneHandler(result){
		//alert(result.status);
		
		//console.log(result);
		if(result.status=="success"){
			location.href=result.url;
		}else{
			$("#loginAndRegisterView").html(result);
			$.fancybox.open({
				src  : '#loginAndRegisterView',
			});			
		}
	}
	
	function RegisterAjax(){
		var url = $("#registerForm").attr("action").replace(".do",".ajax");		
		$.ajax({
			url:url,
			method:$("#registerForm").attr("method"),
			data:$("#registerForm").serialize()
		}).done(RegisterAjaxDoneHandler);
		return false;
	}
	function RegisterAjaxDoneHandler(result){
		//alert(result.status);
		//alert(result);
		//console.log(result);
		//if(result.status=="success"){
		//	location.href=result.url;
		//}else{
			$("#loginAndRegisterView").html(result);
			loginFancyBox=$.fancybox.open({
				src  : '#loginAndRegisterView',
			});			
	//	}
	}
	</script>
	<header>	
			<a href="<%= request.getContextPath() %>" >
				<img class="Logo" src="/pg/image/Pglogo-100-this.png">
			</a>
	</header>
	<div id="loginAndRegisterView"></div>
	<%Customer member = (Customer)session.getAttribute("member");%>
	
	<div id="navbar">	
		<ul class="drop-down-menu">
			<li>
				<a id="logo_a" href="<%= request.getContextPath() %>" >
					<img class="navLogo" style="height: 40px;" src="/pg/image/LogoIcon.jpg">
				</a>	
			</li>
			<%-- <li><a href="<%= request.getContextPath() %>/products_list.jsp">熱門商品</a></li>--%>
			<li><a  href="<%= request.getContextPath() %>/products_list.jsp?category=上身">上身類</a> 
		    	<ul>
		    		<li><a href="<%= request.getContextPath() %>/products_list.jsp?type=襯衫">襯衫</a></li>
		    		<li><a href="<%= request.getContextPath() %>/products_list.jsp?type=T-shirt">T-shirt</a></li>
		    	</ul>
		    </li>
			<li><a  href="<%= request.getContextPath() %>/products_list.jsp?category=洋裝">洋裝</a> 
		    	<ul>
		    		<li><a href="<%= request.getContextPath() %>/products_list.jsp?type=長袖洋裝">長袖洋裝</a></li>
		    		<li><a href="<%= request.getContextPath() %>/products_list.jsp?type=短袖洋裝">短袖洋裝</a></li>
		    	</ul>
		    </li>
			<li><a href="<%= request.getContextPath() %>/products_list.jsp?category=下身">下身類</a>
		    	<ul>
		    		<li><a href="<%= request.getContextPath() %>/products_list.jsp?type=裙類">裙類</a></li>
		    		<li><a href="<%= request.getContextPath() %>/products_list.jsp?type=褲類">褲類</a></li>
		    	</ul>
		    </li>
		    <li><a href="<%= request.getContextPath() %>/products_list.jsp?category=外套">外套</a>
		    	<ul>
		    		<li><a href="<%= request.getContextPath() %>/products_list.jsp?type=西裝外套">大衣/西裝外套</a></li>
		    		<li><a href="<%= request.getContextPath() %>/products_list.jsp?type=風衣">風衣/夾克</a></li>
		    		<li><a href="<%= request.getContextPath() %>/products_list.jsp?type=連帽外套">連帽外套</a></li>
		    	</ul>
		    </li>
		    <%-- 	
		    <% if(member==null) { //尚未登入%>
		    <%}else{ //已經登入%>
		    <li><a href="<%= request.getContextPath() %>/member/order_history.jsp">歷史訂單</a></li>
		    <% } %>
		    --%>
		</ul>	
		    <form action="<%= request.getContextPath()%>/products_list.jsp" method="GET" style="float:right; margin-right: 8px;">
				<input id="search_input" type="search" name="search" placeholder="輸入關鍵字">
				<input id="search_btn" type="image" src="<%= request.getContextPath()%>/image/search_clothes.png" alt="Submit">
			</form>
			<div class="iconDiv" style="padding-right: 5px;">
		    	<a class="icon_a" style="padding-right:16px; line-height: 0px;"
		    	href="<%= request.getContextPath() %>/member/cart.jsp">
			    	<img class="icon" title="購物車"
			    		src="<%= request.getContextPath() %>/image/shopping_cart.png">
			    	<span id="smallCart"><%@include file="/small_cart.jsp"%></span>
			    </a>
	    	</div>
			<% if(member==null) { //尚未登入%>
				<div class="iconDiv">
					<a class="icon_a" style="padding:0px; line-height: 0px;"
						href="javascript:getLoginAndRegisterView()">
						<img class="icon" style="padding-top: 2px;" title="會員登入/註冊"
		    				src="<%= request.getContextPath() %>/image/login.png">
					</a> 
				</div>
			<%}else{ //已經登入%>
				<div class="iconDiv">
					<a class="icon_a" style="padding:0px; line-height: 0px;padding-top: 2px;"
						href="<%= request.getContextPath() %>/member/center.jsp">
						<img class="icon" style="padding-top: 2px;" title="會員中心"
		    				src="<%= request.getContextPath() %>/image/login.png">
					</a> 
				</div>
				 <div class="iconDiv">
				    <a class="icon_a" style="padding:0px; line-height: 0px;"
				    	href="javascript:logout()">
				    	<img class="icon" style="width: 30px;padding-top: 6px;" title="登出"
				    		src="<%= request.getContextPath() %>/image/logout.png">
			   		 </a>
	    		</div>
			<% } %>
	</div>