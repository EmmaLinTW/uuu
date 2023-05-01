<%@page import="uuu.pg.entity.Outlet"%>
<%@page import="uuu.pg.entity.Color"%>
<%@page import="uuu.pg.entity.Product"%>
<%@page import="uuu.pg.entity.CartItem"%>
<%@page import="uuu.pg.entity.ShoppingCart"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" >
<title>購物車</title>
<%@include file="/subviews/global.jsp" %>
<style>
	#cart,#cart th,#cart td{border: 1px solid #ddd; padding: 8px;}
	#cart{border-collapse: collapse; width: 80%;margin: auto;}
</style>
</head>
<body>
	<jsp:include page="/subviews/header.jsp" >
		<jsp:param value="購物車" name="subtitle"/>		
	</jsp:include>
	<article>
	${sessionScope.cart}
	<%
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		if(cart!=null && cart.size()>0){
	
	%>
		<form action="" method="GET">
			<table id="cart">
				
				<thead>
					<tr>
						<th>名稱</td>
						<th>原價</th>
						<th>折扣</th>
						<th>售價</th>
						<th>顏色</th>
						<th>數量</th>					
					</tr>
				</thead>
				<caption>購物明細</caption>
				<tbody>
					<% for(CartItem item:cart.getCartItemSet()) {
						Product p = item.getProduct();
						Color color = item.getColor();%>
					<tr>
						<td>
							<img 
							src="<%= item.getColor()==null || item.getColor().getPhotoUrl()==null?
								item.getProduct().getPhotoUrl():item.getColor().getPhotoUrl() %>" style="width:60px;vertical-align: middle;">
							<%= item.getProduct().getName() %>
						</td>
						<td><%= p instanceof Outlet? ((Outlet)p).getListPrice():p.getUnitPrice() %></td>
						<td><%= p instanceof Outlet? ((Outlet)p).getDiscount():"" %></td>
						<td><%= p.getUnitPrice() %></td>
						<td><%= color!=null?color.getColorName():"" %></td>
						<td>
							<input type="number" name="quantity" value="<%= cart.getQuantity(item) %>">
						</td>				
					</tr>
					<% } %>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3" style="text-align: right">
							共購買了<%= cart.size() %>項, <%= cart.getTotalQuantity() %>件產品
						</td>
						<td colspan="3">
							總金額: <%= cart.getTotalAmount() %>元
						</td>
					</tr>
					<tr>
						<td colspan="6"><input type="submit" value="修改購物車"></td>
					</tr>
				</tfoot>			
			</table>
		</form>
		<%}else{ %>
			<p>購物車是空到，回到<a href="/products_list.jsp">賣場</a></p>
		<% } %>
	</article>
<%@include file="/subviews/footer.jsp" %>

</body>
</html>