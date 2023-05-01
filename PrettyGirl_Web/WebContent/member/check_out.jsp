<%@page import="uuu.pg.entity.ShippingType"%>
<%@page import="uuu.pg.entity.PaymentType"%>
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
	#recipient input{
		width:75%
		}
	td{
		text-align: center;
	}
	
	#checkOutProductName{
		text-align: left;
	}
	
</style>
<script>
	function copyMember(){
		$("#recipientName").val("${sessionScope.member.name}");
		$("#recipientEmail").val("${sessionScope.member.email}");
		$("#recipientPhone").val("${sessionScope.member.phone}");
		if ($("#shippingType").val() != "<%= ShippingType.SHOP.name()%>" && $("#shippingType").val() != "<%= ShippingType.STORE.name()%>"){
			$("#shippingAddress").val("${sessionScope.member.address}");
		}
	}
	
	function paymentTypeChange(){
		//#paymentType, #shippingType
		var paymentVal = $("#paymentType").val();
		if(paymentVal.length>0){
			var shippingData =  $("#paymentType option:selected").attr("data-shippingArray");
			if(shippingData.length>0){
				$("#shippingType option").prop("disabled", true);//將貨運方式所有的option都disabled
				$("#shippingType option[value='']").prop("disabled", false);
				shippingArray = shippingData.split(",");
				for (i=0;i<shippingArray.length;i++){
					$("#shippingType option[value='"+shippingArray[i]+"']").prop("disabled", false);
				}
			}
		}		
		calculateFee();
	}
	
	function shippingTypeChange() {
        var width = parseFloat($("#recipientPhone").css("width"));
        console.log(width);

        $("#shippingAddress").removeAttr("list");
        $("#shippingAddress").removeAttr("autocomplete");
        $("#shippingAddress").removeAttr("placeholder");
        $("#shippingAddress").attr("readonly", false);
        $("#shippingAddress").css("width", width);
        $("#shippingAddress").attr("autocomplete", "on");
        $("#storeButton").css("display", "none");
        $("#shippingAddress").val("");
        if ($("#shippingType").val() == "<%= ShippingType.SHOP.name()%>") {
            $("#shippingAddress").attr("placeholder", "請選擇門市");
            $("#shippingAddress").attr("list", "shopList");
            $("#shippingAddress").attr("autocomplete", "off");
        } else if ($("#shippingType").val() == "<%= ShippingType.STORE.name()%>") {
            $("#shippingAddress").attr("readonly", true);
            $("#shippingAddress").attr("placeholder", "請用右邊的按鈕選擇超商");
            $("#shippingAddress").css("width", width - 77);
            $("#storeButton").css("display", "inline");
        } else {
            $("#shippingAddress").attr("placeholder", "請輸入收件地址");
        }
        
        calculateFee();
    }	
	
	function calculateFee(){
		var totalAmount = parseFloat($("#totalAmount").text());
		var paymentFee = parseFloat($("#paymentType option:selected").attr("data-fee"));
		var shippingFee = parseFloat($("#shippingType option:selected").attr("data-fee"));
		var total = totalAmount+(isNaN(paymentFee)?0:paymentFee)+(isNaN(shippingFee)?0:shippingFee);
		console.log(totalAmount, paymentFee, shippingFee, total);
		$("#totalWithFee").text(total);
		
	}

