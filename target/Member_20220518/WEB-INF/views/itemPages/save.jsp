<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-06-08
  Time: 오후 6:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/item/save" method="post">
<input type="text" name="memberId" value="${sessionScope.loginMemberId}">
<input type="text" name="itemName" placeholder="아이템이름">
<input type="text" name="itemPrice" placeholder="아이템가격">
<input type="file" name="itemFileName">
</form>
</body>
</html>
