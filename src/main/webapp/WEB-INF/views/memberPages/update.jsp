<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-06-07
  Time: 오전 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <title>Title</title>
</head>
<body>
<div class="width container mt-5">
    <form action="/member/update" method="post">
        <input class="form-control mb-2" type="text" name="memberId" id="memberId" value="${sessionScope.loginMemberId}" readonly>
        <input class="form-control mb-2" type="text" name="memberPassword" value="${updateMember.memberPassword}" required>
        <input class="form-control mb-2" type="text" name="memberBirth"
               required pattern="[0-9]{8}" title="########" placeholder="생년월일" value="${updateMember.memberBirth}"  readonly>
        <input class="form-control mb-2" type="text" name="memberName" placeholder="이름" value="${updateMember.memberName}" readonly>
        <input class="form-control mb-2" type="text" name="memberEmail" placeholder="이메일" value="${updateMember.memberEmail}" readonly>
        <input class="form-control mb-2" type="tel" name="memberPhone"
               required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" title="###-####-####" placeholder="전화번호" value="${updateMember.memberPhone}" readonly>
        <button>수정</button>
    </form>
</div>
</body>
</html>
