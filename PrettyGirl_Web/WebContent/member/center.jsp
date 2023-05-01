<%@page import="uuu.pg.entity.Order"%>
<%@page import="uuu.pg.entity.Customer"%>
<%@page import="uuu.pg.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員中心</title>

<%@include file="/subviews/global.jsp" %>
<style>
#mcenterh{
	text-align: center;
	padding-top: 60px;
	font-size: 46px;
}

.btn{
    padding-left: 28px;
    color: #666666;
    cursor: pointer;
    font-size: 18px;
    border-bottom: 1px solid rgb(51, 58, 51);
    font-weight: bold;
    background-color: ;
    font-size: 32px;
}

.slideDown{
	display: none;
}

table, th, td
  {
  border: 1px solid #ddd;
  border-collapse: collapse;
  }

.pagination {
  display: inline-block;
  margin-top: 20px;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.pagination a:first-child {
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
}

.pagination a:last-child {
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
}
#getHistoryView{
	margin-top: 30px;
}
</style>
			
<%--
	String currentpage = (String)session.getAttribute("currentpage");
	if(currentpage==null){
		currentpage = "1";
	}
--%>


<script>

<%--var currentpage=<%=currentpage%>;--%>
function showTestJsp(){
	//alert("test");
	$.ajax({
		url:'<%= request.getContextPath() %>/mCenterTest.jsp',
		method:'GET'
	}).done(getTestViwHandler);
}
function getTestViwHandler(result){
	//alert(result);
	$('#TestView').html(result);
	$("#TestViewST").slideToggle("slow");
}

$(document).ready(ShowOrderHistory());

function ShowOrderHistory(){
	$.ajax({
		url:'<%= request.getContextPath()%>/member/order_history_page.jsp',
		method:'GET'
	}).done(getHistoryHandler);
}
function getHistoryHandler(result){
	//alert(result);
	$('#getHistoryView').html(result);
	$("#page"+1).addClass("active");
	<%--
	$(".pageBtn").removeClass("active");
	$("#page"+<%=currentpage%>).addClass("active");
	--%>
}

function Slide(btn){
	$(btn).next().slideToggle("slow");
	
}

function getPage(page, pageNum){
	$.ajax({
		url:"<%= request.getContextPath() %>/member/order_history_page.jsp?page="+pageNum,
		method:'GET'
	}).done(getPageDoneHandler);
	
}

function getPageDoneHandler(result){
	//alert(result);
	$('#getHistoryView').html(result);
}

function activePage(pageBtn, pageNum){
	$(".pageBtn").removeClass("active");
	$("#page"+pageNum).addClass("active");
}

</script>
</head>
		<% 
			Customer member = (Customer)session.getAttribute("member");
			OrderService service = new OrderService();
			double row = service.getOrderHistoryRowByCustomerId(member.getId());
			int p = (int)Math.ceil(row/(double)5);
			
		%>
<body>
<jsp:include page="/subviews/header.jsp" >
		<jsp:param value="購物車" name="subtitle"/>		
	</jsp:include>
	<article>
<div id="OrderView"></div>
<h1 id="mcenterh">會員中心</h1>
<ul>
	<li>
		<div class="btn" onclick="Slide(this)">會員資料</div>
		<div class="slideDown" id="TestViewST">
			<div id="TestView"></div>
				<div>test test test test<hr></div>
		
		</div>	
	</li>
	
	<li><div class="btn">密碼變更</div></li>
	
	<li>
		<div class="btn" onclick="Slide(this)">歷史訂單</div>
		<div class="slideDown" id="getHViewST">
			<div id="getHistoryView"></div>
				<div class="pagination">
				<%for(int i=1;i<=p;i++){ %>
				  <a id="page<%=i %>" class="pageBtn" 
				  href="javascript:getPage(this,<%=i %>)" data-page="<%= i %>" 
				  onclick="activePage(this, <%= i %>)">
				 	 <%= i %>
				  </a>
				 <% }%>
			</div>
			
			<hr>
		</div>
	</li>
</ul>
<tbody>
	<tr></tr>

</tbody>
</article>
<%@include file="/subviews/footer.jsp" %>
</body>
</html>