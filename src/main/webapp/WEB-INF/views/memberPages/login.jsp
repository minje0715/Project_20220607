<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-06-03
  Time: 오전 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <title>Title</title>
    <style>
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
    </style>
</head>
<body>
<div class="width container mt-5">
<form action="/member/login" method="post">
<input class="form-control mb-2" type="text" name="memberId" id="memberId" placeholder="아이디">
<input class="form-control mb-2" type="text" name="memberPassword" placeholder="비밀번호" required>
    <button onclick="loginCheck()">로그인</button>
</form>
</div>
</body>
<script>
    function loginCheck() {
        const memberId = document.getElementById("memberId").value;

        $.ajax({
            type: "post",
            url: "/member/duplicateCheck",
            data:{"memberId": memberId},
            dataType:"text",
            success:function (checkResult) {
                if(checkResult == "ok"){
                    alert("로그인 성공")
                }else{
                    alert("아이디와 비밀번호를 확인해주세요")
                }
            },
            error:function (){
                alert("error check;")
            }
        })
    }
</script>
</html>
