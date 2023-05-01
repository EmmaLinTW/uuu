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
<%@include file="/subviews/global.jsp" %>
<script>
var oldPic;
function smallIconclick(theSmallIcon) {
	oldPic = $("#main").attr("src"); 
	var colorPic = $(theSmallIcon).attr("data-img");
	$("#main").attr("src",colorPic);
	showcolorname(theSmallIcon);
	changeColorVal(theSmallIcon);
	getSizeStock();
		
}

function getSizeStock(){
	var productId = $("#productId").val();
	var color = $("#colorVal").val();
	//alert("Hello:" + productId +","+ color);
//	if(color.length>0){
		$.ajax({
			url: "<%= request.getContextPath()%>/get_size_stock.jsp?productId=" 
						+ productId + "&color="+color,
			method: 'GET'
		}).done(getSizeStockDoneHandler);
//	}else{
//		if($("#size")){
//			$("#size").empty();
//		}else{
//			$("#sizeDiv").html("請先選擇要購買的顏色");
//		}
//	}
}
function getSizeStockDoneHandler(result) {
	//alert(result);
	$("#sizeDiv").html(result);
}

function showcolorname(theSmallIcon){
	var colorName = $(theSmallIcon).attr("data-colorName");
	$("#colorName").text(colorName);
}
function changeColorVal(theSmallIcon){
	var colorName = $(theSmallIcon).attr("data-colorName");
	$("#colorVal").val(colorName);
}
function colorSelected(theSpan){
	$(".color-btn").removeClass("color-btn-on");
	$(theSpan).toggleClass("color-btn-on");
}
function changeSizeNameVal(theSize){
	var sizeName = $(theSize).attr("data-sizeName");
	$("#sizeVal").val(sizeName);
	
	sizeSelected(theSize);
	
	stock = parseInt($(theSize).attr("data-stock"));	
	
	if(stock>0){
		$("#quantity option").remove();
		for(i=1;i<=stock;i++){
			var element = "<option value='"+i+"'>"+i+"</option>";
			$("#quantity").append(element);
		}
	}else{
		//$("#quantity").prop("disabled", true);
		$("#quantity option").remove();
		var element = "<option value=''>無庫存</option>";
		$("#quantity").append(element);
	}
	
	getSizePrice(theSize);
}
function getSizePrice(theSize){
	var productId = $("#productId").val();
	var sizeName = $(theSize).attr("data-sizeName");
	$.ajax({
		url: "<%= request.getContextPath()%>/get_size_price.jsp?productId=" 
					+ productId + "&sizeName="+sizeName,
		method: 'GET'
	}).done(getSizePriceDoneHandler);
}function getSizePriceDoneHandler(result) {
	//alert(result);
	$("#getSizePrice").html(result);
}



function sizeSelected(theSize){
	$(".size-btn").removeClass("size-btn-on");
	$(theSize).toggleClass("size-btn-on");
}

function addCartAjax(){
	//保留同步請求			
	//return true;
	
	//改成非同步請求
	var url = $("#buyForm").attr("action").replace(".do",".ajax");		
	$.ajax({
		url:url,
		method:$("#buyForm").attr("method"),
		data:$("#buyForm").serialize()
	}).done(addCartAjaxDoneHandler);
	return false;
}

function addCartAjaxDoneHandler(result){
	$("#smallCart").html(result);
	alert("已經將產品加入購物車");
	//productDetailFancybox.close();
	//productDetailFancybox=null;
	//$.fancybox.close();
}

</script>

<style>

.smallcolor{
	width: 25px;
	vertical-align: sub;
}
.color-btn {
	margin: auto;
   	cursor: pointer;
  	border: 1px solid #e0e0e0;
   	display: inline-block;
 	padding: 3px;
 	
}
.color-btn-on {
	margin: auto;
   	cursor: pointer;
  	
   	display: inline-block;
 	padding: 3px;
    border: 1px solid black;
}
.size-btn {
    padding: 0 2px;
    min-width: 33px;
    height: 25px;
    line-height: 25px;
    border: 1px solid #535353;
    text-align: center;
    display: inline-block;
    margin: 0 15px 15px 0;
    font-size: 16px;
    cursor: pointer;
    
    
}
.size-btn-on {
    padding: 0 2px;
    min-width: 33px;
    height: 25px;
    line-height: 25px;
    border: 1px solid #535353;
    text-align: center;
    display: inline-block;
    margin: 0 15px 15px 0;
    font-size: 16px;
    cursor: pointer;
    background: #535353;
    color: #fff;
}

