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
        <button onclick="chatStart()" class="btn btn-primary" style="margin-top: 500px">Bot Chat</button>
    </div>
</div>
</body>
<script>
    function chatStart() {
        var width = 600;
        var height = 850;

        var left = (window.screen.width / 2) - (width/2);
        var top = (window.screen.height / 4);

        var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=no, resizable=yes, titlebar=yes';

        const url = "/member/Chatting";

        window.open(url, "Chat", windowStatus);

    }
</script>
</html>
