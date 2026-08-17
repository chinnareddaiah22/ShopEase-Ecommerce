<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>ShopEase | Modern Java E-Commerce</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

<%@ include file="common/navbar.jsp" %>


<section class="hero">

    <div class="hero-inner">

        <div>

            <span class="eyebrow">
                <span class="eyebrow-dot"></span>
                JAVA E-COMMERCE PLATFORM
            </span>

            <h1>
                Everything you need.<br>
                <span>One simple shop.</span>
            </h1>

            <p>
                Discover quality products, add them to your cart,
                checkout securely and track your orders
                &mdash; all connected to your Java, Spring,
                Hibernate and Oracle backend.
            </p>

            <div class="hero-actions">

                <a class="btn" href="#products">
                    Explore products &rarr;
                </a>

                <c:choose>

                    <c:when test="${pageContext.request.userPrincipal != null}">

                        <a class="btn secondary"
                           href="${pageContext.request.contextPath}/orders">
                            View my orders
                        </a>

                    </c:when>

                    <c:otherwise>

                        <a class="btn secondary"
                           href="${pageContext.request.contextPath}/register">
                            Create account
                        </a>

                    </c:otherwise>

                </c:choose>

            </div>

        </div>


        <div class="hero-panel">

            <div class="hero-panel-head">

                <span>
                    SHOPPING EXPERIENCE
                </span>

                <span class="hero-status">
                    &bull; Live
                </span>

            </div>


            <div class="hero-product">

                <c:choose>

                    <c:when test="${not empty products}">

                        <img
                            src="${products[0].imageUrl}"
                            alt="${products[0].name}"
                            referrerpolicy="no-referrer">

                        <div class="hero-product-row">

                            <div>

                                <strong>
                                    ${products[0].name}
                                </strong>

                                <br>

                                <small>
                                    Featured product
                                </small>

                            </div>

                            <span>
                                &#8377;${products[0].price}
                            </span>

                        </div>

                    </c:when>

                    <c:otherwise>

                        <div
                            style="height:190px;
                                   display:grid;
                                   place-items:center;
                                   background:#f2f4f7;
                                   border-radius:12px;
                                   font-size:44px">

                            &#128722;

                        </div>

                        <div class="hero-product-row">

                            <strong>
                                ShopEase Store
                            </strong>

                            <span>
                                Ready
                            </span>

                        </div>

                    </c:otherwise>

                </c:choose>

            </div>

        </div>

    </div>

</section>


<section class="store-trust-strip">

    <div>

        &#128666;

        <b>
            Fast delivery
        </b>

        <small>
            Reliable order processing
        </small>

    </div>


    <div>

        &#128274;

        <b>
            Secure account
        </b>

        <small>
            Spring Security protected
        </small>

    </div>


    <div>

        &#8617;

        <b>
            Easy shopping
        </b>

        <small>
            Cart and order history
        </small>

    </div>


    <div>

        &#128179;

        <b>
            Demo payments
        </b>

        <small>
            Safe learning checkout
        </small>

    </div>

</section>


<section class="category-showcase"
         aria-label="Shop by category">

    <div class="container">

        <div class="section-head category-heading">

            <div>

                <div class="section-kicker">
                    SHOP BY CATEGORY
                </div>

                <h2>
                    Three easy ways to shop
                </h2>

                <p>
                    Explore fashion, mobiles and sports shoes
                    &mdash; clearly separated for an easy demo.
                </p>

            </div>

        </div>


        <div class="category-rows">


            <a class="category-row"
               href="${pageContext.request.contextPath}/?q=Dress">

                <div class="category-art dress-art">

                    <img
                        src="https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?auto=format&amp;fit=crop&amp;w=1200&amp;q=85"
                        alt="Dresses">

                </div>

                <div>

                    <span class="category-label">
                        FASHION
                    </span>

                    <h3>
                        Dresses
                    </h3>

                    <p>
                        Casual, party and everyday styles.
                    </p>

                </div>

                <span class="category-arrow">
                    &rarr;
                </span>

            </a>


            <a class="category-row"
               href="${pageContext.request.contextPath}/?q=Mobile">

                <div class="category-art mobile-art">

                    <img
                        src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&amp;fit=crop&amp;w=1200&amp;q=85"
                        alt="Mobiles">

                </div>

                <div>

                    <span class="category-label">
                        TECH
                    </span>

                    <h3>
                        Mobiles
                    </h3>

                    <p>
                        Smartphones for work, study and entertainment.
                    </p>

                </div>

                <span class="category-arrow">
                    &rarr;
                </span>

            </a>


            <a class="category-row"
               href="${pageContext.request.contextPath}/?q=Sports">

                <div class="category-art sports-art">

                    <img
                        src="https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&amp;fit=crop&amp;w=1200&amp;q=85"
                        alt="Sports Shoes">

                </div>

                <div>

                    <span class="category-label">
                        SPORTS
                    </span>

                    <h3>
                        Sports Shoes
                    </h3>

                    <p>
                        Running and training shoes for active days.
                    </p>

                </div>

                <span class="category-arrow">
                    &rarr;
                </span>

            </a>

        </div>

    </div>

