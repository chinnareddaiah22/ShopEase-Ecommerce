<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <meta charset="UTF-8">

    <title>ShopEase - Manage Products</title>

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

        /* =========================
           CONTAINER
           ========================= */

        .container {
            width: 92%;
            max-width: 1250px;

            margin: 40px auto;
        }

        /* =========================
           HEADER
           ========================= */

        .admin-head {
            display: flex;

            justify-content: space-between;

            align-items: center;

            background: #ffffff;

            padding: 25px 30px;

            border-radius: 14px;

            margin-bottom: 25px;

            box-shadow: 0 5px 20px rgba(0,0,0,0.06);
        }

        .admin-title small {
            color: #6366f1;

            font-size: 12px;

            font-weight: 700;

            letter-spacing: 1.5px;
        }

        .admin-title h1 {
            margin-top: 7px;

            font-size: 30px;

            color: #111827;
        }

        .admin-title p {
            margin-top: 7px;

            color: #6b7280;

            font-size: 14px;
        }

        /* =========================
           BUTTON
           ========================= */

        .btn {
            display: inline-block;

            text-decoration: none;

            border: none;

            background: #6366f1;

            color: #ffffff;

            padding: 12px 19px;

            border-radius: 8px;

            font-size: 14px;

            font-weight: 700;

            cursor: pointer;

            transition: 0.3s ease;
        }

        .btn:hover {
            background: #4f46e5;

            transform: translateY(-2px);

            box-shadow: 0 5px 14px rgba(99,102,241,0.25);
        }

        /* =========================
           TABLE CARD
           ========================= */

        .table-container {
            background: #ffffff;

            border-radius: 14px;

            overflow: hidden;

            box-shadow: 0 5px 20px rgba(0,0,0,0.06);
        }

        .table-wrapper {
            overflow-x: auto;
        }

        .table {
            width: 100%;

            min-width: 850px;

            border-collapse: collapse;
        }

        /* =========================
           TABLE HEADER
           ========================= */

        .table th {
            background: #111827;

            color: #ffffff;

            padding: 17px 16px;

            text-align: left;

            font-size: 12px;

            text-transform: uppercase;

            letter-spacing: 0.6px;

            white-space: nowrap;
        }

        /* =========================
           TABLE BODY
           ========================= */

        .table td {
            padding: 17px 16px;

            border-bottom: 1px solid #e5e7eb;

            color: #4b5563;

            font-size: 14px;

            vertical-align: middle;
        }

        .table tbody tr {
            transition: 0.2s ease;
        }

        .table tbody tr:hover {
            background: #f8fafc;
        }

        .table tbody tr:last-child td {
            border-bottom: none;
        }

        /* =========================
           PRODUCT NAME
           ========================= */

        .product-name {
            color: #111827;

            font-weight: 600;
        }

        /* =========================
           PRODUCT ID
           ========================= */

        .product-id {
            color: #6366f1;

            font-weight: 700;
        }

        /* =========================
           PRICE
           ========================= */

        .price {
            color: #111827;

            font-weight: 700;
        }

        /* =========================
           STOCK
           ========================= */

        .stock {
            font-weight: 600;
        }

        /* =========================
           ACTIVE STATUS
           ========================= */

        .active {
            display: inline-block;

            padding: 6px 12px;

            border-radius: 20px;

            background: #dcfce7;

            color: #15803d;

            font-size: 12px;

            font-weight: 700;
        }

        /* =========================
           ACTIONS
           ========================= */

        .actions {
            display: flex;

            align-items: center;

            gap: 8px;
        }

        .edit-btn {
            display: inline-block;

            padding: 8px 13px;

            border-radius: 7px;

            background: #eef2ff;

            color: #4f46e5;

            text-decoration: none;

            font-size: 13px;

            font-weight: 600;

            transition: 0.3s ease;
        }

        .edit-btn:hover {
            background: #e0e7ff;

            transform: translateY(-1px);
        }

        /* =========================
           DEACTIVATE
           ========================= */

        .inline {
            display: inline;
        }

        .danger {
            border: none;

            padding: 8px 13px;

            border-radius: 7px;

            background: #fee2e2;

            color: #dc2626;

            font-size: 13px;

            font-weight: 600;

            cursor: pointer;

            transition: 0.3s ease;
        }

        .danger:hover {
            background: #fecaca;

            color: #b91c1c;

            transform: translateY(-1px);
        }

        /* =========================
           EMPTY PRODUCTS
           ========================= */

        .empty {
            background: #ffffff;

            text-align: center;

            padding: 60px 20px;

            border-radius: 14px;

            box-shadow: 0 5px 20px rgba(0,0,0,0.06);
        }

        .empty h2 {
            color: #374151;

            margin-bottom: 8px;
        }

        .empty p {
            color: #6b7280;

            font-size: 14px;
        }

        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 700px) {

            .container {
                width: 95%;

                margin: 25px auto;
            }

            .admin-head {
                flex-direction: column;

                align-items: flex-start;

                gap: 20px;

                padding: 22px;
            }

            .admin-title h1 {
                font-size: 25px;
            }

            .btn {
                width: 100%;

                text-align: center;
            }

        }

    </style>

