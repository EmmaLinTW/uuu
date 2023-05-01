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

article{
	border:gray 1px solid;
	margin:auto;
	width:80%;
	min-height: 70vh;
	margin-top: 60px;
}

article img{
	width: 100%;
}

ul { /* 取消ul預設的內縮及樣式 */
        margin: 0;
        padding: 0;
        list-style: none;
    }
ul.drop-down-menu {
        /*border: #ccc 1px solid;*/
        display: inline-block;
        font-family: 'Open Sans', Arial, sans-serif;
        font-size: 13px;
    }
    ul.drop-down-menu li {
        position: relative;
        white-space: nowrap;
       /* border-right: #ccc 1px solid;*/
    }
  ul.drop-down-menu > li:last-child {
        border-right: none;
    }

    ul.drop-down-menu > li {
        float: left; /* 只有第一層是靠左對齊*/
    }

     ul.drop-down-menu a {
        background-color: #fff;
        color: #333;
        display: block;
        padding: 0 30px;
        text-decoration: none;
        line-height: 40px;
    }
    #logo_a{
    line-height: 0px;
    }
    ul.drop-down-menu a:hover { /* 滑鼠滑入按鈕變色*/
        background-color: #729ff3;
        color: #fff;
    }
    ul.drop-down-menu li:hover > a { /* 滑鼠移入次選單上層按鈕保持變色*/
        background-color: #729ff3;
        color: #fff;
    }
    ul.drop-down-menu ul { /*隱藏次選單*/
        display: none;
    }

    ul.drop-down-menu li:hover > ul { /* 滑鼠滑入展開次選單*/
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
		<ul class="drop-down-menu">
			<li>
				<a id="logo_a" href="">
					<img class="navLogo" style="height: 40px;" src="/pg/image/Pglogo-100-this.png">
				</a>
			</li>
		<li><a  href="">熱門商品</a> </li>
		<li><a  href="">上身類</a> 
	    	<ul>
	    		<li><a href="">洋裝</a></li>
	    		<li><a href="">襯衫</a></li>
	    		<li><a href="">T-shirt</a></li>
	    	</ul>
	    </li>
		
		<li><a href="">下身類</a>
	    	<ul>
	    		<li><a href="">裙類</a></li>
	    		<li><a href="">褲類</a></li>
	    	</ul>
	    </li>
	    
	    <li><a href="">外套</a>
	    	<ul>
	    		<li><a href="">西裝外套</a></li>
	    		<li><a href="">風衣/夾克</a></li>
	    	</ul>
	    </li>
	    <li><a  href="">會員登入/註冊</a> </li>
	    <li><a  href="">會員登出</a> </li>
		</ul>
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