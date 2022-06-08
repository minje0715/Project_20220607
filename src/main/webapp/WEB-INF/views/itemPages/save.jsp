<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-06-08
  Time: 오후 4:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/sideheader.jsp" flush="false"></jsp:include>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>


<div class="position-relative">
    <div class="position-absolute top-50 start-50 translate-middle">
        <button onclick="showPopup()" class="btn btn-primary" style="margin-top: 500px">아이템 판매</button>
    </div>
</div>
</body>

</script>
</html>
