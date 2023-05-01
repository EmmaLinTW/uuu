<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<title>Insert title here</title>
<script
  		src="https://code.jquery.com/jquery-3.0.0.js"
  		integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
  		crossorigin="anonymous"></script>
<style>
header{
	text-align:center;
	background-color: #c1d9f2;
	border:gray 1px solid;
}
.Logo{
	height: 90px;
	border:gray 1px solid;
}

nav{
	overflow: auto;
	text-align: center;
	position:sticky;
	position: -webkit-sticky; 
	top:0; 
	background-color: white;
	border:gray 1px solid;
	}
nav a{
	 text-decoration: none;
	}
	
.navbardiv>div{
	display:inline;
	border:gray 1px solid;
}

.navLogo{
	border:gray 1px solid;
}

.dropdown{
border:red 1px solid;
position: relative;
}
.dropdown>div{
border:gray 1px solid;

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
</style>
</head>
<body>

<header>	
	<a href="" >
		<img class="Logo" src="/pg/image/Pglogo-100-this.png">
	</a>
</header>

<nav class="navbar">
	<div class="navbardiv">
		<a href="">
			<img class="navLogo" style="height: 45px;" src="/pg/image/Pglogo-100-this.png">
		</a>
		<div><a href="">會員註冊</a></div> 
		<div><a href="">會員登入</a></div>
		<div><a href="">上身</a>
			<div class="dropdown">
				<div><a href="">洋裝</a></div><br>
				<div><a href="">襯衫</a></div><br>
				<div><a href="">T-shirt</a></div>
			</div>
		</div>
		
		<form action="" style="float:right">
			<input type="search" name="search" placeholder="輸入關鍵字">
			<input type="submit" value="搜尋">
		</form>
	</div>
</nav>

<article>
	<img src="/pg/image/191115-DA7149_1920X820_v3.jpg" />
	<img src="/pg/image/191119-EA2809_1920x820.jpg"/>
	<img src="/pg/image/191122-warmcoat_1920x820.jpg" />
	<img src="/pg/image/191125-AB11510_1920x820-v2.jpg" />
	<img src="/pg/image/191126-AB11608_1920X820_v1.jpg" />
	<img src="/pg/image/191126-EA2791_1920x820.jpg" />
</article>
</body>
</html>