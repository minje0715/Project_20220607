<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>내용</th>
            <th>조회수</th>
            <th>작성시간</th>
        </tr>
        <tr>
            <td>${board.bid}</td>
            <td>${board.boardTitle}</td>
            <td>${board.boardWriter}</td>
            <td>${board.boardContents}</td>
            <td>${board.boardHits}</td>
            <td>${board.boardCreatedTime}</td>
        </tr>
    </table>
</div>
<div class="text-center">
    <c:choose>
        <c:when test="${sessionScope.loginMemberId eq board.boardWriter}">
            <button onclick="boardUpdate()" class="btn btn-primary">수정</button>
            <button onclick="list()" class="btn btn-dark">글목록</button>
            <button onclick="boardDelete()" class="btn btn-danger">삭제</button>
        </c:when>
        <c:otherwise>
            <button onclick="list()" class="btn btn-dark">글목록</button>
        </c:otherwise>
    </c:choose>

    <div class="container">
        <div id="comment-write" class="input-group mb-3">
            <input type="text" id="commentWriter" class="form-control" placeholder="작성자" value="${sessionScope.loginMemberId}" readonly>
            <input type="text" id="commentContents" class="form-control" placeholder="내용">
            <button id="comment-write-btn" class="btn btn-dark">댓글작성</button>
        </div>
        <div id="comment-list">
            <table class="table">
                <tr>
                    <th>댓글번호</th>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>작성시간</th>
                </tr>
                <c:forEach items="${commentList}" var="comment">
                    <tr>
                        <td>${comment.cid}</td>
                        <td>${comment.commentWriter}</td>
                        <td>${comment.commentContents}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                            value="${board.boardCreatedTime}"></fmt:formatDate></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<script>
    const list = () => {
        location.href = "/board/list";
    }
    const boardUpdate = () => {
        location.href = "/board/update?id=${board.bid}";
    }
    const boardDelete = () => {
        location.href = "/board/delete?id=${board.bid}";
    }
    $("#comment-write-btn").click(function () {
        if ('${sessionScope.loginMemberId}' != '') {
            const commentWriter = document.getElementById("commentWriter").value;
            const commentContents = $("#commentContents").val();
            const boardId = '${board.bid}';

            $.ajax({
                type: "post",
                url: "/comment/save",
                data: {
                    "commentWriter": commentWriter,
                    "commentContents": commentContents,
                    "bid": boardId,
                },
                dataType: "json",
                success: function (result) {
                    console.log(result);
                    let output = "<table class='table'>";
                    output += "<tr><th>댓글번호</th>";
                    output += "<th>작성자</th>";
                    output += "<th>내용</th>";
                    output += "<th>작성시간</th></tr>";

                    for (let i in result) {
                        output += "<tr>";
                        output += "<td>" + result[i].cid + "</td>";
                        output += "<td>" + result[i].commentWriter + "</td>";
                        output += "<td>" + result[i].commentContents + "</td>";
                        output += "<td>" + moment(result[i].commentCreatedTime).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                        output += "</tr>"
                    }
                    output += "</table>";
                    document.getElementById('comment-list').innerHTML = output;
                    document.getElementById('commentContents').value = '';
                },
                error: function () {
                    alert("오류체크");
                }

            });
        } else {
            alert("로그인 후 이용해주세요")
        }
    })
</script>
</body>
</html>
