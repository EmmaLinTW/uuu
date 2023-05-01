<%@page import="uuu.pg.entity.ShoppingCart"%>
<%@page import="uuu.pg.service.OrderService"%>
<%@page import="uuu.pg.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="uuu.pg.entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




    <%
		Customer member = (Customer)session.getAttribute("member");
		List<Order> list = null;
		if(member!=null){
			OrderService service = new OrderService();
			list = service.getOrderHistoryByCustomerIdPage(member.getId(),"0");
		}
		
		
	%>
	
	<% if(list!=null && list.size()>0) {%>
	<table style="width:85%;margin:0 auto">
		<caption>歷史訂單</caption>
			<thead>
				<tr>
					<th>訂單編號</th><th>日期時間</th><th>付款方式</th>
					<th>貨運方式</th><th>總金額</th><th>處理狀態</th><th>詳細內容</th>
				</tr>
			</thead>
			<tbody>
				<% for(Order order:list) {%>
				<tr>
					<td><%=order.getId() %></td>
					<td><%= order.getOrderDate() %> <%= order.getOrderTime() %></td>
					<td><%= order.getPaymentType() %></td>
					<td><%= order.getShippingType() %></td>
					<td><%= ShoppingCart.AMOUNT.format(order.getTotalAmount()) %></td>
					<td><%= order.getStatus() %></td>
					<td><a href='order.jsp?orderId=<%=order.getId() %>'>詳細內容</a></td>
				</tr>
				<% } %>
			</tbody>
	</table>
	<%}else{ %>
		<p>查無歷史訂單!</p>
		<%} %>
		
		<hr>
