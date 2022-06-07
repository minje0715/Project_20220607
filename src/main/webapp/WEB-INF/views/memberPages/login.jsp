<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        header {
            display: flex;
            justify-content: center;
        }

        form {
            padding: 10px;
        }

        .input-box {
            position: relative;
            margin: 10px 0;
        }

        .input-box > input {
            background: transparent;
            border: none;
            border-bottom: solid 1px #ccc;
            padding: 20px 0px 5px 0px;
            font-size: 14pt;
            width: 100%;
        }

        input::placeholder {
            color: transparent;
        }

        input:placeholder-shown + label {
            color: #aaa;
            font-size: 14pt;
            top: 15px;

        }

        input:focus + label, label {
            color: #8aa1a1;
            font-size: 10pt;
            pointer-events: none;
            position: absolute;
            left: 0px;
            top: 0px;
            transition: all 0.2s ease;
            -webkit-transition: all 0.2s ease;
            -moz-transition: all 0.2s ease;
            -o-transition: all 0.2s ease;
        }

        input:focus, input:not(:placeholder-shown) {
            border-bottom: solid 1px #8aa1a1;
            outline: none;
        }

        button {
            background-color: #8aa1a1;
            border: none;
            color: white;
            border-radius: 5px;
            width: 100%;
            height: 35px;
            font-size: 14pt;
            margin-top: 100px;
        }

        .width{
            max-width: 700px;
        }

    </style>
</head>
<body>
<div class="width container mt-5">
<form action="/member/login" method="post">
    <div class="input-box">
        <input type="text" id="memberId" name="memberId" placeholder="아이디" required>
        <label for="memberId">아이디</label>
    </div>
    <div class="input-box">
        <input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호" required>
        <label for="memberPassword">비밀번호</label>
    </div>
    <button>로그인</button>
</form>
</div>
</body>
</html>