</script>
</head>
<body>
	<jsp:include page="/subviews/header.jsp" >
		<jsp:param value="結帳" name="subtitle"/>		
	</jsp:include>
	<article>

	<%
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		if(cart!=null && cart.size()>0){		
			Customer member = (Customer)session.getAttribute("member");
			if(member!=null){
				cart.setMember(member);
			}
	%>
		<form id="cartForm" action="<%= request.getContextPath() %>/member/check_out.do" method="POST">
			${requestScope.errors }
			<table id="cart">
				<caption>購物明細</caption>
				<thead>
					<tr>
						<th>商品名稱</th>
						<th>原價</th>
						<th>折扣</th>
						<th>售價</th>
						<th>顏色</th>
						<th>尺寸</th>
						<th>數量</th>					
						<th>小計</th>					
					</tr>
				</thead>
				<tbody>
					<% for(CartItem item:cart.getCartItemSet()) {
						Product p = item.getProduct();
						Color color = item.getColor();
						Size size = item.getSize();
						%>
					<tr>
						<td id="checkOutProductName">
							<img id="productImage" style="width:80px;vertical-align: middle;"
							src="<%= color==null || color.getPhotoUrl()==null?
									p.getPhotoUrl():color.getPhotoUrl() %>">
							<%= item.getProduct().getName() %>
						</td>
						<td><%= ShoppingCart.PRICE.format(cart.getListPrice(item)) %></td>
						<td><%= cart.getDiscountString(item) %></td>
						<td><%= ShoppingCart.PRICE.format(cart.getUnitPrice(item)) %></td>
						<td><%= color!=null?color.getColorName():"" %></td>
						<td><%= size!=null?size.name():"" %> </td>
							<td><%=cart.getQuantity(item) %></td>
							<td><%=ShoppingCart.AMOUNT.format(cart.getSubAmount(item)) %></td>
					</tr>
					<% } %>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" style="text-align: right">
							共購買了<%= cart.size() %>項, <%= cart.getTotalQuantity() %>件產品
						</td>
						<td colspan="3">
							總金額: <span id='totalAmount'><%= ShoppingCart.AMOUNT.format(cart.getVIPTotalAmount()) %></span>元
						</td>
					</tr>
					<tr>
						<td colspan="5" style="text-align: center">
							<span style="display:inline-block;width:45%;text-align: left">
							<label>付款方式:</label>
									<select id="paymentType" name="paymentType" required onchange="paymentTypeChange()">
								<option value="">請選擇...</option>
								<% for(PaymentType pType:PaymentType.values()) {%>
								<option value="<%= pType.name() %>" 
										data-fee="<%=pType.getFee()%>"
										data-shippingArray='<%=pType.getShippingTypeArrayString() %>'>
										<%= pType %>
								</option>
								<% } %>
							</select>
							</span>
						<span style="display:inline-block;width:45%;text-align: left">
							<label>貨運方式:</label>
							<select id="shippingType" name="shippingType" required onchange="shippingTypeChange()">
								<option value="">請選擇...</option>
								<% for(ShippingType shType:ShippingType.values()) {%>
								<option value="<%=shType.name() %>" 
									data-fee="<%=shType.getFee()%>">
									<%= shType %>
								</option>
								<% } %>
							</select>
							</span>
						</td>	
						<td colspan="5" style="text-align: right">
							含物流費共:<span id="totalWithFee"><%= ShoppingCart.AMOUNT.format(cart.getVIPTotalAmount()) %></span>元
						</td>
					</tr>
					<tr>
						<td colspan="8">
							<fieldset id="recipient">
								<legend>收件人<a href='javascript:copyMember()'>同訂購人</a></legend>
								<label>姓名: </label><input id="recipientName" name="recipientName" required value="${param.recipientName}"><br>
								<label>電郵: </label><input id="recipientEmail" name="recipientEmail" required value="${param.recipientEmail}"><br>
								<label>電話: </label><input id="recipientPhone" name="recipientPhone" required value="${param.recipientPhone}"><br>
								<label>地址: </label><input id="shippingAddress" name="shippingAddress" required value="${param.shippingAddress}">
                                <button type="button" style="display:none" id="storeButton" onclick='goEzShip()'>選擇超商</button>
                                <datalist id="shopList">
                                    <option value="復北門市-台北市復興北路99號14樓">
                                    <option value="信義門市-台北市信義路三段158號(近捷運大安站)">
                                    <option value="北車門市-台北市中正區忠孝西路一段49號">
                                </datalist>																
							</fieldset>
						</td>
					</tr>
					<tr>
						<td colspan="8" style="text-align: right">
							<input type="submit" value="確定結帳" name="submit">
						</td>
					</tr>
				</tfoot>			
			</table>
		</form>
			<script>
				$(initValue);
				
				function initValue(){
					<% if(request.getParameter("paymentType")!=null){%>
						$("#paymentType").val('<%=request.getParameter("paymentType")%>');
						paymentTypeChange();
					<%}%>
					
					<% if(request.getParameter("shippingType")!=null){%>
						$("#shippingType").val('<%=request.getParameter("shippingType")%>');
						shippingTypeChange();
						$("#shippingAddress").val('<%=request.getParameter("shippingAddress")%>');
					<%}%>
				}

                function goEzShip() {
                    $("#recipientName").val($("#recipientName").val().trim());
                    $("#recipientEmail").val($("#recipientEmail").val().trim());
                    $("#recipientPhone").val($("#recipientPhone").val().trim());
                    $("#shippingAddress").val($("#shippingAddress").val().trim());
                    
                    var protocol = "<%=request.getProtocol().toLowerCase().substring(0, request.getProtocol().indexOf("/"))%>";
                    var ipAddress = "<%= java.net.InetAddress.getLocalHost().getHostAddress()%>";
                    var url = protocol + "://" + ipAddress + ":" + location.port + "<%=request.getContextPath()%>/member/ez_ship_callback.jsp";
                    $("#rtURL").val(url);
                    
                    $("#webPara").val($("#cartForm").serialize());

//                    alert(url);
                    //alert($("#webPara").val());
//                    alert($("#cartForm").serialize());

                    $("#ezForm").submit();
                }
            </script>
            <form method="post" action="http://map.ezship.com.tw/ezship_map_web.jsp" id="ezForm">
                <input type="hidden" name="suID"  value="test@vgb.com"> <!-- 業主在 ezShip 使用的帳號, 這裡可以隨便寫 -->
                <input type="hidden" name="processID" value="VGB201804230000005"> <!-- 購物網站自行產生之訂單編號, 這裡可以隨便寫 -->
                <input type="hidden" name="stCate"  value=""> <!-- 取件門市通路代號 -->            
                <input type="hidden" name="stCode"  value=""> <!-- 取件門市代號 -->            
                <input type="hidden" name="rtURL" id="rtURL" value=""><!-- 回傳路徑及程式名稱 -->
                <input type="hidden" id="webPara" name="webPara" value=""><!-- 我們網站所需的原Form Data。ezShip會將原值回傳，供我們網站帶回畫面用 -->
            </form>					
		<%}else{ %>
			<p>購物車是空到，回到<a href="<%= request.getContextPath() %>/products_list.jsp">賣場</a></p>
		<% } %>
	</article>
<%@include file="/subviews/footer.jsp" %>

</body>
</html>