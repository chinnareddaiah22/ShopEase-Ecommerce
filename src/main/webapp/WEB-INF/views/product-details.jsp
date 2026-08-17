<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>${product.name} | ShopEase</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .product-detail-page {
            max-width: 1200px;
            margin: 50px auto;
            padding: 0 20px;
        }

        .product-detail-card {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 55px;
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 22px;
            padding: 35px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.07);
        }

        .detail-image-box {
            background: #f5f6fa;
            border-radius: 18px;
            overflow: hidden;
            min-height: 500px;
        }

        .detail-image {
            width: 100%;
            height: 500px;
            display: block;
            object-fit: cover;
            transition: transform .4s ease;
        }

        .detail-image:hover {
            transform: scale(1.03);
        }

        .detail-info {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .detail-label {
            color: #6366f1;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: 1.5px;
            margin-bottom: 12px;
        }

        .detail-title {
            font-size: 42px;
            line-height: 1.15;
            color: #111827;
            margin-bottom: 20px;
        }

        .detail-description {
            color: #64748b;
            font-size: 16px;
            line-height: 1.8;
            margin-bottom: 25px;
        }

        .detail-price {
            font-size: 34px;
            font-weight: 800;
            color: #4f46e5;
            margin-bottom: 18px;
        }

        .stock-badge {
            display: inline-flex;
            width: fit-content;
            align-items: center;
            gap: 8px;
            padding: 8px 14px;
            border-radius: 30px;
            background: #ecfdf5;
            color: #15803d;
            border: 1px solid #bbf7d0;
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 28px;
        }

        .stock-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #22c55e;
        }

        .stock-out {
            background: #fef2f2;
            color: #dc2626;
            border-color: #fecaca;
        }

        .stock-out .stock-dot {
            background: #ef4444;
        }

        .detail-cart {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 30px;
        }

        .detail-qty {
            width: 80px;
            height: 48px;
            border: 1px solid #d1d5db;
            border-radius: 10px;
            text-align: center;
            font-size: 15px;
        }

        .detail-cart-button {
            height: 48px;
            padding: 0 28px;
            border: none;
            border-radius: 10px;
            background: #6366f1;
            color: white;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: .25s;
        }

        .detail-cart-button:hover {
            background: #4f46e5;
            transform: translateY(-2px);
        }

        .detail-benefits {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            border-top: 1px solid #e5e7eb;
            padding-top: 25px;
        }

        .benefit {
            background: #f8fafc;
            padding: 14px 8px;
            text-align: center;
            border-radius: 10px;
            color: #64748b;
            font-size: 12px;
        }

        .benefit strong {
            display: block;
            color: #111827;
            margin-bottom: 5px;
        }

        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: #6366f1;
            text-decoration: none;
            font-weight: 700;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 850px) {

            .product-detail-card {
                grid-template-columns: 1fr;
                gap: 30px;
                padding: 25px;
            }

            .detail-image-box,
            .detail-image {
                min-height: 380px;
                height: 380px;
            }

            .detail-title {
                font-size: 32px;
            }

        }

        @media (max-width: 600px) {

            .product-detail-page {
                margin: 30px auto;
            }

            .product-detail-card {
                padding: 18px;
            }

            .detail-image-box,
            .detail-image {
                min-height: 300px;
                height: 300px;
            }

            .detail-title {
                font-size: 28px;
            }

            .detail-benefits {
                grid-template-columns: 1fr;
            }

            .detail-cart {
                width: 100%;
            }

            .detail-cart-button {
                flex: 1;
            }

        }

    </style>

</head>

<body>

<%@ include file="common/navbar.jsp" %>


<main class="product-detail-page">

    <a class="back-link"
       href="${pageContext.request.contextPath}/">
        ← Back to products
    </a>


    <div class="product-detail-card">


        <!-- PRODUCT IMAGE -->

        <div class="detail-image-box">

            <img
                class="detail-image"
                src="${product.imageUrl}"
                alt="${product.name}"
                referrerpolicy="no-referrer"
                onerror="this.src='${pageContext.request.contextPath}/images/product-default.svg'">

        </div>


        <!-- PRODUCT INFORMATION -->

        <div class="detail-info">

            <div class="detail-label">
                PRODUCT DETAILS
            </div>


            <h1 class="detail-title">
                ${product.name}
            </h1>


            <p class="detail-description">
                ${product.description}
            </p>


            <div class="detail-price">
                ₹${product.price}
            </div>


            <!-- STOCK -->

            <c:choose>

                <c:when test="${product.stock > 0}">

                    <div class="stock-badge">

                        <span class="stock-dot"></span>

                        ${product.stock} items in stock

                    </div>


                    <!-- ADD TO CART -->

                    <form
                        class="detail-cart"
                        method="post"
                        action="${pageContext.request.contextPath}/cart/add">

                        <input
                            type="hidden"
                            name="${_csrf.parameterName}"
                            value="${_csrf.token}">

                        <input
                            type="hidden"
                            name="productId"
                            value="${product.id}">

                        <input
                            class="detail-qty"
                            type="number"
                            name="quantity"
                            value="1"
                            min="1"
                            max="${product.stock}">

                        <button
                            class="detail-cart-button"
                            type="submit">

                            Add to Cart

                        </button>

                    </form>

                </c:when>


                <c:otherwise>

                    <div class="stock-badge stock-out">

                        <span class="stock-dot"></span>

                        Out of stock

                    </div>

                    <button
                        class="detail-cart-button"
                        type="button"
                        disabled
                        style="opacity:.5;cursor:not-allowed">

                        Currently Unavailable

                    </button>

                </c:otherwise>

            </c:choose>


            <!-- BENEFITS -->

            <div class="detail-benefits">

                <div class="benefit">

                    <strong>🔒 Secure</strong>

                    Safe checkout

                </div>


                <div class="benefit">

                    <strong>🚚 Delivery</strong>

                    Fast processing

                </div>


                <div class="benefit">

                    <strong>✓ Quality</strong>

                    Trusted products

                </div>

            </div>

        </div>

    </div>

</main>


<%@ include file="common/footer.jsp" %>

</body>

</html>