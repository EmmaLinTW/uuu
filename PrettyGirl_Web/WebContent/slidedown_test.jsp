<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<%@include file="/subviews/global.jsp" %>
<style>
h3{
	text-align: center;
}
.btn{
    padding-left: 28px;
    color: #666666;
    cursor: pointer;
    font-size: 18px;
    border-bottom: 1px solid rgb(51, 58, 51);
    font-weight: bold;
}

.slidDown{
	display: none;
}

table, th, td
  {
  border: 1px solid blue;
  }

</style>
<script>
function show(btn){
	$(".slideDown").slideToggle("slow");
	
}

</script>
</head>
<body>

<h3>會員中心</h3>
<ul>
	<li>
		<div class="btn" onclick="show(this)">會員資料</div>
		<div class="slideDown">
			<div style="float:left">
				訂單編號: 1<br>				
				付款方式: 門市付款, 貨運方式: 門市取貨<br>
				收件人: 張三豐, test01@uuu.com.tw, 0987654321<br>
				取件地址:null<br>					
			</div>
			<div style="float:left;margin:0 5px 0 20px;">
				<span class="statusSpan"> 
					新訂單
					<div style="font-size:smaller">
						2019-12-13 18:13:45
					</div>
				</span>
				
			</div>
		</div>
		<div style="clear:both">
		<hr>
			<table id="cart"  style="width:85%;margin: auto">
				<caption>購物明細</caption>
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
					
					<tr>
						<td>
							<img style="width:60px;vertical-align: middle;float: left;"
							src="https://image.obdesign.com.tw/catalog/products/DA6972/DA6972@CB-1-1.jpg">
							純色典雅鏤空蕾絲雕花長袖洋裝
						</td>
						<td>529.0</td>
						<td>白</td>
						<td>S </td>
						<td>
								1
						</td>
						<td> 529.0</td>			
					</tr>
				
					
					<tr>
						<td>
							<img style="width:60px;vertical-align: middle;float: left;"
							src="https://image.obdesign.com.tw/catalog/products/DA6972/DA6972@CB-1-1.jpg">
							純色典雅鏤空蕾絲雕花長袖洋裝
						</td>
						<td>529.0</td>
						<td>白</td>
						<td>XL </td>
						<td>
								2
						</td>
						<td> 1058.0</td>			
					</tr>
				
						
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" style="text-align: right">
							共購買了2項, 3件產品
						</td>
						<td colspan="2" style="text-align: right">
							總金額: <span id='totalAmount'>1587.0</span>元
						</td>
					</tr>
				</tfoot>			
			</table>

		</div>
		
	</li>
	<li><div class="btn">密碼變更</div></li>
	<li><div class="btn">歷史訂單</div></li>
</ul>
<tbody>
	<tr></tr>

</tbody>

</body>
</html>