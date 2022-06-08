<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-05-30
  Time: 오전 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
</head>
<body>
<div class="container">
    <form action="/board/update" method="post" name="updateForm">
        <input class="form-control mb-2" type="text" name="bid" value="${boardUpdate.bid}" readonly>
        <input class="form-control mb-2" type="text" name="boardTitle" value="${boardUpdate.boardTitle}">
        <input class="form-control mb-2" type="password"  id="passwordConfirm" placeholder="비밀번호">
        <input class="form-control mb-2" type="text" name="boardWriter" value="${boardUpdate.boardWriter}" readonly>
        <textarea class="form-control mb-2" name="boardContents" rows="5" cols="10">${boardUpdate.boardContents}</textarea>
        <input type="button" class="btn btn-primary" value="수정하기" onclick="boardUpdate()">
    </form>
</div>
</body>
<script>
    const boardUpdate = () => {
        const passwordConfirm = document.getElementById("passwordConfirm").value;
        const passwordDB = '${sessionScope.loginMemberPassword}';
        if(passwordConfirm == passwordDB) {
            updateForm.submit();
        } else {
            alert("비밀번호를 다시 입력하세요")
        }
    }
</script>
</html>
