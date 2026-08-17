<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Checkout | ShopEase</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<%@ include file="common/navbar.jsp" %>
<main class="checkout-page">
  <div class="checkout-header">
    <span class="eyebrow-light">SECURE CHECKOUT</span>
    <h1>Complete your order</h1>
    <p>Review your items, choose a demo payment method and place the order.</p>
  </div>

  <c:if test="${not empty error}"><div class="alert error">${error}</div></c:if>

  <c:choose>
    <c:when test="${not empty items}">
      <div class="checkout-layout">
        <section class="checkout-card">
          <div class="checkout-card-head"><span>1</span><div><h2>Order summary</h2><p>Your selected products</p></div></div>
          <c:forEach var="item" items="${items}">
            <div class="checkout-item">
              <img src="${item.product.imageUrl}" alt="${item.product.name}" referrerpolicy="no-referrer" onerror="this.src='${pageContext.request.contextPath}/images/product-default.svg'">
              <div class="checkout-item-info"><strong>${item.product.name}</strong><small>₹${item.product.price} × ${item.quantity}</small></div>
              <b>₹${item.product.price * item.quantity}</b>
            </div>
          </c:forEach>
          <div class="summary-total"><span>Total</span><strong>₹${total}</strong></div>
        </section>

        <section class="checkout-card">
          <div class="checkout-card-head"><span>2</span><div><h2>Payment method</h2><p>Demo payment — no real money is charged</p></div></div>
          <form id="paymentForm" method="post" action="${pageContext.request.contextPath}/checkout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div class="payment-options">
              <label class="payment-option"><input type="radio" name="paymentMethod" value="UPI" checked><span class="payment-icon">◉</span><span><b>UPI</b><small>Demo UPI payment</small></span><i>›</i></label>
              <label class="payment-option"><input type="radio" name="paymentMethod" value="CARD"><span class="payment-icon">▣</span><span><b>Card</b><small>Demo credit / debit card</small></span><i>›</i></label>
              <label class="payment-option"><input type="radio" name="paymentMethod" value="COD"><span class="payment-icon">₹</span><span><b>Cash on Delivery</b><small>Pay when delivered</small></span><i>›</i></label>
            </div>
            <div id="demoFields" class="demo-fields">
              <div id="upiFields" class="payment-fields-group">
                <label>Demo UPI ID<input name="demoUpi" placeholder="customer@upi"></label>
              </div>
              <div id="cardFields" class="payment-fields-group" style="display:none">
                <label>Demo Card Number<input name="demoCard" inputmode="numeric" maxlength="19" placeholder="4111 1111 1111 1111"></label>
                <div class="field-row">
                  <label>Expiry<input name="demoExpiry" placeholder="12/30" maxlength="5"></label>
                  <label>CVV<input name="demoCvv" inputmode="numeric" maxlength="3" placeholder="123"></label>
                </div>
              </div>
              <small>Demo payment only — no bank, card network or payment gateway is contacted. Any sample value is accepted.</small>
            </div>
            <button class="btn full pay-btn" type="submit" id="payBtn">Pay ₹${total} &amp; Place Order</button>
            <p class="secure-note">🔒 Demo checkout · Stock is updated only after the order is successfully created.</p>
          </form>
        </section>
      </div>
    </c:when>
    <c:otherwise>
      <div class="empty-products"><div style="font-size:48px">🛒</div><h2>Your cart is empty</h2><p>Add products before starting checkout.</p><a class="btn" href="${pageContext.request.contextPath}/#products">Browse products</a></div>
    </c:otherwise>
  </c:choose>
</main>
<script>
const radios=document.querySelectorAll('input[name="paymentMethod"]');
const fields=document.getElementById('demoFields');
const btn=document.getElementById('payBtn');
function paymentUI(){
 const m=document.querySelector('input[name="paymentMethod"]:checked')?.value;
 fields.style.display=m==='COD'?'none':'block';
 document.getElementById('upiFields').style.display=m==='UPI'?'block':'none';
 document.getElementById('cardFields').style.display=m==='CARD'?'block':'none';
 btn.textContent=m==='COD'?'Place Order (Cash on Delivery)':(m==='CARD'?'Pay ₹${total} & Place Order':'Pay ₹${total} & Place Order');
}
radios.forEach(r=>r.addEventListener('change',paymentUI)); paymentUI();
document.getElementById('paymentForm')?.addEventListener('submit',e=>{
 const m=document.querySelector('input[name="paymentMethod"]:checked')?.value;
 if(m!=='COD'){
   btn.disabled=true; btn.textContent='Processing demo payment…';
   setTimeout(()=>document.getElementById('paymentForm').submit(),650);
   e.preventDefault();
 }
});
</script>
</body>
</html>
