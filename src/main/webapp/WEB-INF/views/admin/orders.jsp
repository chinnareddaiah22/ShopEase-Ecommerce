<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <meta charset="UTF-8">

    <title>ShopEase - Manage Orders</title>

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
           MAIN CONTAINER
           ========================= */

        .container {
            width: 92%;
            max-width: 1250px;
            margin: 40px auto;
        }

        /* =========================
           PAGE HEADER
           ========================= */

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;

            background: #ffffff;

            padding: 25px 30px;

            border-radius: 14px;

            margin-bottom: 25px;

            box-shadow: 0 5px 20px rgba(0,0,0,0.06);
        }

        .page-header small {
            color: #6366f1;

            font-size: 12px;

            font-weight: bold;

            letter-spacing: 1.5px;
        }

        .page-header h1 {
            margin-top: 7px;

            font-size: 30px;

            color: #111827;
        }

        .page-header p {
            margin-top: 7px;

            color: #6b7280;

            font-size: 14px;
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

            border-collapse: collapse;

            min-width: 900px;
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
           ORDER ID
           ========================= */

        .order-id {
            color: #4f46e5;

            font-weight: 700;
        }

        /* =========================
           TOTAL PRICE
           ========================= */

        .total {
            color: #111827;

            font-weight: 700;
        }

        /* =========================
           STATUS BADGE
           ========================= */

        .status {
            display: inline-block;

            padding: 6px 12px;

            border-radius: 20px;

            background: #eef2ff;

            color: #4f46e5;

            font-size: 12px;

            font-weight: 700;

            white-space: nowrap;
        }

        /* =========================
           UPDATE FORM
           ========================= */

        .update-form {
            display: flex;

            align-items: center;

            gap: 8px;
        }

        .status-select {
            padding: 9px 10px;

            border: 1px solid #d1d5db;

            border-radius: 7px;

            background: #ffffff;

            color: #374151;

            font-size: 13px;

            outline: none;

            cursor: pointer;
        }

        .status-select:focus {
            border-color: #6366f1;

            box-shadow: 0 0 0 2px rgba(99,102,241,0.12);
        }

        /* =========================
           UPDATE BUTTON
           ========================= */

        .update-btn {
            border: none;

            background: #6366f1;

            color: #ffffff;

            padding: 9px 15px;

            border-radius: 7px;

            font-size: 13px;

            font-weight: 600;

            cursor: pointer;

            transition: 0.3s ease;
        }

        .update-btn:hover {
            background: #4f46e5;

            transform: translateY(-1px);

            box-shadow: 0 4px 10px rgba(99,102,241,0.25);
        }

        /* =========================
           EMPTY ORDERS
           ========================= */

        .empty {
            background: #ffffff;

            padding: 60px 20px;

            text-align: center;

            border-radius: 14px;

            box-shadow: 0 5px 20px rgba(0,0,0,0.06);

            color: #6b7280;
        }

        .empty h2 {
            color: #374151;

            margin-bottom: 8px;
        }

        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 700px) {

            .container {
                width: 95%;

                margin: 25px auto;
            }

            .page-header {
                padding: 22px;

                align-items: flex-start;
            }

            .page-header h1 {
                font-size: 25px;
            }

        }

    </style>

</head>


<body>

<%@ include file="../common/navbar.jsp" %>


<main class="container">


    <!-- =========================
         PAGE HEADER
         ========================= -->

    <div class="page-header">

        <div>

            <small>ADMIN PANEL</small>

            <h1>Manage Orders</h1>

            <p>
                View and update customer order status.
            </p>

        </div>

    </div>


    <!-- =========================
         ORDERS
         ========================= -->

    <c:choose>

        <c:when test="${not empty orders}">

            <div class="table-container">

                <div class="table-wrapper">

                    <table class="table">

                        <thead>

                            <tr>

                                <th>ID</th>

                                <th>User</th>

                                <th>Total</th>

                                <th>Date</th>

                                <th>Status</th>

                                <th>Update</th>

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
                                        ${o.userId}
                                    </td>


                                    <td>
                                        <span class="total">
                                            ₹ ${o.totalAmount}
                                        </span>
                                    </td>


                                    <td>
                                        ${o.orderDate}
                                    </td>


                                    <td>

                                        <span class="status">
                                            ${o.status}
                                        </span>

                                    </td>


                                    <td>

                                        <form
                                            class="update-form"
                                            method="post"
                                            action="${pageContext.request.contextPath}/admin/orders/status">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


                                            <input
                                                type="hidden"
                                                name="orderId"
                                                value="${o.id}">


                                            <select
                                                class="status-select"
                                                name="status">

                                                <option value="PLACED">
                                                    PLACED
                                                </option>

                                                <option value="PACKED">
                                                    PACKED
                                                </option>

                                                <option value="SHIPPED">
                                                    SHIPPED
                                                </option>

                                                <option value="DELIVERED">
                                                    DELIVERED
                                                </option>

                                                <option value="CANCELLED">
                                                    CANCELLED
                                                </option>

                                            </select>


                                            <button
                                                type="submit"
                                                class="update-btn">

                                                Update

                                            </button>

                                        </form>

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

                <h2>No Orders Found</h2>

                <p>
                    There are currently no customer orders.
                </p>

            </div>

        </c:otherwise>

    </c:choose>


</main>

</body>

</html>