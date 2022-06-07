<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-05-29
  Time: 오후 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        header{
            display:flex;
            justify-content: center;
        }
        form{
            padding:10px;
        }
        .input-box{
            position:relative;
            margin:10px 0;
        }
        .input-box > input{
            background:transparent;
            border:none;
            border-bottom: solid 1px #ccc;
            padding:20px 0px 5px 0px;
            font-size:14pt;
            width:100%;
        }
        input::placeholder{
            color:transparent;
        }
        input:placeholder-shown + label{
            color:#aaa;
            font-size:14pt;
            top:15px;

        }
        input:focus + label, label{
            color:#8aa1a1;
            font-size:10pt;
            pointer-events: none;
            position: absolute;
            left:0px;
            top:0px;
            transition: all 0.2s ease ;
            -webkit-transition: all 0.2s ease;
            -moz-transition: all 0.2s ease;
            -o-transition: all 0.2s ease;
        }

        input:focus, input:not(:placeholder-shown){
            border-bottom: solid 1px #8aa1a1;
            outline:none;
        }
        button{
            background-color: #8aa1a1;
            border:none;
            color:white;
            border-radius: 5px;
            width:100%;
            height:35px;
            font-size: 14pt;
            margin-top:100px;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="py-5 text-center">
<form action="/member/update" method="post" name="update">

    <div class="input-box">
        <input type="text"  name="id" value="${updateMember.id}" readonly>
        <label>회원번호</label>
    </div>

    <div class="input-box">
        <input type="text" id="memberId" name="memberId" value="${updateMember.memberId}" readonly>
        <label for="memberId">아이디</label>
    </div>

    <div class="input-box">
        <input type="password" id="pwConfirm" name="memberPassword">
        <label for="pwConfirm">비밀번호</label>
    </div>

    <div class="input-box">
        <input type="text" id="memberName" name="memberName" value="${updateMember.memberName}" readonly>
        <label for="memberName">이름</label>
    </div>

    <div class="input-box">
        <input type="text" id="memberEmail" name="memberEmail" value="${updateMember.memberEmail}" readonly>
        <label for="memberEmail">이메일</label>
    </div>

    <div class="input-box">
        <input type="tel" name="memberPhone" id="memberPhone"
               required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" title="###-####-####" placeholder="전화번호">
        <label for="memberPhone">전화번호</label>
    </div>

    <button onclick="update()" value="수정">수정하기</button>
</form>
    </div>
</div>
</body>
<script>
     const update = () => {
         const pwConfirm = document.getElementById("pwConfirm").value;
         const pwDB = '${updateMember.memberPassword}';

         if(pwConfirm == pwDB) {
             update.submit();
         }else {
             alert("비밀번호가 틀립니다")
         }
     }
</script>
</html>
