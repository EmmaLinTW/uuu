
<%@page import="uuu.pg.service.ProductService"%>
<%@page import="uuu.pg.entity.Color"%>
<%@page import="uuu.pg.entity.Outlet"%>
<%@page import="uuu.pg.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="uuu.pg.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name='viewport' content="width=device-width, initial-scale=1" >
	<!--  <meta http-equiv="refresh" content ="15; url=<%=request.getContextPath() %>" />-->
	<link >
	<title>首頁</title>
 	<%@include file="/subviews/global.jsp" %>
 		<style>
	
		#product_list_ul{
			width: 70%;
			margin: auto;
		}
	
		#product_list_li{
			display: inline-table;
			width:180px;
			padding:5px;
			/*box-shadow: gray 2px 2px 3px;*/
			/*height:300px;*/
			vertical-align: top;
			height:485px
			
			}
			
		.smallcolor{
			width: 25px;
			margin: 5px;
			border: 1.5px solid gray;
			border-style: outset;
		}
		
		.none{
			display:none;
			float:right;
		}
		
		#product_list_li:hover .none{
			display: block;
		}
		
		.discount{
			color: red;
			font-size: 18px;
		}
		.size span{
			font-size:small;
			border: 1px solid gray;
			margin: 2px;
		}
		.list_listPrice{
		text-decoration:line-through;
		font-size: 16px;
		}
		#hotItemLogo{
		width:300px;
		margin-top: 50px;
	margin-bottom: 50px;
		}
	</style>
		<%
			ProductService service = new ProductService();
			List<Product> list = null;
				list = service.getHotItemsTop6();
		%>
	<script type="text/javascript">
	/*
	$(function () {
        var oldColor = "";
        $("#studentTable tbody tr").mouseover(function () {
            oldColor = $(this).css("background-color");
	    $(this).css("background-color","#d9e8fb");
        }).mouseout(function () {
            $(this).css("background-color",oldColor);
        });
    });
	*/
		var oldPic;
		function smallIconEnter(theSmallIcon, pid) {
			oldPic = $("#main"+pid).attr("src"); 
    		var colorPic = $(theSmallIcon).attr("data-img");
    		$("#main"+pid).attr("src",colorPic);
    	}
		
		function smallIconOut(pid) {
			$("#main"+pid).attr("src",oldPic);
    	}
		
		
		
		function getdressImg(img){
			$(img).attr("src", "image/dress.png");
			//$(img).remove();
		}
	</script>
</head>
<body>
	<jsp:include page="/subviews/header.jsp" />
	<article>
		<p>
			<img src="https://obcdn4.obdesign.com.tw/OB_Images/117650/16887/acf2d20f-a7da-4c68-ac7e-06706e2a66c3.jpg">
		</p>
		<P style="text-align: center;">
			<img id="hotItemLogo" src="/pg/image/bestSale.png">
			<div>
				<% if(list!=null && list.size()>0) {%>
				<ul id="product_list_ul">
					<% 
						for(int i=0;i<list.size();i++) {
							Product p = list.get(i);
					%>
					<li id="product_list_li">
						<a href="product.jsp?productId=<%=p.getId() %>">					
						<image id="main<%= p.getId()%>" style="display:block;width:180px;margin:auto"
							src="<%= p.getPhotoUrl() %>" onerror="getdressImg(this)" >
						</a>	
						<div >
							<h2 style="clear:both"><%= p.getName() %></h2>
							<div style="float:left;">												
								<div <%=p instanceof Outlet?"class='list_listPrice'":"" %>>定價: NT$ <%=p instanceof Outlet?((Outlet)p).getListPrice():p.getUnitPrice()%>元</div>
								<%if(p instanceof Outlet){ %>
								<div class="discount"><%=((Outlet)p).getDiscountString() %>: NT$ <%=p.getUnitPrice() %> 元</div>
								<%} %>
							</div>
							<!-- color size -->
													
								<!-- colorDiv -->
								<div  class="none" >
								<% if(p.getColorsList()!=null && p.getColorsList().size()>0){ %>
									<%for(Color color:p.getColorsList()){ %>
									<img class="smallcolor" src="<%= color.getColoricon() %>"
											onmouseenter="smallIconEnter(this, <%=p.getId() %>)"
											onmouseout="smallIconOut(<%=p.getId() %>)"
											data-img="<%=color.getPhotoUrl() %>">
									<%} %>	
								<%} %>		
								
									
							</div>
						</div>
					</li>		
					<%} %>	
				</ul>
				<%}else{ %>
					<p></p>
				<%} %>
			</div>
		</P>		
	</article>	
	<%@include file="/subviews/footer.jsp" %>
</body>
</html>