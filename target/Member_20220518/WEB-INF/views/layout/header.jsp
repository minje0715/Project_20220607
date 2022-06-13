<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-05-27
  Time: 오후 6:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>
</head>
<body>
<%--    <header>--%>
<%--        <button><a href="/">메인화면</a></button>--%>
<%--        <button><a href="/memberPages/myPage">마이페이지</a></button>--%>
<%--        <button><a href="/member/logout">로그아웃</a></button>--%>
<%--    </header>--%>
<header class="p-3 bg-dark text-white" style="padding: 10px">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                    <use xlink:href="#bootstrap"></use>
                </svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <c:choose>
                    <c:when test="${sessionScope.loginId != null}">
                        <div>
                            <div>[${sessionScope.loginMemberId}]님 접속중♥</div>
                        </div>
                    </c:when>
                </c:choose>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2"
                            data-bs-toggle="dropdown" aria-expanded="false">
                        메뉴
                    </button> &nbsp;
                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                        <li>
                            <button onclick="findByAdmin()" type="button" class="dropdown-item">■공지사항</button>
                        </li>
                        <li>
                            <button onclick="boardList()" type="button" class="dropdown-item">■커뮤니티</button>
                        </li>
                        <li>
                            <button onclick="itemList()" type="button" class="dropdown-item">■거래소</button>
                        </li>
                        <ul>
                            <li style="color: white">
                                <button onclick="a()" class="dropdown-item">
                                    <i style="color: white" class="bi bi-coin"></i>구매
                                </button>
                            </li>

                            <li style="color: white">
                                <button onclick="b()" type="button" class="dropdown-item">
                                    <i style="color: white" class="bi bi-cart-dash-fill"></i>판매
                                </button>
                            </li>

                            <li style="color: white">
                                <button onclick="c()" type="button" class="dropdown-item">
                                    <i style="color: white" class="bi bi-chat-left-text"></i>거래내역
                                </button>
                            </li>

                            <li style="color: white">
                                <button href="index" type="button" class="dropdown-item">
                                    <i style="color: white" class="bi bi-house-heart"></i>홈으로
                                </button>
                            </li>
                        </ul>
                    </ul>
                </div>
                <c:choose>
                    <c:when test="${sessionScope.loginMemberId eq 'admin'}">
                        <button onclick="findId()" type="button" class="btn btn-outline-light me-2">회원목록</button>
                        <button onclick="adminSave()" type="button" class="btn btn-outline-light me-2">공지사항작성</button>
                    </c:when>
                </c:choose>
            </ul>
            <ul>
                <li class="nav-item">
                    <form action="/board/search" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3"
                          role="search">
                        <select name="searchType">
                            <option class="form-control form-control-dark text-white bg-dark" value="boardTitle">글 제목
                            </option>
                            <option class="form-control form-control-dark text-white bg-dark" value="boardWriter">작성자
                            </option>
                        </select>

                        <input type="search" name="q" class="form-control form-control-dark text-white bg-dark"
                               placeholder="검색어입력.."
                               aria-label="Search">
                        <input class="form-control form-control-dark text-white bg-dark " type="submit" value="Search?">
                    </form>
                </li>
            </ul>
            <%--            <div class="text-end">--%>
            <c:choose>
                <c:when test="${sessionScope.loginId == null}">
                    <button onclick="login()" type="button" class="btn btn-outline-light me-2">로그인</button>
                    <button onclick="save()" type="button" class="btn btn-warning">회원가입</button>
                </c:when>
                <c:otherwise>
                    <button onclick="myPage()" type="button" class="btn btn-outline-light me-2">마이페이지</button>
                    <button onclick="logout()" type="button" class="btn btn-warning">로그아웃</button>
                </c:otherwise>
            </c:choose>
            <%--            </div>--%>
        </div>
    </div>
</header>
</body>
<script>
    const a = () => {
            location.href = "/item/findAll";
    }
    const b = () => {
        if (${sessionScope.loginId eq null}) {
            alert("로그인이 필요합니다")
            location.href = "/member/login";
        } else {
            location.href = "/item/itemSave";
        }
    }
    const c = () => {
        if (${sessionScope.loginId eq null}) {
            alert("로그인이 필요합니다")
            location.href = "/member/login";
        }
    }
    const findByAdmin = () => {
        location.href = "/board/findByAdmin";
    }
    const save = () => {
        location.href = "/member/save";
    }
    const login = () => {
        location.href = "/member/login";
    }
    const findId = () => {
        location.href = "/member/memberList";
    }
    const myPage = () => {
        location.href = "/member/myPage";
    }
    const logout = () => {
        location.href = "/member/logout";
    }
    const boardList = () => {
        location.href = "/board/list";
    }
    const adminSave = () => {
        location.href = "/board/saveForm";
    }
    const itemList = () => {
        location.href = "/item/index";
    }
</script>
</html>
