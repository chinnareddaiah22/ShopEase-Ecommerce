<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <title>My Orders | ShopEase</title>

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
            min-height: 100vh;
        }

        .container {
            width: 92%;
            max-width: 1100px;
            margin: 45px auto;
        }

        .page-header {
            margin-bottom: 28px;
        }

        .page-header small {
            color: #6366f1;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1.5px;
        }

        .page-header h1 {
            margin-top: 7px;
            font-size: 32px;
            color: #111827;
        }

        .page-header p {
            margin-top: 8px;
            color: #6b7280;
            font-size: 14px;
        }

        .table-container {
            background: #ffffff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.06);
        }

        .table-wrapper {
            overflow-x: auto;
        }

        .table {
            width: 100%;
            min-width: 650px;
            border-collapse: collapse;
        }

        .table th {
            background: #111827;
            color: #ffffff;
            padding: 17px 20px;
            text-align: left;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.7px;
        }

        .table td {
            padding: 19px 20px;
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

        .order-id {
            color: #4f46e5;
            font-weight: 700;
            font-size: 14px;
        }

        .order-date {
            color: #6b7280;
            font-size: 13px;
        }

        .order-total {
            color: #111827;
            font-weight: 700;
        }

        .status {
            display: inline-block;
            padding: 7px 13px;
            border-radius: 20px;
            background: #eef2ff;
            color: #4f46e5;
            font-size: 12px;
            font-weight: 700;
            white-space: nowrap;
        }

        .empty {
            background: #ffffff;
            border-radius: 16px;
            padding: 70px 25px;
            text-align: center;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.06);
        }

        .empty-icon {
            font-size: 50px;
            margin-bottom: 18px;
        }

        .empty h2 {
            color: #111827;
            font-size: 23px;
            margin-bottom: 9px;
        }

        .empty p {
            color: #6b7280;
            font-size: 14px;
            margin-bottom: 23px;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            background: #6366f1;
            color: #ffffff;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 700;
            transition: 0.3s ease;
        }

        .btn:hover {
            background: #4f46e5;
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(99, 102, 241, 0.25);
        }

        @media (max-width: 650px) {

            .container {
                width: 95%;
                margin: 30px auto;
            }

            .page-header h1 {
                font-size: 27px;
            }

            .table {
                min-width: 600px;
            }

            .empty {
                padding: 55px 20px;
            }

        }

    </style>

</head>

<body>

<%@ include file="common/navbar.jsp" %>

<main class="container">

    <div class="page-header">

        <small>MY ACCOUNT</small>

        <h1>My Orders</h1>

        <p>
            View your previous orders and track their status.
        </p>

    </div>


    <c:choose>

        <c:when test="${empty orders}">

            <div class="empty">

                <div class="empty-icon">
                    📦
                </div>

                <h2>
                    No orders yet.
                </h2>

                <p>
                    Your completed orders will appear here.
                </p>

                <a
                    class="btn"
                    href="${pageContext.request.contextPath}/">

                    Start Shopping

                </a>

            </div>

        </c:when>


        <c:otherwise>

            <div class="table-container">

                <div class="table-wrapper">

                    <table class="table">

                        <thead>

                            <tr>

                                <th>Order ID</th>

                                <th>Date</th>

                                <th>Total</th>

                                <th>Status</th>

                            </tr>

                        </thead>

                        <tbody>

                            <c:forEach var="o" items="${orders}">

                                <tr>

                                    <td>

                                        <span class="order-id">
                                            #${o.id}
                                        </span>

                                    </td>

                                    <td>

                                        <span class="order-date">
                                            ${o.orderDate}
                                        </span>

                                    </td>

                                    <td>

                                        <span class="order-total">
                                            ₹ ${o.totalAmount}
                                        </span>

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

            </div>

        </c:otherwise>

    </c:choose>

</main>

</body>

</html>