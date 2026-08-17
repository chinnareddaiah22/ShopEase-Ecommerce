<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="announcement-bar">

    <div class="announcement-inner">

        <span>
            &#10024; New arrivals are live &mdash; Fashion, Mobiles &amp; Sports Shoes
        </span>

        <a href="${pageContext.request.contextPath}/register">
            Create account &amp; get started &rarr;
        </a>

    </div>

</div>


<header class="site-nav">

    <div class="nav-inner">

        <a class="brand"
           href="${pageContext.request.contextPath}/"
           aria-label="ShopEase home">

            <span class="brand-mark">S</span>

            <span>
                Shop<span class="brand-accent">Ease</span>
            </span>

        </a>


        <button class="mobile-menu"
                type="button"
                aria-label="Open menu"
                aria-expanded="false"
                data-nav-toggle>

            <span></span>
            <span></span>
            <span></span>

        </button>


        <nav class="nav-links"
             data-nav-menu
             aria-label="Primary navigation">

            <a class="nav-link"
               href="${pageContext.request.contextPath}/">
                Home
            </a>

            <a class="nav-link"
               href="${pageContext.request.contextPath}/#products">
                Shop
            </a>


            <c:if test="${pageContext.request.userPrincipal != null}">

                <a class="nav-link nav-cart"
                   href="${pageContext.request.contextPath}/cart">
                    &#128722; Cart
                </a>

                <a class="nav-link"
                   href="${pageContext.request.contextPath}/orders">
                    Orders
                </a>

            </c:if>


            <c:if test="${pageContext.request.userPrincipal == null}">

                <a class="nav-link nav-cart"
                   href="${pageContext.request.contextPath}/login">
                    &#128722; Cart
                </a>

                <a class="nav-link"
                   href="${pageContext.request.contextPath}/login">
                    Login
                </a>

                <a class="nav-cta"
                   href="${pageContext.request.contextPath}/register">
                    Create account
                </a>

            </c:if>


            <c:if test="${pageContext.request.userPrincipal != null}">

                <c:if test="${pageContext.request.isUserInRole('ADMIN')}">

                    <a class="nav-link nav-admin"
                       href="${pageContext.request.contextPath}/admin">
                        Admin
                    </a>

                </c:if>


                <span class="user-chip">

                    <span class="user-avatar">&#128100;</span>

                    <span>
                        ${pageContext.request.userPrincipal.name}
                    </span>

                </span>


                <form class="nav-logout"
                      method="post"
                      action="${pageContext.request.contextPath}/logout">

                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}">

                    <button type="submit"
                            class="nav-link nav-logout-btn">
                        Logout
                    </button>

                </form>

            </c:if>

        </nav>

    </div>

</header>