<%@page import="uuu.pg.entity.Size"%>
<%@page import="java.util.Map"%>
<%@page import="uuu.pg.service.ProductService"%>
<%@ page pageEncoding="UTF-8"%>


<%
	String productId = request.getParameter("productId");
	String color=request.getParameter("color");

	ProductService service = new ProductService();
	Map<Size, Integer> map = service.getProductColorSizeStockMap(productId, color);
	if(map!=null && map.size()>0){
%>
	<%	for(Size size:map.keySet()) {%>
		<span id"="size" class="size-btn"
			data-sizeName="<%=size.name()%>"
			data-stock="<%= map.get(size) %>"
			onclick="changeSizeNameVal(this)">
			<%=size.name()%>
		</span>
		<%}%>
<%}%>