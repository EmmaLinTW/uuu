<%@page import="uuu.pg.entity.ShoppingCart"%>
<%@page import="uuu.pg.entity.OrderItem"%>
<%@page import="uuu.pg.service.OrderService"%>
<%@page import="uuu.pg.entity.Order"%>
<%@page import="uuu.pg.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>

	<%
		Customer member = (Customer)session.getAttribute("member");
		String orderId = request.getParameter("orderId");
		Order order = null;
		OrderService service = new OrderService();
		if(orderId!=null && member!=null){			
			order = service.getOrderById(orderId);
			//檢查訂單的訂購人與登入的客戶相同
			if(order!=null && !member.equals(order.getMember())){
				order = null;
			}
		}
		
	%>
	<%@include file="/subviews/global.jsp" %>
<style>

			
#orderArticle{
	 clear:both;
	 padding-top: 50px;

			}
			
#orderId{
	float:left;
	font-size: 20px;
}

#orderStatus{
	float:left;
	margin:0 5px 0 20px;
	font-size: 20px;

}
caption{
	font-size: 32px;
	margin-bottom: 30px;
	background-color: #729ff3;
    color: #fff;
    padding: 20px 0px;    
}

#cart{
	  width:85%;
	  margin: auto;
	  font-size: 22px;
	  text-align: center;
}

.productName{
	text-align: left;
}
			
</style>
	<div style="width: 1000px; margin: 200px auto;">
		<% if(order!=null) {%>
		<div>	
			<div id="orderId" >
				訂單編號: <%= order.getId() %><br>				
				付款方式: <%= order.getPaymentType() %><br>
				貨運方式: <%= order.getShippingType() %><br>
				收件人: <%= order.getRecipientName() %><br>
				email: <%= order.getRecipientEmail() %><br>
				收件地址:<%= order.getRecipientPhone() %><br>
				取件地址:<%= order.getShippingAddress() %><br>					
			</div>
			<div id="orderStatus" >
				<span class="statusSpan"> 
					新訂單
					<div style="font-size:smaller">
						<%= order.getOrderDate() %> <%= order.getOrderTime() %>
					</div>
				</span>
				
			</div>
		</div>
		<div id="orderArticle">
		
			<table id="cart">
				<caption >購物明細</caption>
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
					<% for(OrderItem item:order.getOrderItemSet()) {%>
					<tr>
						<td class="productName">
							<img style="width:100px;vertical-align: middle;"
							src="<%= item.getColor().getPhotoUrl() %>">
							<%= item.getProduct().getName() %>
						</td>
						<td><%= item.getPrice() %></td>
						<td><%= item.getColor().getColorName() %></td>
						<td><%= item.getSize() %> </td>
						<td>
								<%= item.getQuantity() %>
						</td>
						<td> <%= ShoppingCart.AMOUNT.format(item.getSubAmount()) %></td>			
					</tr>
				
					<% } %>	
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" style="text-align: right">
							共購買了<%= order.size() %>項, <%= order.getTotalQuantity() %>件產品
						</td>
						<td colspan="2" style="text-align: right">
							總金額: <span id='totalAmount'><%= ShoppingCart.AMOUNT.format(order.getTotalAmount())%></span>元
						</td>
					</tr>
				</tfoot>			
			</table>
		</div>
		<% }else{ %>
			<p>查無此訂單</p>
		<% } %>
	</div>