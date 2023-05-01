<%@page import="uuu.pg.entity.Color"%>
<%@page import="uuu.pg.entity.Size"%>
<%@page import="java.util.Arrays"%>
<%@page import="uuu.pg.entity.Outlet"%>
<%@page import="uuu.pg.entity.Product"%>
<%@page import="uuu.pg.service.ProductService"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" >
<title>產品明細</title>
<script
  		src="https://code.jquery.com/jquery-3.0.0.js"
  		integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
  		crossorigin="anonymous"></script>
<script type="text/javascript">

var oldPic;
function smallIconclick(theSmallIcon) {
	oldPic = $("#main").attr("src"); 
	var colorPic = $(theSmallIcon).attr("data-img");
	$("#main").attr("src",colorPic);
}

/*function smallIconOut(pid) {
	$("#main").attr("src",oldPic);
}*/

</script>


</head>
<body>
	<%
		String productId = request.getParameter("productId");
		ProductService service = new ProductService();
		Product p = service.getProductById(productId);
	%>
	<article>
		<% if(p!=null) {%>
		<div style="width:75%;margin: auto;">		
			<image id="main"
				style="display:block;width:340px;margin:auto;float:left" 
				src="<%= p.getPhotoUrl() %>">
			<div style="width:45%;float:left">
				<h3><%= p.getName() %></h3>	
				<%if(p instanceof Outlet) {%>
				<p>
					定價：<%= ((Outlet)p).getListPrice() %>元
				</p>			
				<% } %>
				<p>
					優惠價：<%=p instanceof Outlet?((Outlet)p).getDiscountString()+", ":"" %><%= p.getUnitPrice() %>元
				</p>
				<hr>
					<form>						
						<% if(p.getColorsList()!=null && p.getColorsList().size()>0){%>
						
						<div name="color">
						<% if(p.getColorsList()!=null && p.getColorsList().size()>0){ %>
							<%for(Color color:p.getColorsList()){ %>
							<img class="smallcolor" src="<%= color.getColoricon() %>"
								onclick="smallIconclick(this)"
								data-img="<%=color.getPhotoUrl() %>">
							<%} %>	
						<%} %>		
						</div>
						<p>
						<label>顏色：</label>
						<select name="color" required>
							<option value="">請選擇...</option>
							<%for(Color color:p.getColorsList()){ %>
							<option value="<%=color.getColorName()%>" data-icon="<%= color.getColoricon() %>">
								<%= color.getColorName()%>
							</option>
							<%} %>
						</select>						
						</p>
						<p>
						<label>Size：</label>
						<select id="size" name="size" required>
							<option value="" >請選擇...</option>
							<%for(Size size:Size.values()){ %>
							<option value="<%=size.name()%>"
									data-stock="10">
								<%=size.name()%>
							</option>
							<%} %>
						</select>
						</p>	
						<% } %>
						<p>
							<label>數量:</label>
							<input type="number" name="quantity" min="1" max="10" required>
						</p>
						<input type="submit" value="加入購物車">
					</form>
				</p>
			</div>
			<div style="clear:both">
				<br>
				<hr>
				<p><%= p.getDescription() %></p>
			</div>		
		</div>
		<% }else{ %>
			<p>查無此產品(<%= productId %>)</p>
		<% } %>
	</article>
</body>
</html>

			<!-- 
				<p>
					作者： Ken Kousen
				</p>
				<p>
					出版社：歐萊禮
				</p>
				-->