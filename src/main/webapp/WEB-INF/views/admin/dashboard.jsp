<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <meta charset="UTF-8">

    <title>ShopEase - Admin Dashboard</title>

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
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
        }

        /* =========================
           ADMIN HEADER
           ========================= */

        .admin-head {
            display: flex;
            justify-content: space-between;
            align-items: center;

            background: #ffffff;

            padding: 25px 30px;

            border-radius: 14px;

            box-shadow: 0 5px 20px rgba(0,0,0,0.06);

            margin-bottom: 30px;
        }

        .admin-head small {
            color: #6366f1;

            font-size: 12px;

            font-weight: bold;

            letter-spacing: 1.5px;
        }

        .admin-head h1 {
            margin-top: 7px;

            font-size: 30px;

            color: #111827;
        }

        /* =========================
           BUTTONS
           ========================= */

        .btn {
            display: inline-block;

            text-decoration: none;

            background: #6366f1;

            color: #ffffff;

            padding: 11px 18px;

            margin-left: 10px;

            border-radius: 8px;

            font-size: 14px;

            font-weight: 600;

            transition: 0.3s;
        }

        .btn:hover {
            background: #4f46e5;

            transform: translateY(-2px);

            box-shadow: 0 5px 12px rgba(99,102,241,0.3);
        }

        /* =========================
           STAT CARDS
           ========================= */

        .stats {
            display: grid;

            grid-template-columns: repeat(2, 1fr);

            gap: 25px;

            margin-bottom: 40px;
        }

        .stats > div {
            background: #ffffff;

            padding: 28px;

            border-radius: 14px;

            box-shadow: 0 5px 20px rgba(0,0,0,0.06);

            position: relative;

            overflow: hidden;
        }

        .stats > div::before {
            content: "";

            position: absolute;

            left: 0;

            top: 0;

            width: 5px;

            height: 100%;

            background: #6366f1;
        }

        .stats small {
            display: block;

            color: #6b7280;

            font-size: 14px;

            margin-bottom: 10px;
        }

        .stats b {
            font-size: 32px;

            color: #111827;
        }

        /* =========================
           RECENT ORDERS
           ========================= */

        h2 {
            margin-bottom: 18px;

            font-size: 22px;

            color: #111827;
        }

        .table-container {
            background: #ffffff;

            border-radius: 14px;

            overflow: hidden;

            box-shadow: 0 5px 20px rgba(0,0,0,0.06);
        }

        .table {
            width: 100%;

            border-collapse: collapse;

            background: #ffffff;
        }

        .table th {
            background: #111827;

            color: #ffffff;

            padding: 16px;

            text-align: left;

            font-size: 13px;

            text-transform: uppercase;

            letter-spacing: 0.5px;
        }

        .table td {
            padding: 16px;

            border-bottom: 1px solid #e5e7eb;

            color: #4b5563;

            font-size: 14px;
        }

        .table tr:last-child td {
            border-bottom: none;
        }

        .table tr:hover {
            background: #f9fafb;
        }

        /* =========================
           STATUS
           ========================= */

        .status {
            display: inline-block;

            padding: 6px 12px;

            border-radius: 20px;

            background: #eef2ff;

            color: #4f46e5;

            font-size: 12px;

            font-weight: 600;
        }

        /* =========================
           EMPTY ORDERS
           ========================= */

        .empty {
            text-align: center;

            padding: 40px;

            color: #6b7280;

            background: #ffffff;

            border-radius: 14px;
        }

        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 700px) {

            .admin-head {
                flex-direction: column;

                align-items: flex-start;

                gap: 20px;
            }

            .admin-head .btn:first-child {
                margin-left: 0;
            }

            .stats {
                grid-template-columns: 1fr;
            }

            .table-container {
                overflow-x: auto;
            }

            .table {
                min-width: 650px;
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

        <div>

            <small>ADMIN PANEL</small>

            <h1>Dashboard</h1>

        </div>


        <div>

            <a class="btn"
               href="${pageContext.request.contextPath}/admin/products">
                Products
            </a>

            <a class="btn"
               href="${pageContext.request.contextPath}/admin/orders">
                Orders
            </a>

        </div>

    </div>


    <!-- =========================
         STATISTICS
         ========================= -->

    <div class="stats">

        <div>

            <small>Total Products</small>

            <b>${products.size()}</b>

        </div>


        <div>

            <small>Total Orders</small>

            <b>${orders.size()}</b>

        </div>

    </div>


    <!-- =========================
         RECENT ORDERS
         ========================= -->

    <h2>Recent Orders</h2>


    <c:choose>

        <c:when test="${not empty orders}">

            <div class="table-container">

                <table class="table">

                    <thead>

                        <tr>

                            <th>ID</th>

                            <th>User ID</th>

                            <th>Total</th>

                            <th>Status</th>

                        </tr>

                    </thead>


                    <tbody>

                        <c:forEach var="o" items="${orders}">

                            <tr>

                                <td>
                                    #${o.id}
                                </td>

                                <td>
                                    ${o.userId}
                                </td>

                                <td>
                                    ₹ ${o.totalAmount}
                                </td>

                                <td>

                                    <span class="status">
                                        ${o.status}
                                    </span>

                                </td>

                            </tr>

                        </c:forEach>

                    </tbody>

                </table>

            </div>

        </c:when>


        <c:otherwise>

            <div class="empty">

                <p>No orders available.</p>

            </div>

        </c:otherwise>

    </c:choose>

</main>

</body>

</html>