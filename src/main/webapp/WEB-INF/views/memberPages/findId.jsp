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
    <style>@import url(http://fonts.googleapis.com/css?family=Roboto:400,100);

    .login-card {
        padding: 40px;
        width: 274px;
        background-color: #F7F7F7;
        margin: 200px auto;
        border-radius: 2px;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        overflow: hidden;

    }

    .login-card h1 {
        font-weight: 100;
        text-align: center;
        font-size: 2.3em;
    }

    .login-card input[type=submit] {
        width: 100%;
        display: block;
        margin-bottom: 10px;
        position: relative;
    }

    .login-card input[type=text], input[type=password] {
        height: 44px;
        font-size: 16px;
        width: 100%;
        margin-bottom: 10px;
        -webkit-appearance: none;
        background: #fff;
        border: 1px solid #d9d9d9;
        border-top: 1px solid #c0c0c0;
        /* border-radius: 2px; */
        padding: 0 8px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
    }

    .login-card input[type=text]:hover, input[type=password]:hover {
        border: 1px solid #b9b9b9;
        border-top: 1px solid #a0a0a0;
        -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
        -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
        box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
    }

    .login {
        text-align: center;
        font-size: 14px;
        font-family: 'Arial', sans-serif;
        font-weight: 700;
        height: 36px;
        padding: 0 8px;
        /* border-radius: 3px; */
        /* -webkit-user-select: none;
          user-select: none; */
    }

    .login-submit {
        border: 0px;
        text-align: center;
        color: #fff;
        text-shadow: 0 1px rgba(0, 0, 0, 0.1);
        background-color: #4d90fe;
    }

    .login-submit:hover {
        /* border: 1px solid #2f5bb7; */
        border: 0px;
        text-shadow: 0 1px rgba(0, 0, 0, 0.3);
        background-color: #357ae8;
        /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
    }

    .login-card a {
        text-decoration: none;
        color: #666;
        font-weight: 400;
        text-align: center;
        display: inline-block;
        opacity: 0.6;
        transition: opacity ease 0.5s;
    }

    .login-card a:hover {
        opacity: 1;
    }
    </style>
</head>
<body>
<div class="login-card"><h1>아이디찾기</h1><br>
    <form name="findIdForm" action="/member/findId" method="post">
        <input type="text" id="memberName" name="memberName" placeholder="이름"autofocus required>
        <input type="text" id="memberEmail" name="memberEmail" placeholder="이메일" required>
        <input type="button" onclick="findResult()" class="login-submit btn btn-lg d-grid mx-auto" value="아이디찾기">
    </form>
</div>
</body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>


<script>
    const findResult = () => {
        const name = document.getElementById("memberName").value;
        const email = document.getElementById("memberEmail").value;

        $.ajax({
            type: "post",
            url: "/member/findId",
            data: {"memberName": name, "memberEmail":email},
            dataType: "text",
            success: function (findResult) {
                if (findResult != "no") {
                    alert("아이디는 " + findResult + " 입니다");
                } else {
                    alert("해당 아이디 또는 이메일이 없습니다");
                }
            }

        });
    }
</script>
</html>
