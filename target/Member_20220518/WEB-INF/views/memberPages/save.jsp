<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-06-03
  Time: 오전 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
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
        .width {
            max-width: 700px;
        }
    </style>
</head>
<body>

<div class="width container mt-5">
    <form action="/member/save" method="post">
        <input class="form-control mb-2" type="text" name="memberId" id="memberId" placeholder="아이디"
               onblur="duplicateCheck()" required>
        <input class="form-control mb-2" type="text" id="pw1" name="memberPassword" placeholder="비밀번호" required>
        <input class="form-control mb-2" type="text" id="pw2" placeholder="비밀번호확인" onblur="pwCheck()" required>
        <input class="form-control mb-2" type="text" name="memberBirth"
               required pattern="[0-9]{8}" title="########" placeholder="생년월일">
        <input class="form-control mb-2" type="text" name="memberName" placeholder="이름" required>
        <input class="form-control mb-2" type="text" name="memberEmail" placeholder="이메일" required>
        <input class="form-control mb-2" type="tel" name="memberPhone"
               required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" title="###-####-####" placeholder="전화번호">
        <button>가입</button>
    </form>
</div>
</body>
<script>
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;

        $.ajax ({
            type: "post",
            url: "/member/duplicateCheck",
            data: {"memberId":memberId},
            dataType: "text",
            success: function (checkResult) {
            if(checkResult == "ok") {
                alert("사용가능한 아이디입니다");
            }else {
                alert("사용중인 아이디입니다");
            }
            },
            error:function (){
                alert("code error;")
            }
        })
    }
    const pwCheck = () => {
        const pw1 = document.getElementById("pw1").value;
        const pw2 = document.getElementById("pw2").value;
        if(pw1 == pw2){
            alert("비밀번호가 일치합니다")
        }else {
            alert("비밀번호를 확인해주세요")
        }
    }
</script>
</html>
