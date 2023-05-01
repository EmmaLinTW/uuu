<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1">
<title>change picture</title>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <title>輪播效果</title>
        <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            var index = 1;
            $(document).ready(init);
            function init() {
                $("#next").click(nextHandler);
                $("#prev").click(prevHandler);
                $(".gifs2,.gifs4").append("<img src='halloween/6.gif' />");
                for (var i = 1; i <= 6; i++) {
                    $(".gifs2,.gifs4").append("<img src='halloween/" + i + ".gif' />");
                }
                $(".gifs2,.gifs4").append("<img src='halloween/1.gif' />");
            }

            function nextHandler(event) {
                index++;
                $("#info").text(index);
                if (index == 7) {
                    $(".gifs2").animate({"top": -(index) * 225 + "px"}, 300, gif2Forward);
                    $(".gifs4").animate({"left": -((index) * 570) + "px"}, 300, gif4Forward);
                    index = 1;
                } else {
                    changeGif();
                }
            }
            function gif2Forward() {
                $(".gifs2").css({"top": "-225px"});
            }
            function gif4Forward() {
                $(".gifs4").css({"left": "-570px"});
            }

            function prevHandler(event) {
                index--;
                $("#info").text(index);
                if (index == 0) {
                    $(".gifs2").animate({"top": -(index) * 225 + "px"}, 300, gif2Back);
                    $(".gifs4").animate({"left": -((index) * 570) + "px"}, 300, gif4Back);
                    index = 6;
                } else {
                    changeGif();
                }
            }
            function gif2Back() {
                $(".gifs2").css({"top": "-1350px"});
            }
            function gif4Back() {
                $(".gifs4").css({"left": "-3420px"});
            }

            function changeGif() {
                $(".gifs2").animate({"top": -(index) * 225 + "px"}, 300);
                $(".gifs4").animate({"left": -((index) * 570) + "px"}, 300);
            }
        </script>
        <style>
            .myCarousel{
                display:inline-block;
                margin: auto;
                margin-top: 0;
            }
/*            div{
                display:inline-block;
            }*/
            .gifs2{
                position:relative;
                width:570px;
                height:225px;
                top:-225px;
            }
            #gifs2Outer,#gifs4Outer{
                position:relative;
                width:570px;
                height:225px;
                overflow:hidden;
            }
            .gifs4{
                position:relative;
                width:4560px;
                left:-570px;
            }
            button{
                width:100px;
                height:100px;
            }
        </style>
    </head>
    <body>
        <div id="myCarousel" class="carousel slide">
            <!-- 輪播（Carousel）指標 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>   
            <!-- 輪播（Carousel）項目 -->
            <div class="carousel-inner">
                <div class="item active">
                 <img style="width: 100%;height:530px;margin: auto" src="images/Carousel_picture1.webp" alt="Second slide">
                    <div class="carousel-caption"></div>
                </div>
                <div class="item">
                    <img style="width: 100%;height:530px;margin: auto" src="images/Carousel_picture2.jpg" alt="Second slide">
                    <div class="carousel-caption"></div>
                </div>
                <div class="item">
                    <img style="width: 100%;height:530px;margin: auto" src="images/Carousel_picture3.jpg" alt="Second slide">
                    <div class="carousel-caption"></div>
                </div>
                <div class="item">
                    <img style="width: 100%;height:530px;margin: auto" src="images/Carousel_picture4.jpg" alt="Second slide">
                    <div class="carousel-caption"></div>
                </div>
            </div>
            <!-- 輪播（Carousel）導航 -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

    </body>
</html>