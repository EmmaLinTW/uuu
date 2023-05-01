<%@ page pageEncoding="UTF-8" contentType="text/html;"%>
<span style="color:darkred">
${not empty sessionScope.cart?"(".concat(sessionScope.cart.totalQuantity).concat(")"):""}
</span>
