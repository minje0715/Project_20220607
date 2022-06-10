<%--
  Created by IntelliJ IDEA.
  User: 민제
  Date: 2022-06-10
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        .tbTypeB tbody tr th {
            line-height: 24px;
            font-weight: bold;
            color: #3e3e3e;
            text-align: center;
            vertical-align: middle;
            border-top: 1px solid #e4e4e4;
            background: #fbfbfb;
        }
        .tbTypeB tbody tr td {
            height: 18px;
            padding: 13px 20px;
            line-height: 20px;
            vertical-align: middle;
            border-top: 1px solid #e4e4e4;
            border-left: 1px solid #e4e4e4;
        }

        tbody {
            display: table-row-group;
            vertical-align: middle;
            border-color: inherit;
        }
        .tbTypeB {
            width: 100%;
            border-top: 2px solid #6b6b6b;
            border-bottom: 1px solid #6b6b6b;
            border-collapse: separate;
            *border-collapse: collapse;
            border-spacing: 0;
            table-layout: fixed;
        }
        .pb_40

    </style>
</head>
<body>
<div class="text-center">
    <form name="viewForm3" method="post" action="/member/cash">
        <div class="s_stit pt_20">요금제 선택 <span class="txt_p11 right">(VAT포함)</span></div>
        <table class="tbTypeB pb_40" style="">
            <tbody>
            <tr>
                <th>충전포인트</th>
                <td>30,000P</td>
                <td>52,500P</td>
                <td>108,000P</td>
            </tr>
            <tr>
                <th>할인율</th>
                <td>없음</td>
                <td>5%</td>
                <td>8%</td>
            </tr>
            <tr>
                <th>금액</th>
                <td><input type="radio" name="memberCash" id="radio1" value="30,000" checked> 30,000원</td>
                <td><input type="radio" name="memberCash" id="radio2" value="50,000"> 50,000원</td>
                <td><input type="radio" name="memberCash" id="radio3" value="100,000"> 100,000원</td>
            </tr>
            </tbody>
        </table>
        <input type="text" class="text" hidden="hidden" name="mid" value="${sessionScope.loginId}">
        <div class="center pb_50">
            <input type="submit" class="btn btn-outline-danger mt-3"  style="width: 120px; height: 50px;" value="충전하기">
        </div>
    </form>
</div>
</body>
</html>
