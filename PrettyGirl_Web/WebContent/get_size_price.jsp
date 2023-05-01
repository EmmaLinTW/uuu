<%@page import="uuu.pg.entity.Size"%>
<%@page import="uuu.pg.entity.Outlet"%>
<%@page import="uuu.pg.entity.Product"%>
<%@page import="uuu.pg.service.ProductService"%>
<%@ page pageEncoding="UTF-8"%>


	<%
	String productId = request.getParameter("productId");
	String sizeName=request.getParameter("sizeName");
	Size size = Size.valueOf(sizeName);
	
	ProductService service = new ProductService();
	
	Product p = service.getProductByIdWithSizePrice(productId);
	
	
%>
	
	
	<%if(p instanceof Outlet) {%>
					<p id="ListPrice">
						NT：<%= ((Outlet)p).getSzieListPrice(size) %>元
					</p>			
					<% } %>
					<p id="price">
						優惠價：<%=p instanceof Outlet?((Outlet)p).getDiscountString()+", ":"" %><%= p.getSizePrice(size) %>元
					</p>
					
					
					