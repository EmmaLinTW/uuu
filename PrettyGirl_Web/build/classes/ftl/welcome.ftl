<!DOCTYPE html>
<html>
    <head>
        <title> ${title} </title>
        <meta charset="UTF-8">
    </head>
    <body>
    <h1> ${title} </h1>
    <p>
      <h3>＊此信件為系統發出信件，請勿直接回覆，感謝您的配合。謝謝！＊</h3>
      <h2>親愛的顧客您好，已完成訂購</h2>
      <h2>點擊圖片即可檢視訂單明細</h2>
      <h1>訂單編號${orderId}</h1>
      <a href='http://${host}:8080/pg/member/order.jsp?orderId=${orderId}'>
      	<img src='cid:image'>
      </a>
    </p>
    <h3>感謝您的訂購</h3>
    </body>
</html>
