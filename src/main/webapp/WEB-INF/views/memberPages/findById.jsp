<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-06-03
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <table class="table">
        <tr>
            <th>회원번호</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>생년월일</th>
            <th>이메일</th>
            <th>핸드폰</th>
        </tr>
        <tr>
            <td>${member.mid}</td>
            <td>${member.memberId}</td>
            <td>${member.memberPassword}</td>
            <td>${member.memberName}</td>
            <td>${member.memberBirth}</td>
            <td>${member.memberEmail}</td>
            <td>${member.memberPhone}</td>
        </tr>
    </table>
    <button onclick="update()" class="btn btn-primary">비밀번호 수정</button>
    <button onclick="memberDelete()" class="btn btn-danger">회원 탈퇴</button>
</div>
</body>
<script>
    function update() {
        location.href = "/member/update?id=${sessionScope.loginId}";
    }

    const memberDelete = () => {
        location.href = "/member/delete?id=${sessionScope.loginId}";
    }

</script>
</html>
