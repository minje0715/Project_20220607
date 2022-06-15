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
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
    <form name="cash" method="post" action="/member/cash">
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
                <td><input type="radio" name="memberCash" id="radio1" value="30000" checked> 30,000원</td>
                <td><input type="radio" name="memberCash" id="radio2" value="52500"> 50,000원</td>
                <td><input type="radio" name="memberCash" id="radio3" value="108000"> 100,000원</td>
            </tr>
            </tbody>
        </table>
        <div class="center pb_50">
            <input type="text" hidden="hidden" name="mid" value="${sessionScope.loginId}">
            <input type="button" onclick="cashPoint()" class="btn btn-outline-danger mt-3"
                   style="width: 120px; height: 50px;" value="충전하기">
        </div>
    </form>
</div>
</body>
<script>
    const cashPoint = () => {
        // const radio1 = document.getElementById("radio1").value;
        // const radio2 = document.getElementById("radio2").value;
        // const radio3 = document.getElementById("radio3").value;
        const money = $('input[name ="memberCash"]:checked').val();
        console.log(money);

        const IMP = window.IMP;
        IMP.init('imp50268347');
        IMP.request_pay({
            pg: "kakaopay",
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '결제',
            amount: money,
            buyer_email: '${memberDTO.memberEmail}',
            buyer_name: '${memberDTO.memberName}',
            buyer_tel: '${memberDTO.memberPhone}',
            // buyer_addr : '구매자 주소',
            // buyer_postcode : '구매자 주소',

        }, function (rsp) {
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                alert(msg);

                document.cash.action = "/member/cash";
                document.cash.submit();

                setTimeout(function () {
                    window.close();
                    // window.open('about:link','_self').close();
                }, 3000);
            } else {
                var msg = '결제에 실패하였습니다.';
                alert(msg);
            }
        });


    }
</script>
</html>
