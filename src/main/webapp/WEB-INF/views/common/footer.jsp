<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<footer class="site-footer">

    <div class="footer-container">

        <div class="footer-column footer-brand">

            <a class="brand"
               href="${pageContext.request.contextPath}/">

                Shop<span class="brand-accent">Ease</span>

            </a>

            <p>
                A clean, real-world e-commerce experience powered by
                Java, Spring MVC, Hibernate and Oracle.
            </p>

            <span class="tech-badge">
                Java Full-Stack Project
            </span>

        </div>


        <div class="footer-column">

            <h3>Shop</h3>

            <a href="${pageContext.request.contextPath}/">
                All products
            </a>

            <a href="${pageContext.request.contextPath}/cart">
                Shopping cart
            </a>

            <a href="${pageContext.request.contextPath}/orders">
                My orders
            </a>

        </div>


        <div class="footer-column">

            <h3>Account</h3>

            <a href="${pageContext.request.contextPath}/login">
                Login
            </a>

            <a href="${pageContext.request.contextPath}/register">
                Create account
            </a>

            <a href="${pageContext.request.contextPath}/orders">
                Order history
            </a>

            <a href="${pageContext.request.contextPath}/cart">
                My cart
            </a>

        </div>


        <div class="footer-column">

            <h3>Platform</h3>

            <a href="${pageContext.request.contextPath}/#products">
                Product catalog
            </a>

        </div>

    </div>


    <div class="footer-bottom">

        &copy; 2026
        <strong>ShopEase</strong>
        &middot; Java + Spring MVC + Hibernate + Oracle

    </div>

</footer>