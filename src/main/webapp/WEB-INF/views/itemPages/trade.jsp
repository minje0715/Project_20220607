<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-06-15
  Time: 오후 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <title>Title</title>
</head>
<body>
<div class="container">
    <h2 class="text-center">거래내역</h2>
    <table class="table">
        <tr>
            <th>거래번호</th>
            <th>거래종류</th>
            <th>아이템이름</th>
            <th>회원</th>
            <th>가격</th>
            <th>거래날짜</th>
        </tr>
        <c:forEach items="${tradeList}" var="trade">
            <tr>
                <td>${trade.oid}</td>
                <td>${trade.trade}</td>
                <td>${trade.itemName}</td>
                <td>${trade.memberId}</td>
                <td>${trade.itemPrice}</td>
                <td>${trade.itemCreatedTime}</td>
                <td></td>
            </tr>
        </c:forEach>

    </table>
    <div class="container">
        <ul class="pagination justify-content-center">
            <c:choose>
                <%--            현재 페이지가 1페이지면 이전 글자만 보여줌--%>
                <c:when test="${paging.page<=1}">
                    <li class="page-item disabled">
                        <a class="page-link">[이전]</a>
                    </li>
                </c:when>
                <%--         1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청--%>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/item/tradeAll?page=${paging.page-1}">[이전]</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <%--        for(int i=startPage; i<=endPage; i++--%>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <%--                요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게--%>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">${i}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/item/tradeAll?page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link">[다음]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/item/tradeAll?page=${paging.page+1}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>

</div>
</body>
</html>
