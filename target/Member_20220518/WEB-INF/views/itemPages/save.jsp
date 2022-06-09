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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        submit {
            background-color: #8aa1a1;
            border: none;
            color: white;
            border-radius: 5px;
            width: 100%;
            height: 35px;
            font-size: 14pt;
            margin-top: 100px;
        }
        .width {
            max-width: 700px;
        }
    </style>
</head>
<body>
<div class="width container mt-5">
<form action="/item/save" method="post" enctype="multipart/form-data" name="item2">
<input class="form-control mb-2" type="text" name="memberId" value="${sessionScope.loginMemberId}" readonly>
<input class="form-control mb-2" type="text" name="itemName" placeholder="아이템이름" required>
<input class="form-control mb-2" type="text" name="itemPrice" placeholder="아이템가격" required>
<input type="file" name="itemFile" required>
    <button onclick="item()">판매등록</button>
</form>
</div>
</body>
<script>
    const item = () => {
        document.item2.action = "/item/save";
        document.item2.submit();

        setTimeout(function(){
window.close()
          // window.open('about:link','_self').close();
        },200);
    }
</script>
</html>
