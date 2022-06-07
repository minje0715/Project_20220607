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
<form action="/board/save" method="post">
    <input class="form-control mb-2" type="text" name="boardWriter" value="${sessionScope.loginMemberId}"readonly>
    <input class="form-control mb-2" type="text" name="boardTitle" placeholder="글 제목">
    <textarea class="form-control mb-2" name="boardContents" rows="5" cols="10"></textarea>
    <input type="submit" class="btn btn-danger" value="작성">
</form>
</div>
</body>
</html>
