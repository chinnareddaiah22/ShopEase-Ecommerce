<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <meta charset="UTF-8">

    <title>ShopEase - Product Form</title>

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
           FORM CONTAINER
           ========================= */

        .form-box {
            width: 90%;
            max-width: 700px;

            margin: 45px auto;

            background: #ffffff;

            padding: 35px;

            border-radius: 16px;

            box-shadow: 0 8px 30px rgba(0,0,0,0.07);
        }

        .form-box.wide {
            max-width: 850px;
        }

        /* =========================
           HEADER
           ========================= */

        .form-header {
            margin-bottom: 30px;

            padding-bottom: 20px;

            border-bottom: 1px solid #e5e7eb;
        }

        .form-header small {
            color: #6366f1;

            font-size: 12px;

            font-weight: 700;

            letter-spacing: 1.5px;
        }

        .form-header h1 {
            margin-top: 7px;

            font-size: 30px;

            color: #111827;
        }

        .form-header p {
            margin-top: 8px;

            color: #6b7280;

            font-size: 14px;
        }

        /* =========================
           ALERT
           ========================= */

        .alert {
            padding: 13px 16px;

            border-radius: 8px;

            margin-bottom: 22px;

            font-size: 14px;
        }

        .alert.error {
            background: #fef2f2;

            border: 1px solid #fecaca;

            color: #b91c1c;
        }

        /* =========================
           FORM
           ========================= */

        .product-form {
            display: flex;

            flex-direction: column;

            gap: 7px;
        }

        label {
            margin-top: 13px;

            margin-bottom: 4px;

            font-size: 14px;

            font-weight: 600;

            color: #374151;
        }

        input,
        textarea {
            width: 100%;

            padding: 12px 14px;

            border: 1px solid #d1d5db;

            border-radius: 8px;

            background: #ffffff;

            color: #111827;

            font-size: 14px;

            outline: none;

            transition: 0.25s ease;
        }

        input:focus,
        textarea:focus {
            border-color: #6366f1;

            box-shadow: 0 0 0 3px rgba(99,102,241,0.12);
        }

        textarea {
            min-height: 130px;

            resize: vertical;

            line-height: 1.6;
        }

        /* =========================
           PRICE + STOCK
           ========================= */

        .form-row {
            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 20px;
        }

        /* =========================
           IMAGE URL
           ========================= */

        .image-help {
            color: #9ca3af;

            font-size: 12px;

            margin-top: 3px;
        }

        /* =========================
           BUTTON
           ========================= */

        .form-actions {
            margin-top: 28px;

            display: flex;

            justify-content: flex-end;

            gap: 12px;
        }

        .btn {
            display: inline-block;

            border: none;

            background: #6366f1;

            color: #ffffff;

            padding: 12px 24px;

            border-radius: 8px;

            font-size: 14px;

            font-weight: 700;

            cursor: pointer;

            text-decoration: none;

            transition: 0.3s ease;
        }

        .btn:hover {
            background: #4f46e5;

            transform: translateY(-2px);

            box-shadow: 0 6px 15px rgba(99,102,241,0.25);
        }

        .btn-cancel {
            background: #e5e7eb;

            color: #374151;
        }

        .btn-cancel:hover {
            background: #d1d5db;

            color: #111827;

            box-shadow: none;
        }

        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 650px) {

            .form-box {
                width: 94%;

                padding: 25px 20px;

                margin: 30px auto;
            }

            .form-header h1 {
                font-size: 25px;
            }

            .form-row {
                grid-template-columns: 1fr;

                gap: 0;
            }

            .form-actions {
                flex-direction: column;
            }

            .form-actions .btn {
                width: 100%;

                text-align: center;
            }

        }

    </style>

</head>


<body>

<%@ include file="../common/navbar.jsp" %>


<div class="form-box wide">


    <!-- =========================
         FORM HEADER
         ========================= -->

    <div class="form-header">

        <small>ADMIN PANEL</small>

        <h1>Product</h1>

        <p>
            Add a new product or update an existing product.
        </p>

    </div>


    <!-- =========================
         ERROR MESSAGE
         ========================= -->

    <c:if test="${not empty error}">

        <div class="alert error">
            ${error}
        </div>

    </c:if>


    <!-- =========================
         PRODUCT FORM
         ========================= -->

    <form
        class="product-form"
        method="post"
        action="${pageContext.request.contextPath}/admin/products/save">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">



        <!-- Product ID -->

        <input
            type="hidden"
            name="id"
            value="${product.id}">


        <!-- Name -->

        <label for="name">
            Product Name
        </label>

        <input
            id="name"
            name="name"
            value="${product.name}"
            placeholder="Enter product name"
            required
            maxlength="150">


        <!-- Description -->

        <label for="description">
            Description
        </label>

        <textarea
            id="description"
            name="description"
            maxlength="1000"
            placeholder="Enter product description">${product.description}</textarea>


        <!-- Price + Stock -->

        <div class="form-row">

            <div>

                <label for="price">
                    Price (₹)
                </label>

                <input
                    id="price"
                    name="price"
                    value="${product.price}"
                    type="number"
                    min="0"
                    step="0.01"
                    placeholder="0.00"
                    required>

            </div>


            <div>

                <label for="stock">
                    Stock Quantity
                </label>

                <input
                    id="stock"
                    name="stock"
                    value="${product.stock}"
                    type="number"
                    min="0"
                    placeholder="0"
                    required>

            </div>

        </div>


        <!-- Image URL -->

        <label for="imageUrl">
            Image URL
        </label>

        <input
            id="imageUrl"
            name="imageUrl"
            value="${product.imageUrl}"
            placeholder="https://example.com/product.jpg">

        <div class="image-help">
            Enter the URL of the product image.
        </div>


        <!-- Actions -->

        <div class="form-actions">

            <a
                class="btn btn-cancel"
                href="${pageContext.request.contextPath}/admin/products">
                Cancel
            </a>


            <button
                type="submit"
                class="btn">
                Save Product
            </button>

        </div>


    </form>

</div>


</body>

</html>