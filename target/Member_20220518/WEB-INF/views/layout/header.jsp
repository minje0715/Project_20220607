<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-06-02
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<header>
  <div class="px-3 py-2 bg-dark text-white">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
          <li>
            <a href="/" class="nav-link text-white">
              <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#home"></use></svg>
              Home
            </a>
          </li>
          <li>
            <a href="#" class="nav-link text-white">
              <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#speedometer2"></use></svg>
              G-News
            </a>
          </li>
          <li>
            <a href="#" class="nav-link text-white">
              <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#table"></use></svg>
              Market
            </a>
          </li>
          <li>
            <a href="#" class="nav-link text-white">
              <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#grid"></use></svg>
              Service Center
            </a>
          </li>
          <li>
            <a href="#" class="nav-link text-white">
              <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#people-circle"></use></svg>

            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="px-3 py-2 border-bottom mb-3">
    <div class="container d-flex flex-wrap justify-content-center">
      <form class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto" role="search">
        <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
      </form>
<c:choose>
  <c:when test="${sessionScope.loginMemberId == null}">
      <div class="text-end">
        <button type="button" onclick="save()" class="btn btn-dark">회원가입</button>
        <button type="button" onclick="login()" class="btn btn-dark">로그인</button>
      </div>
  </c:when>
  <c:when test="${sessionScope.loginId == 1}">
    <div class="text-end">
      <p >${sessionScope.loginMemberId}님 접속중..</p>
      <button type="button" onclick="findAll()" class="btn btn-dark">회원목록</button>
      <button type="button" onclick="logout()" class="btn btn-dark">로그아웃</button>
    </div>
  </c:when>
  <c:otherwise>
      <div class="text-end">
    <p >${sessionScope.loginMemberId}님 접속중..</p>
    <button type="button" onclick="detail()" class="btn btn-dark">마이페이지</button>
    <button type="button" onclick="logout()" class="btn btn-dark">로그아웃</button>
      </div>
  </c:otherwise>
</c:choose>
    </div>
  </div>
</header>
</body>
<script>
  function save() {
    location.href = "/member/save";
  }
  function login() {
    location.href = "/member/login";
  }
  function detail() {
    location.href = "/member/detail";
  }
  function logout() {
    location.href = "/member/logout";
  }
  function findAll() {
    location.href = "/member/findAll";
  }
 </script>
</html>
