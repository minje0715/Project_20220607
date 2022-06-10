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
</head>
<body>
<form name="viewForm3" method="post" action="/html/03/03.php?mode=ORDER2" oncubmit="return submit(this.form)">
  <div class="s_stit pt_20">요금제 선택 <span class="txt_p11 right">(VAT포함)</span></div>
  <table class="tbTypeB pb_40">
    <tbody><tr>
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
      <td><input type="radio" name="txtIdx" id="radio" value="39" checked=""> 30,000원</td>
      <td><input type="radio" name="txtIdx" id="radio" value="40"> 50,000원</td>
      <td><input type="radio" name="txtIdx" id="radio" value="41"> 100,000원</td>
    </tr>
    </tbody></table>
  <!--<div class="point_box">
       <ul>
          <li><input type="radio" name="txtIdx" id="radio" value="39" checked> 30,000P (30,000원)</li>
          <li><input type="radio" name="txtIdx" id="radio" value="40"> 52,000P (50,000원)</li>
          <li><input type="radio" name="txtIdx" id="radio" value="41"> 108,000P (100,000원)</li>
       </ul>
  </div>-->

  <input type="hidden" name="txtSidx" value="0">
  <input type="hidden" name="txtSelNum" value="1">
  <div class="center pb_50">
    <a href="javascript:alert('회원만 구매하실수 있는 제품입니다.'); "><!----<span class="btnTypeK" >--><span class="btn_07">선불 충전 결제하기</span></a>
    <!--<input type="submit" class="btn_07 center" title="바로구매" value="선불 충전 결제하기" style="margin:0; border:0;  font-size:13px; " />-->
  </div>
</form>
</body>
</html>
