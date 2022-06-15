<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-05-27
  Time: 오후 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<h2 class="text-center">마이페이지</h2>
<div class="container">
    <table class="table">
        <tr>
            <th>id</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>생년월일</th>
            <th>이메일</th>
            <th>핸드폰</th>
            <th>보유캐쉬</th>
            <th>회원정보수정</th>
            <th>회원탈퇴</th>
        </tr>
            <tr>
                <td>${member.mid}</td>
                <td>${member.memberId}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberBirth}</td>
                <td>${member.memberEmail}</td>
                <td>${member.memberPhone}</td>
                <td>${member.memberCash}</td>
                <td><button class="btn btn-outline-warning"><a href="/member/updateForm">수정</a></button></td>
                <td><button class="btn btn-outline-danger"><a href="/member/delete?id=${member.mid}">회원탈퇴</a></button></td>
            </tr>
    </table>
    <button onclick="openPopup()" class="btn btn-danger"  style="width: 120px; height: 50px;">캐쉬 충전</button>
</div>
</body>
<script>
    const openPopup = () => {
        var width = 650;
        var height = 550;

        var left = (window.screen.width / 2) - (width/2);
        var top = (window.screen.height / 4);

        var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=no, status=no, resizable=yes, titlebar=yes';

        window.open("/member/cashForm", "캐쉬충전", windowStatus);
    }
</script>
</html>
