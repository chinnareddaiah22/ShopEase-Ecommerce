<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Order Confirmed | ShopEase</title><link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"></head>
<body>
<%@ include file="common/navbar.jsp" %>
<main class="success-wrap">
 <div class="success-page">
  <div class="success-icon">✓</div>
  <span class="eyebrow-light">ORDER CONFIRMED</span>
  <h1>Your order is on the way.</h1>
  <p>Thank you for shopping with ShopEase. Your demo payment/order workflow completed successfully.</p>
  <div class="confirmation-grid">
   <div><small>ORDER ID</small><b>#${orderId}</b></div>
   <div><small>PAYMENT</small><b>${paymentMethod}</b></div>
   <div><small>STATUS</small><b>PLACED</b></div>
  </div>
  <div class="actions"><a class="btn" href="${pageContext.request.contextPath}/orders">View my orders</a><a class="btn outline" href="${pageContext.request.contextPath}/#products">Continue shopping</a></div>
 </div>
</main>
</body></html>
