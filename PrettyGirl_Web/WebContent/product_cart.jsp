<%@page import="uuu.pg.entity.Color"%>
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
			<image style="display:block;width:340px;margin:auto;float:left" 
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
				
				<p>
					庫存：<%= p.getStock() %>
				</p>
				<p>
					<form action="<%= request.getContextPath() %>/add_cart.do" method="POST">
						<input type="hidden" name="productId" value="<%= p.getId()%>">
						<% if(p.getColorsList()!=null && p.getColorsList().size()>0){ %>						
						<p>
						<label>顏色：</label>
						<select id="color" name="color" required>
							<option value="" >請選擇...</option>
							<%for(Color color:p.getColorsList()){ %>
							<option value="<%=color.getColorName() %>" 
									data-photo="<%= color.getPhotoUrl() %>" 
									data-stock="<%= color.getStock()%>">
								<%=color.getColorName() %>
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