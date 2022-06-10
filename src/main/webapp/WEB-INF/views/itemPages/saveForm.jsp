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
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>


<div class="position-relative">
    <div class="position-absolute top-50 start-50 translate-middle">
        <button onclick="showPopup()" class="btn btn-primary" style="margin-top: 500px">아이템 판매</button>
    </div>
</div>
</body>
<script>
    function showPopup() {
        var width = 600;
        var height = 650;

        var left = (window.screen.width / 2) - (width/2);
        var top = (window.screen.height / 4);

        var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=no, status=no, resizable=yes, titlebar=yes';

        const url = "/item/save";

        window.open(url, "Save", windowStatus);

    }
</script>
</html>