</head>


<body>

<%@ include file="../common/navbar.jsp" %>


<main class="container">


    <!-- =========================
         ADMIN HEADER
         ========================= -->

    <div class="admin-head">

        <div class="admin-title">

            <small>ADMIN PANEL</small>

            <h1>Manage Products</h1>

            <p>
                Add, edit and manage products in your ShopEase store.
            </p>

        </div>


        <a
            class="btn"
            href="${pageContext.request.contextPath}/admin/products/new">

            + Add Product

        </a>

    </div>


    <!-- =========================
         PRODUCT TABLE
         ========================= -->

    <c:choose>

        <c:when test="${not empty products}">

            <div class="table-container">

                <div class="table-wrapper">

                    <table class="table">

                        <thead>

                            <tr>

                                <th>ID</th>

                                <th>Product</th>

                                <th>Price</th>

                                <th>Stock</th>

                                <th>Active</th>

                                <th>Actions</th>

                            </tr>

                        </thead>


                        <tbody>

                            <c:forEach var="p" items="${products}">

                                <tr>

                                    <!-- ID -->

                                    <td>

                                        <span class="product-id">
                                            #${p.id}
                                        </span>

                                    </td>


                                    <!-- Product -->

                                    <td>

                                        <span class="product-name">
                                            ${p.name}
                                        </span>

                                    </td>


                                    <!-- Price -->

                                    <td>

                                        <span class="price">
                                            ₹ ${p.price}
                                        </span>

                                    </td>


                                    <!-- Stock -->

                                    <td>

                                        <span class="stock">
                                            ${p.stock}
                                        </span>

                                    </td>


                                    <!-- Active -->

                                    <td>

                                        <c:choose>

                                            <c:when test="${p.active}">

                                                <span class="active">
                                                    ACTIVE
                                                </span>

                                            </c:when>

                                            <c:otherwise>

                                                <span class="inactive">
                                                    INACTIVE
                                                </span>

                                            </c:otherwise>

                                        </c:choose>

                                    </td>


                                    <!-- Actions -->

                                    <td>

                                        <div class="actions">


                                            <!-- Edit -->

                                            <a
                                                class="edit-btn"
                                                href="${pageContext.request.contextPath}/admin/products/edit/${p.id}">

                                                Edit

                                            </a>


                                            <!-- Deactivate -->

                                            <form
                                                class="inline"
                                                method="post"
                                                action="${pageContext.request.contextPath}/admin/products/deactivate/${p.id}">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


                                                <button
                                                    type="submit"
                                                    class="danger">

                                                    Deactivate

                                                </button>

                                            </form>

                                        </div>

                                    </td>

                                </tr>

                            </c:forEach>

                        </tbody>

                    </table>

                </div>

            </div>

        </c:when>


        <c:otherwise>

            <div class="empty">

                <h2>No Products Found</h2>

                <p>
                    Start by adding your first product.
                </p>

                <br>

                <a
                    class="btn"
                    href="${pageContext.request.contextPath}/admin/products/new">

                    + Add Product

                </a>

            </div>

        </c:otherwise>

    </c:choose>


</main>

</body>

</html>