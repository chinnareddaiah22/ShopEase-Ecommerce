```jsp
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <meta charset="UTF-8">

    <title>Login | ShopEase</title>

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
                    rgba(99,102,241,0.16),
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

        .auth-wrap {
            min-height: calc(100vh - 70px);

            display: flex;

            justify-content: center;

            align-items: center;

            padding: 50px 20px;
        }

        .auth-card {
            width: 100%;

            max-width: 440px;

            background: #ffffff;

            padding: 40px;

            border-radius: 18px;

            box-shadow:
                0 15px 45px rgba(0,0,0,0.09);

            border: 1px solid #e5e7eb;

            text-align: left;
        }

        .auth-icon {
            width: 52px;

            height: 52px;

            display: flex;

            justify-content: center;

            align-items: center;

            border-radius: 14px;

            background: #eef2ff;

            color: #4f46e5;

            font-size: 25px;

            font-weight: 700;

            margin-bottom: 22px;
        }

        .auth-card h1 {
            font-size: 30px;

            color: #111827;

            margin-bottom: 8px;
        }

        .auth-card > p {
            color: #6b7280;

            font-size: 14px;

            line-height: 1.6;

            margin-bottom: 25px;
        }

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

        .alert.success {
            background: #f0fdf4;

            border: 1px solid #bbf7d0;

            color: #15803d;
        }

        form {
            display: flex;

            flex-direction: column;
        }

        label {
            font-size: 13px;

            font-weight: 700;

            color: #374151;

            margin-bottom: 7px;
        }

        input {
            width: 100%;

            padding: 13px 14px;

            margin-bottom: 18px;

            border: 1px solid #d1d5db;

            border-radius: 8px;

            outline: none;

            font-size: 14px;

            color: #111827;

            background: #ffffff;

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

        .btn {
            display: inline-block;

            border: none;

            background: #6366f1;

            color: #ffffff;

            padding: 13px 20px;

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

            box-shadow:
                0 7px 18px rgba(99,102,241,0.28);
        }

        .full {
            width: 100%;

            text-align: center;

            margin-top: 5px;
        }

        .center {
            text-align: center;

            margin-top: 25px;

            margin-bottom: 0 !important;

            font-size: 13px !important;

            color: #6b7280 !important;
        }

        .center a {
            color: #4f46e5;

            font-weight: 700;

            text-decoration: none;
        }

        .center a:hover {
            text-decoration: underline;
        }

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


<!-- NAVBAR -->

<%@ include file="common/navbar.jsp" %>


<!-- LOGIN -->

<div class="auth-wrap">

    <div class="auth-card">


        <!-- ICON -->

        <div class="auth-icon">
            ↗
        </div>


        <!-- HEADER -->

        <h1>
            Welcome back
        </h1>

        <p>
            Login to continue shopping.
        </p>


        <!-- ERROR MESSAGE -->

        <% if (request.getParameter("error") != null) { %>

            <div class="alert error">
                Invalid email or password.
            </div>

        <% } %>


        <!-- REGISTERED MESSAGE -->

        <% if (request.getParameter("registered") != null) { %>

            <div class="alert success">
                Registration successful. Please login.
            </div>

        <% } %>


        <!-- LOGOUT MESSAGE -->

        <% if (request.getParameter("logout") != null) { %>

            <div class="alert success">
                You have been logged out.
            </div>

        <% } %>


        <!-- LOGIN FORM -->

        <form
            method="post"
            action="${pageContext.request.contextPath}/perform_login">


            <!-- CSRF TOKEN -->

            <input
                type="hidden"
                name="${_csrf.parameterName}"
                value="${_csrf.token}">


            <!-- EMAIL -->

            <label for="username">
                Email
            </label>

            <input
                id="username"
                type="email"
                name="username"
                placeholder="Enter your email"
                autocomplete="username"
                required>


            <!-- PASSWORD -->

            <label for="password">
                Password
            </label>

            <input
                id="password"
                type="password"
                name="password"
                placeholder="Enter your password"
                autocomplete="current-password"
                required>


            <!-- LOGIN BUTTON -->

            <button
                type="submit"
                class="btn full">

                Login

            </button>

        </form>


        <!-- REGISTER -->

        <p class="center">

            New customer?

            <a
                href="${pageContext.request.contextPath}/register">

                Create account

            </a>

        </p>


    </div>

</div>

</body>

</html>

