<%@page import="uuu.pg.entity.Order"%>
<%@page import="uuu.pg.entity.OrderItem"%>
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
	#orderStatus{
	float:left;
	margin:0 5px 0 20px;
	font-size: 20px;
	}
	#orderId{
	float:left;
	font-size: 20px;
	}
	#recipient input{
		width:75%
		}
	#productImage{
		text-align: left;
	}
	#checkOutProductName{
		text-align: left;
	}
</style>
</head>
<body>
	<jsp:include page="/subviews/header.jsp" >
		<jsp:param value="結帳" name="subtitle"/>		
	</jsp:include>
	<article>
		<%
		Order order = (Order)session.getAttribute("order");		
		if(order!=null){	%>	
		<div>	
			<div id="orderId">
				訂單編號: <%= order.getId() %><br>				
				付款方式: <%= order.getPaymentType().getDescription() %><br>
				貨運方式: <%= order.getShippingType() %><br>
				收件人: <%= order.getRecipientName() %><br>
				email: <%= order.getRecipientEmail() %><br> 
				收件地址:<%= order.getRecipientPhone() %><br>
				取件地址:<%= order.getShippingAddress() %><br>				
			</div>
			<div id="orderStatus">
				<div class="statusSpan" title="後5碼: 12345,銀行: 橫溢銀行, 金額: 1580"> 
					新訂單
					<div style="font-size:smaller">(<%= order.getOrderDate() %> <%= order.getOrderTime().getHour()%>:<%=order.getOrderTime().getMinute() %>)</div>
				</div>
			</div>
		</div>
		<div id="orderArticle">
			<table id="cart">
				<caption>訂購明細</caption>
				<thead>
					<tr>
						<th>商品名稱</td>
						<th>售價</th>
						<th>顏色</th>
						<th>尺寸</th>
						<th>數量</th>
						<th>小計</th>
					</tr>
				</thead>
				<tbody>
					<% for(OrderItem item:order.getOrderItemSet()){%>
					<tr>
						<td id="checkOutProductName">
							<img style="width:80px;vertical-align: middle;"
							src="<%= item.getProduct().getPhotoUrl()%>">
							<%= item.getProduct().getName() %>
						</td>
						<td><%= item.getPrice() %></td>
						<td><%= item.getColor()!=null?item.getColor().getColorName():""%></td>
						<td><%= item.getSize() %></td>
						<td><%=item.getQuantity() %></td>
						<td><%=ShoppingCart.AMOUNT.format(item.getSubAmount())%></td>
					</tr>
					<%}%>
					
					
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4" style="text-align: right">
							共購買了<%= order.getOrderItemSet().size() %>項, <%= order.getTotalQuantity() %>件產品
						</td>
						<td colspan="2" style="text-align: right">
							總金額: <span id='totalAmount'><%=ShoppingCart.AMOUNT.format(order.getTotalAmount()) %></span>元
						</td>
					</tr>
				</tfoot>			
			</table>
		</div>
		<%}else{ %>
				<h1>操作程序錯誤</h1>
			<%} %>
	</article>
<%@include file="/subviews/footer.jsp" %>

</body>
</html>