.size-btn-zero {
    color: #dfdfdf;
    padding: 0 2px;
    min-width: 33px;
    height: 25px;
    line-height: 25px;
    border: 1px solid #535353;
    text-align: center;
    display: inline-block;
    margin: 0 15px 15px 0;
    font-size: 16px;
    cursor: pointer;
    background-color: silver;
}

#ListPrice{
	text-decoration:line-through;	
}

#price{
	color: red;
	font-size: 20px
}
#colorP{
	font-size: 20px;
}
#colorName{
	color: darkred;
}
#desDiv{
	margin: 30px;
}
#descriptionP{
	font-size: 20px;
}
</style>

</head>
<body>
<jsp:include page="/subviews/header.jsp" />
	<%
		String productId = request.getParameter("productId");
		ProductService service = new ProductService();
		Product p = service.getProductByIdWithSizePrice(productId);
	%>
	<article>
		<% if(p!=null) {%>
		<div style="width:75%;margin: auto;">	
		
			<image id="main"
				style="display:block;width:340px;margin:auto;float:left; padding:8px;" 
				src="<%= p.getPhotoUrl() %>">
			<div style="width:45%;float:left;margin:auto;">
				<h2><%= p.getName() %></h2>	
				<div id="getSizePrice">
						<%if(p instanceof Outlet) {%>
					<p id="ListPrice">
						NT：<%= ((Outlet)p).getListPrice() %>元
					</p>			
					<% } %>
					<p id="price">
						優惠價：<%=p instanceof Outlet?((Outlet)p).getDiscountString()+", ":"" %><%= p.getUnitPrice() %>元
					</p>
				</div>
				<hr>
					<form id="buyForm" action="<%= request.getContextPath()%>/add_cart.do" method="POST"
						onsubmit="return (addCartAjax());">						
						<input type="hidden" id="productId" name="productId" value="<%= p.getId()%>">
						<% if(p.getColorsList()!=null && p.getColorsList().size()>0){%>
						<p id="colorP"><span>顏色:</span><span id="colorName">請選擇顏色</span></p>
						<%for(Color color:p.getColorsList()){ %>
						<span  class="color-btn" onclick="colorSelected(this)">
							<img id="color" class="smallcolor" src="<%= color.getColoricon() %>"
								onclick="smallIconclick(this);"
								data-img="<%=color.getPhotoUrl() %>"
								data-colorName="<%= color.getColorName()%>">
						</span>
						<%} %>
						<input id=colorVal name="color" type="hidden" value="" placeholder="colorname">	
					
						<p>尺寸</p>
						<div id="sizeDiv"></div>
						
						
						<input id=sizeVal name="size" type="hidden" value="" placeholder="sizename">
						<p>
							<label>數量:</label>
							<select id="quantity" name="quantity" required style="width:5em">
								<option value="">size</option>							
							</select>
							
						</p>
						<% } %>
						<input type="submit" value="加入購物車">
						
					</form>
				</p>
			
			</div>	
			<div style="clear:both">
				<br>
				<hr>
				<div id="desDiv">
					<p id="descriptionP"><%= p.getDescription() %></p>
				</div>
				
				
				
				
					<%for(int i=1;i<7;i++){
						if(p.getProductphotos().getPhoto(i)!=null){	
					%>
					<img src="<%= p.getProductphotos().getPhoto(i) %>">
					<%}else{ %>
					<img src="" dispaly="none;">
					<%} %>
				<% } %>
				
			</div>		
		</div>
		<% }else{ %>
			<p>查無此產品(<%= productId %>)</p>
		<% } %>
	</article>
	<%@include file="/subviews/footer.jsp" %>
</body>
</html>
