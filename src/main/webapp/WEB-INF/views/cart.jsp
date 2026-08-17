<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Cart | ShopEase</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f6f9;
            color: #1f2937;
        }

        .container {
            width: 92%;
            max-width: 1100px;
            margin: 45px auto;
        }

        .section-title {
            margin-bottom: 28px;
        }

        .section-title small {
            color: #6366f1;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1.5px;
        }

        .section-title h1 {
            margin-top: 7px;
            font-size: 32px;
            color: #111827;
        }

        .empty {
            background: #ffffff;
            text-align: center;
            padding: 70px 25px;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.06);
        }

        .empty-icon {
            font-size: 55px;
            margin-bottom: 20px;
        }

        .empty h2 {
            color: #111827;
            margin-bottom: 10px;
            font-size: 24px;
        }

        .empty p {
            color: #6b7280;
            font-size: 14px;
            margin-bottom: 25px;
        }

        .cart-box {
            background: #ffffff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.06);
        }

        .cart-row {
            display: grid;
            grid-template-columns: 100px 1fr auto auto;
            align-items: center;
            gap: 22px;
            padding: 22px 25px;
            border-bottom: 1px solid #e5e7eb;
            transition: 0.2s ease;
        }

        .cart-row:hover {
            background: #fafbff;
        }

        .cart-row img {
            width: 90px;
            height: 90px;
            object-fit: cover;
            border-radius: 12px;
            background: #f3f4f6;
            border: 1px solid #e5e7eb;
        }

        .cart-info h3 {
            color: #111827;
            font-size: 17px;
            margin-bottom: 8px;
        }

        .cart-info p {
            color: #4f46e5;
            font-size: 15px;
            font-weight: 700;
        }

        .cart-row form {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .qty {
            width: 65px;
            padding: 9px 8px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            text-align: center;
            font-size: 14px;
            outline: none;
        }

        .qty:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 2px rgba(99, 102, 241, 0.12);
        }

        button,
        .btn {
            display: inline-block;
            border: none;
            background: #6366f1;
            color: #ffffff;
            padding: 10px 15px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: 0.3s ease;
        }

        button:hover,
        .btn:hover {
            background: #4f46e5;
            transform: translateY(-1px);
            box-shadow: 0 4px 10px rgba(99, 102, 241, 0.22);
        }

        .danger {
            background: #fee2e2;
            color: #dc2626;
        }

        .danger:hover {
            background: #fecaca;
            color: #b91c1c;
            box-shadow: none;
        }

        .cart-total {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 25px;
            padding: 25px;
            background: #f9fafb;
        }

        .cart-total b {
            font-size: 21px;
            color: #111827;
        }

        .cart-total .btn {
            padding: 12px 25px;
            font-size: 14px;
        }

        @media (max-width: 850px) {

            .cart-row {
                grid-template-columns: 80px 1fr;
                gap: 15px;
            }

            .cart-row form {
                grid-column: 2;
            }

        }

        @media (max-width: 550px) {

            .container {
                width: 95%;
                margin: 30px auto;
            }

            .section-title h1 {
                font-size: 27px;
            }

            .cart-row {
                grid-template-columns: 70px 1fr;
                padding: 18px;
            }

            .cart-row img {
                width: 70px;
                height: 70px;
            }

            .cart-row form {
                grid-column: 1 / -1;
                width: 100%;
            }

            .cart-row form .qty {
                flex: 1;
            }

            .cart-row form button {
                flex: 1;
            }

            .cart-total {
                flex-direction: column;
                align-items: stretch;
                text-align: center;
            }

            .cart-total .btn {
                width: 100%;
                text-align: center;
            }

        }

    </style>

</head>


<body>

    <%@ include file="common/navbar.jsp" %>


    <main class="container">

        <div class="section-title">

            <small>SHOPPING CART</small>

            <h1>Your Cart</h1>

        </div>


        <c:choose>

            <c:when test="${empty items}">

                <div class="empty">

                    <div class="empty-icon">
                        🛒
                    </div>

                    <h2>Your cart is empty</h2>

                    <p>
                        Looks like you haven't added anything to your cart yet.
                    </p>

                    <a
                        class="btn"
                        href="${pageContext.request.contextPath}/">

                        Continue Shopping

                    </a>

                </div>

            </c:when>


            <c:otherwise>

                <div class="cart-box">

                    <c:forEach var="item" items="${items}">

                        <div class="cart-row">


                            <img
                                src="${item.product.imageUrl}"
                                alt="${item.product.name}">


                            <div class="cart-info">

                                <h3>
                                    ${item.product.name}
                                </h3>

                                <p>
                                    ₹ ${item.product.price}
                                </p>

                            </div>


                            <form
                                method="post"
                                action="${pageContext.request.contextPath}/cart/update">

                                <input
                                    type="hidden"
                                    name="${_csrf.parameterName}"
                                    value="${_csrf.token}">

                                <input
                                    type="hidden"
                                    name="productId"
                                    value="${item.productId}">

                                <input
                                    class="qty"
                                    type="number"
                                    name="quantity"
                                    value="${item.quantity}"
                                    min="1"
                                    max="${item.product.stock}">

                                <button type="submit">
                                    Update
                                </button>

                            </form>


                            <form
                                method="post"
                                action="${pageContext.request.contextPath}/cart/remove">

                                <input
                                    type="hidden"
                                    name="${_csrf.parameterName}"
                                    value="${_csrf.token}">

                                <input
                                    type="hidden"
                                    name="productId"
                                    value="${item.productId}">

                                <button
                                    type="submit"
                                    class="danger">

                                    Remove

                                </button>

                            </form>


                        </div>

                    </c:forEach>


                    <div class="cart-total">

                        <b>
                            Total: ₹ ${total}
                        </b>

                        <a
                            class="btn"
                            href="${pageContext.request.contextPath}/checkout-page">

                            Proceed to Checkout

                        </a>

                    </div>


                </div>

            </c:otherwise>


        </c:choose>


    </main>


</body>

</html>