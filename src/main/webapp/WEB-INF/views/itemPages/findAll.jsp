<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-06-09
  Time: 오전 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>

    <style>
        .card-center {
            text-align: center;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="album py-5 bg-light">
    <div class="container">

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <c:forEach items="${itemList}" var="item">
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <img width="300" height="150"
                             src="${pageContext.request.contextPath}/upload/${item.itemFileName}" class="card-img-top"
                             alt="...">
                        <div class="card-body">
                            <h5 class="card-title">${item.itemName}</h5>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">판매자 [${item.memberId}]</li>
                                <li class="list-group-item">이름 [${item.itemName}]</li>
                                <li class="list-group-item">가격 [${item.itemPrice}sp]</li>
                                <li class="list-group-item">[${item.itemCreatedTime}]</li>
                            </ul>
                            <div class="card-body card-center">
                                <c:choose>
                                    <c:when test="${sessionScope.loginMemberId ne item.memberId}">
                                        <button onclick="buyItem('${item.pid}', '${item.memberId}', '${item.itemPrice}')"
                                                class="btn btn-outline-warning">구매
                                        </button>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<%-- 페이징 처리--%>
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
                    <a class="page-link" href="/item/findAll?page=${paging.page-1}">[이전]</a>
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
                        <a class="page-link" href="/item/findAll?page=${i}">${i}</a>
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
                    <a class="page-link" href="/item/findAll?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
</body>
<script>
    const buyItem = (itemPid, itemMemberId, itemPrice) => {
        const buyMember = '${sessionScope.loginId}'; // 구매자
        if (${sessionScope.loginId ne null}) {
            if ('${member.memberCash}' >= itemPrice) {
                location.href = "/item/buyItem?id=" + itemPid + "&mid=" + buyMember + "&memberId=" + itemMemberId;
            } else {
                alert("잔액이 부족합니다\n" +
                    "충전하기 위한 페이지로 이동합니다");
                location.href = "/member/myPage";
            }
        } else {
            alert("로그인이 필요합니다");
            location.href = "/member/login";
        }
    }
</script>
</html>
