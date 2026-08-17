<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <meta charset="UTF-8">

    <title>Register | ShopEase</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;

            min-height: 100vh;

            background:
                radial-gradient(
                    circle at 15% 20%,
                    rgba(99,102,241,0.15),
                    transparent 30%
                ),
                radial-gradient(
                    circle at 85% 80%,
                    rgba(79,70,229,0.12),
                    transparent 30%
                ),
                #f4f6f9;

            color: #1f2937;
        }

        /* =========================
           AUTH WRAPPER
           ========================= */

        .auth-wrap {
            min-height: calc(100vh - 70px);

            display: flex;

            justify-content: center;

            align-items: center;

            padding: 45px 20px;
        }

        /* =========================
           REGISTER CARD
           ========================= */

        .auth-card {
            width: 100%;

            max-width: 460px;

            background: #ffffff;

            padding: 40px;

            border-radius: 18px;

            border: 1px solid #e5e7eb;

            box-shadow:
                0 15px 45px rgba(0,0,0,0.09);
        }

        /* =========================
           ICON
           ========================= */

        .auth-icon {
            width: 52px;

            height: 52px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #eef2ff;

            color: #4f46e5;

            border-radius: 14px;

            font-size: 25px;

            font-weight: 700;

            margin-bottom: 22px;
        }

        /* =========================
           HEADER
           ========================= */

        .auth-card h1 {
            font-size: 30px;

            color: #111827;

            margin-bottom: 8px;
        }

        .subtitle {
            color: #6b7280;

            font-size: 14px;

            margin-bottom: 25px;

            line-height: 1.6;
        }

        /* =========================
           ALERT
           ========================= */

        .alert {
            padding: 13px 15px;

            border-radius: 8px;

            margin-bottom: 20px;

            font-size: 13px;

            line-height: 1.5;
        }

        .alert.error {
            background: #fef2f2;

            border: 1px solid #fecaca;

            color: #b91c1c;
        }

        /* =========================
           FORM
           ========================= */

        form {
            display: flex;

            flex-direction: column;
        }

        label {
            color: #374151;

            font-size: 13px;

            font-weight: 700;

            margin-bottom: 7px;
        }

        input {
            width: 100%;

            padding: 13px 14px;

            border: 1px solid #d1d5db;

            border-radius: 8px;

            outline: none;

            font-size: 14px;

            color: #111827;

            background: #ffffff;

            margin-bottom: 18px;

            transition: 0.25s ease;
        }

        input:focus {
            border-color: #6366f1;

            box-shadow:
                0 0 0 3px rgba(99,102,241,0.12);
        }

        input::placeholder {
            color: #9ca3af;
        }

        /* =========================
           PASSWORD HELP
           ========================= */

        .password-help {
            display: block;

            color: #6b7280;

            font-size: 12px;

            margin-top: -11px;

            margin-bottom: 20px;

            line-height: 1.5;
        }

        /* =========================
           BUTTON
           ========================= */

        .btn {
            display: inline-block;

            width: 100%;

            border: none;

            background: #6366f1;

            color: #ffffff;

            padding: 13px 20px;

            border-radius: 8px;

            font-size: 14px;

            font-weight: 700;

            cursor: pointer;

            text-decoration: none;

            transition: all 0.3s ease;
        }

        .btn:hover {
            background: #4f46e5;

            transform: translateY(-2px);

            box-shadow:
                0 7px 18px rgba(99,102,241,0.28);
        }

        /* =========================
           LOGIN LINK
           ========================= */

        .center {
            text-align: center;

            color: #6b7280;

            font-size: 13px;

            margin-top: 25px;
        }

        .center a {
            color: #4f46e5;

            font-weight: 700;

            text-decoration: none;
        }

        .center a:hover {
            text-decoration: underline;
        }

        /* =========================
           SECURITY NOTE
           ========================= */

        .security-note {
            margin-top: 22px;

            padding: 12px 14px;

            background: #f8fafc;

            border: 1px solid #e5e7eb;

            border-radius: 8px;

            color: #64748b;

            font-size: 11px;

            line-height: 1.6;

            text-align: center;
        }

        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 500px) {

            .auth-wrap {
                padding: 30px 15px;
            }

            .auth-card {
                padding: 30px 24px;

                border-radius: 15px;
            }

            .auth-card h1 {
                font-size: 26px;
            }

        }

    </style>

</head>


<body>


<!-- =========================
     NAVBAR
     ========================= -->

<%@ include file="common/navbar.jsp" %>


<!-- =========================
     REGISTER
     ========================= -->

<div class="auth-wrap">


    <div class="auth-card">


        <!-- ICON -->

        <div class="auth-icon">
            +
        </div>


        <!-- HEADER -->

        <h1>
            Create account
        </h1>

        <p class="subtitle">
            Join ShopEase today and start shopping.
        </p>


        <!-- ERROR -->

        <c:if test="${not empty error}">

            <div class="alert error">
                ${error}
            </div>

        </c:if>


        <!-- =========================
             REGISTER FORM
             ========================= -->

        <form
            method="post"
            action="${pageContext.request.contextPath}/register">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">



            <!-- NAME -->

            <label for="name">
                Full Name
            </label>

            <input
                id="name"
                name="name"
                maxlength="100"
                placeholder="Enter your full name"
                autocomplete="name"
                required>


            <!-- EMAIL -->

            <label for="email">
                Email
            </label>

            <input
                id="email"
                name="email"
                type="email"
                maxlength="150"
                placeholder="Enter your email"
                autocomplete="email"
                required>


            <!-- PASSWORD -->

            <label for="password">
                Password
            </label>

            <input
                id="password"
                name="password"
                type="password"
                minlength="8"
                placeholder="Create a password"
                autocomplete="new-password"
                required>

            <small class="password-help">
                Minimum 8 characters.
            </small>


            <!-- SUBMIT -->

            <button
                type="submit"
                class="btn">

                Create Account

            </button>


        </form>


        <!-- LOGIN -->

        <p class="center">

            Already registered?

            <a
                href="${pageContext.request.contextPath}/login">

                Login

            </a>

        </p>


        <!-- SECURITY NOTE -->

        <div class="security-note">

            🔒 Your account information is securely processed
            by the ShopEase application.

        </div>


    </div>

</div>


</body>

</html>