</section>


<main id="products"
      class="page-section">

    <div class="container">

        <div class="section-head">

            <div>

                <div class="section-kicker">
                    CURATED FOR YOU
                </div>

                <h2>
                    Latest products
                </h2>

                <p>
                    Browse the catalog and add what you like
                    to your cart.
                </p>

            </div>


            <form class="search"
                  method="get"
                  action="${pageContext.request.contextPath}/">

                <input
                    name="q"
                    value="${q}"
                    placeholder="Search products..."
                    aria-label="Search products">

                <button type="submit">
                    Search
                </button>

            </form>

        </div>


        <c:if test="${not empty param.error}">

            <div class="alert error">
                ${param.error}
            </div>

        </c:if>


        <c:choose>

            <c:when test="${not empty products}">

                <div class="product-grid">

                    <c:forEach var="p" items="${products}">

                        <article class="card">

                            <a class="product-image-link"
                               href="${pageContext.request.contextPath}/product/${p.id}">

                                <img
                                    src="${p.imageUrl}"
                                    alt="${p.name}"
                                    loading="lazy"
                                    referrerpolicy="no-referrer"
                                    onerror="this.src='${pageContext.request.contextPath}/images/product-default.svg'">

                                <span class="stock-pill ${p.stock <= 0 ? 'out' : ''}">

                                    ${p.stock > 0 ? 'In stock' : 'Out of stock'}

                                </span>

                            </a>


                            <div class="card-body">

                                <h3 title="${p.name}">
                                    ${p.name}
                                </h3>

                                <p>
                                    ${p.description}
                                </p>


                                <div class="price-row">

                                    <span class="price">
                                        &#8377;${p.price}
                                    </span>

                                    <a class="view-link"
                                       href="${pageContext.request.contextPath}/product/${p.id}">
                                        View details
                                    </a>

                                </div>


                                <c:choose>

                                    <c:when test="${p.stock > 0}">

                                        <form
                                            class="cart-form"
                                            method="post"
                                            action="${pageContext.request.contextPath}/cart/add">

                                            <input
                                                type="hidden"
                                                name="${_csrf.parameterName}"
                                                value="${_csrf.token}">

                                            <input
                                                type="hidden"
                                                name="productId"
                                                value="${p.id}">

                                            <input
                                                class="qty"
                                                type="number"
                                                name="quantity"
                                                value="1"
                                                min="1"
                                                max="${p.stock}"
                                                aria-label="Quantity">

                                            <button
                                                class="btn small"
                                                type="submit">
                                                Add to cart
                                            </button>

                                        </form>

                                    </c:when>

                                    <c:otherwise>

                                        <button
                                            class="btn small"
                                            type="button"
                                            disabled
                                            style="width:100%;opacity:.5;cursor:not-allowed">
                                            Out of stock
                                        </button>

                                    </c:otherwise>

                                </c:choose>

                            </div>

                        </article>

                    </c:forEach>

                </div>

            </c:when>


            <c:otherwise>

                <div class="empty-products">

                    <div style="font-size:44px">
                        &#128269;
                    </div>

                    <h3>
                        No products found
                    </h3>

                    <p>
                        Try another search or browse the full catalog.
                    </p>

                    <a class="btn"
                       href="${pageContext.request.contextPath}/">
                        Show all products
                    </a>

                </div>

            </c:otherwise>

        </c:choose>

    </div>

</main>


<%@ include file="common/footer.jsp" %>

<script src="${pageContext.request.contextPath}/js/app.js"></script>

</body>

</html>