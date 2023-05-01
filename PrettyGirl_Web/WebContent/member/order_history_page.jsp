<%@page import="uuu.pg.service.OrderService"%>
<%@page import="uuu.pg.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="uuu.pg.entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>
function getOrder(OId){
	$.ajax({
		url:'<%= request.getContextPath() %>/member/order.jsp?orderId='+OId,
		method:'GET'
		}).done(getOrderDoneHandler);
}
function getOrderDoneHandler(result){
	//alert("Order.jsp");
	//console.log(result);
	$("#OrderView").html(result);
	productDetailFancybox= $.fancybox.open({
		src  : '#OrderView'
	});
}
</script>
<style>
	#orderPage{
		 font-size: 32px;
		 background-color: white;
	}
</style>
    <%
		Customer member = (Customer)session.getAttribute("member");
		List<Order> list = null;
		
		String p = request.getParameter("page");
		if(p==null){
			p="1";
		}
		
		/*
		String p = request.getParameter("page");
		if(p==null && session.getAttribute("currentpage")==null){			
			if(p==null) p = "1";
		}else if(p==null && session.getAttribute("currentpage")!=null){
			p=(String)session.getAttribute("currentpage");
		}
		*/
		if(member!=null){
			OrderService service = new OrderService();
			list = service.getOrderHistoryByCustomerIdPage(member.getId(),p);
		}
		
		/*
		session.setAttribute("currentpage", p);
		out.println(session.getAttribute("currentpage"));
	*/
	%>
	
	<% if(list!=null && list.size()>0) {%>
	<table style="width:85%;margin:0 auto; font-size: 22px;">
		<caption id="orderPage"></caption>
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
					<td><%= order.getTotalAmount() %></td>
					<td><%= order.getStatus() %></td>
					<td><a href='javascript:getOrder(<%=order.getId() %>)'>詳細內容</a></td>
				</tr>
				<% } %>
			</tbody>
	</table>
	<%}else{ %>
		<p>查無歷史訂單!</p>
		<%} %>
		
		
