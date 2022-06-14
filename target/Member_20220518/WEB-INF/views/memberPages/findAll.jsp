<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 11:10
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
<div class="container">
    <h2 class="text-center">회원목록</h2>
    <table class="table">
        <tr>
            <th>회원번호</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>이메일</th>
            <th>핸드폰</th>
            <th>캐쉬</th>
            <th>회원삭제</th>
        </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>${member.mid}</td>
                <td>${member.memberId}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberEmail}</td>
                <td>${member.memberPhone}</td>
                <td>${member.memberCash}</td>
                <td><a href="/member/delete?id=${member.mid}">삭제</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
