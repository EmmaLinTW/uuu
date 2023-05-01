<%@page import="uuu.pg.service.ProductService"%>
<%@page import="uuu.pg.entity.Customer"%>
<%@page import="uuu.pg.entity.Size"%>
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
caption{
	font-size: 32px;
	margin-bottom: 30px;
	background-color: #729ff3;
    color: #fff;
    padding: 10px 0px;    
}
	#cart,#cart th,#cart td{
		border: 1px solid #ddd; 
		padding: 8px;
		}
	#cart{
		border-collapse: collapse; 
		width: 80%;
		margin: auto;
		font-size: 22px;
	  	text-align: center;
		}
	td{
		text-align: center;
	}
	
	#productImage{
		text-align: left;
	}
	.stockShortage{
		box-shadow:red 0 0 3px;
		border: darkred 1px solid;
		padding-left: 2px
		}
	
</style>
<script>
	function checkQuantity(inputQuantity){
	    var min = parseInt($(inputQuantity).attr("min"));
	    var max = parseInt($(inputQuantity).attr("max"));
	    var quantity = parseInt($(inputQuantity).val());
	    if(quantity<min || quantity>max){
	        $(inputQuantity).addClass("stockShortage");
	    }else{
	        $(inputQuantity).removeClass("stockShortage");
	    }                
	}
</script>
</head>
<body>
	<jsp:include page="/subviews/header.jsp" >
		<jsp:param value="購物車" name="subtitle"/>		
	</jsp:include>
	<article>

	<%
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		ProductService service = new ProductService();
		if(cart!=null && cart.size()>0){		
			Customer member = (Customer)session.getAttribute("member");
			if(member!=null){
				cart.setMember(member);
			}
	%>
		<form action="update_cart.do" method="POST">
			<table id="cart">
				<caption>購物明細</caption>
				<thead>
					<tr>
						<th>商品名稱</td>
						<th>原價</th>
						<th>折扣</th>
						<th>售價</th>
						<th>顏色</th>
						<th>尺寸</th>
						<th>數量</th>					
						<th>小計</th>					
						<th>刪除</th>					
					</tr>
				</thead>
				<tbody>
					<% for(CartItem item:cart.getCartItemSet()) {
						Product p = item.getProduct();
						Color color = item.getColor();
						Size size = item.getSize();
						int stock = service.getRealTimeStock(p.getId(), color, size);
						%>
					<tr>
						<td id="productImage">
							<img style="width:80px;vertical-align: middle;"
							src="<%= color==null || color.getPhotoUrl()==null?
									p.getPhotoUrl():color.getPhotoUrl() %>">
							<%= p.getName() %>
						</td>
						<td><%= ShoppingCart.PRICE.format(cart.getListPrice(item)) %></td>
						<td><%= cart.getDiscountString(item) %></td>
						<td><%= ShoppingCart.PRICE.format(p.getSizePrice(size)) %></td>
						<td><%= color!=null?color.getColorName():"" %></td>
						<td><%= size!=null?size.name():"" %> </td>
						<td>
							<input style="width:3em"
								type="number" 
								<%= stock<cart.getQuantity(item)?"class='stockShortage'":""%> 
								onchange="checkQuantity(this)"
								name="quantity<%= item.hashCode() %>" 
								min="<%=stock>0?1:0 %>" max="<%=stock>10?10:stock %>"
								value="<%= cart.getQuantity(item) %>">
						</td>
						<td><%= ShoppingCart.AMOUNT.format(cart.getSubAmount(item)) %></td>
						<td>
							<input type="checkbox" name="delete<%= item.hashCode() %>">
						</td>				
					</tr>
					<% } %>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6" style="text-align: right">
							共購買了<%= cart.size() %>項, <%= cart.getTotalQuantity() %>件產品
						</td>
						<td colspan="3">
							總金額: <%= ShoppingCart.AMOUNT.format(cart.getTotalAmount()) %>元
						</td>
					</tr>
					<tr>
						<td colspan="9" style="text-align: right">
							<input type="submit" value="修改購物車" name="submit">
							<input type="submit" value="我要結帳" name="submit">
						</td>
					</tr>
				</tfoot>			
			</table>
		</form>
		<%}else{ %>
			<p>購物車是空到，回到<a href="<%= request.getContextPath() %>/products_list.jsp">賣場</a></p>
		<% } %>
	</article>
<%@include file="/subviews/footer.jsp" %>

</body>
</html>