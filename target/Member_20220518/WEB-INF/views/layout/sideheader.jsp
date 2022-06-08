<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-06-08
  Time: 오전 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
    <style>
        /* 사이드바 래퍼 스타일 */

        #page-wrapper {
            padding-left: 250px;
        }

        #sidebar-wrapper {
            position: fixed;
            width: 250px;
            height: 100%;
            margin-left: -250px;
            background: #000;
            overflow-x: hidden;
            overflow-y: auto;
        }

        #page-content-wrapper {
            width: 100%;
            padding: 20px;
        }

        /* 사이드바 스타일 */

        .sidebar-nav {
            width: 250px;
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .sidebar-nav li {
            text-indent: 1.5em;
            line-height: 2.8em;
        }

        .sidebar-nav li a {
            display: block;
            text-decoration: none;
            color: #999;
        }

        .sidebar-nav li a:hover {
            color: #fff;
            background: rgba(255, 255, 255, 0.2);
        }

        .sidebar-nav > .sidebar-brand {
            font-size: 1.3em;
            line-height: 3em;
        }
    </style>
</head>
<body>
<header>
    <div id="page-wrapper">
        <!-- 사이드바 -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">menu</a>
                </li>
                <div>
                    <li><a href="#"><i style="color: white" class="bi bi-coin"></i> &nbsp; &nbsp; 구매</a></li>
                </div>
                <div>
                    <li><a href="#"><i style="color: white" class="bi bi-cart-dash-fill"></i> &nbsp; &nbsp; 판매</a></li>
                </div>
                <div>
                    <li><a href="#"><i style="color: white" class="bi bi-chat-left-text"></i> &nbsp; &nbsp; 거래내역</a>
                    </li>
                </div>
                <div>
                    <li><a href="#"><i style="color: white" class="bi bi-house-heart"></i> &nbsp; &nbsp; 홈으로</a></li>
                </div>
            </ul>
        </div>
</header>
</body>
</html>
