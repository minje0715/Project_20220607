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
<div class="login-card"><h1>로그인</h1><br>
    <form name="loginForm" action="/member/login" method="post">
            <input type="text" id="memberId" name="memberId" placeholder="아이디"autofocus required>
        <input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호" required>
        <input type="button" onclick="goAjax()" class="login-submit btn btn-lg d-grid mx-auto" value="로그인">
    </form>
    <div>
        <a href="/member/findId">아이디찾기</a>｜<a href="/member/findPw">비밀번호찾기</a>
    </div>
</div>
</body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script>
    const goAjax = () => {
        const id = document.getElementById("memberId").value;
        const pw = document.getElementById("memberPassword").value;

        console.log(id, pw);

        $.ajax({
            type: "post",
            url: "/member/loginCheck",
            data: {"memberId": id, "memberPassword":pw},
            dataType: "text",
            success: function (loginResult) {
                if (loginResult == "ok") {
                    alert("로그인이 성공하였습니다");
                    loginForm.submit();
                } else {
                    alert("아이디와 비밀번호를 확인해주세요");
                }
            },
            error: function (){
                alert("error");
            }
        })
    }
</script>
</html>
