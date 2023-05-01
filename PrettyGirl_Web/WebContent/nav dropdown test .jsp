<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" >
<title>title</title>
<script
  	src="https://code.jquery.com/jquery-3.0.0.js"
  	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
  	crossorigin="anonymous">
</script>
<script>
$(document).ready(init);
function init()
{
	$(window).scroll(scrollHandler);
	scrollHandler();
}
function scrollHandler(){
	var scrollTop = $(window).scrollTop();
	//$("#myMenu").text(scrollTop+" / "+(100-scrollTop));
	if(scrollTop<=88){
		$("#navbar").css({top:(88-scrollTop)+"px"});
	}else{
		$("#navbar").css({top:"0px"});
	}
}
</script>
<style type="text/css">

body{
	font-family: Arial, "文泉驛正黑", "WenQuanYi Zen Hei", 
			"儷黑 Pro", "LiHei Pro", "微軟正黑體", 
			"Microsoft JhengHei", 
			"標楷體", DFKai-SB, sans-serif;
	border:gray 1px solid;
	margin: 0px;
			}
			
.header{
	text-align:center;
	background-color: #c1d9f2;
	border:gray 1px solid;
	width:100%;
}

.Logo{
	height: 80px;
	border:gray 1px solid;
}

#navbar{
	text-align:center;
	border:gray 1px solid;
	background-color: pink;
	width:100%;
	position: fixed;
	height: 50px;
	
}

.navLogo{
	border:gray 1px solid;
}

.navbar-a{
    color: black;
    text-decoration: none;
	border:gray 1px solid;
	background-color: white;
	position: relative;
	text-align: center;
	/*padding: 16px;*/
    font-size: 16px;
   /*border: none;*/
   	margin: auto;
   	display:inline-block;
   	width:70px;
}
article{
	border:gray 1px solid;
	margin:auto;
	width:80%;
	min-height: 70vh;
}

article img{
	width: 100%;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
</style>

</head>
<body >
<div class="header">	
	<a href="" >
		<img class="Logo" src="/pg/image/Pglogo-100-this.png">
	</a>
</div>
	<div id="navbar">
		<a href="">
			<img class="navLogo" style="height: 40px;" src="/pg/image/Pglogo-100-this.png">
		<a class="navbar-a" href="">會員註冊</a> 
		<a class="navbar-a" href="">會員登入</a>
		<a class="navbar-a" href="">上身類</a>
	    	<div class="dropdown">
	    		<a class="navbar-a" href="">洋裝</a><br>
	    		<a class="navbar-a" href="">襯衫</a><br>
	    		<a class="navbar-a" href="">T-shirt</a>
	    	</div>
		<form action="" method="GET" style="float:right; margin-right: 8px;">
			<input type="search" name="search" placeholder="輸入關鍵字">
			<input type="submit" value="搜尋">
		</form>
	</div>
<article>
	<img src="/pg/image/191115-DA7149_1920X820_v3.jpg" />
	<img src="/pg/image/191119-EA2809_1920x820.jpg"/>
	<img src="/pg/image/191122-warmcoat_1920x820.jpg" />
	<img src="/pg/image/191125-AB11510_1920x820-v2.jpg" />
	<img src="/pg/image/191126-AB11608_1920X820_v1.jpg" />
	<img src="/pg/image/191126-EA2791_1920x820.jpg" />

</article>
	
<%@include file="/subviews/footer.jsp" %>

</body>
</html>