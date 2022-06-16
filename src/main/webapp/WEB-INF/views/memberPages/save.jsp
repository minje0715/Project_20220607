<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 3:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        .page {
            width: 300px;
            height: 585px;
            position: absolute;
            left: 0.3%;
            top: 40%;
            /*margin-left:-150px;*/
            /*margin-top:-150px;*/
            display: flex;
            justify-content: center;
        }


        /* add default color for animation start  */


        /* toggle this class */

        .color-bg-start {
            background-color: salmon;
        }


        /* toggle class bg-animate-color */

        .bg-animate-color {
            animation: random-bg .5s linear infinite;
        }


        /* add animation to bg color  */

        @keyframes random-bg {
            from {
                filter: hue-rotate(0);
            }
            to {
                filter: hue-rotate(360deg);
            }
        }

        .fun-btn {
            /* change bg color to get different hues    */
            background-color: salmon;
            color: white;
            padding: 0.6em 6.4em;
            border: none;
            transition: all .3s ease;
            border-radius: 5px;
            letter-spacing: 2px;
            text-transform: uppercase;
            outline: none;
            align-self: center;
            cursor: pointer;
            font-weight: bold;
        }

        .fun-btn:hover {
            animation: random-bg .5s linear infinite, grow 1300ms ease infinite;
        }

        .start-fun {
            background-color: #fff !important;
            /* change color of button text when fun is started   */
            color: salmon !important;
        }

        /* pulsating effect on button */
        @keyframes grow {
            0% {
                transform: scale(1);
            }
            14% {
                transform: scale(1.3);
            }
            28% {
                transform: scale(1);
            }
            42% {
                transform: scale(1.3);
            }
            70% {
                transform: scale(1);
            }
        }

        /*button {*/
        /*    border: none;*/
        /*    border-radius: 5px;*/
        /*    width: 100%;*/
        /*    height: 35px;*/
        /*    font-size: 14pt;*/
        /*    margin-top: 100px;*/
        /*}*/

        /*.width {*/
        /*    max-width: 700px;*/
        /*}*/
        .container {
            width: 300px;
            height: 300px;
            position: absolute;
            left: 50%;
            top: 35%;
            margin-left: -150px;
            margin-top: -150px;
        }
    </style>
</head>
<body>

<div class="container">

    <form action="/member/save" method="post">
        <input class="form-control mb-3l" type="text" name="memberId" id="memberId" placeholder="아이디"
               onblur="duplicateCheck()" required>
        <span id="id-check-result"></span>

        <input class="form-control mb-3" type="text" name="memberPassword" placeholder="비밀번호" required>

        <input class="form-control mb-3" type="text" placeholder="비밀번호확인" required>

        <input class="form-control mb-3" type="text" name="memberName" placeholder="이름" required>

        <input class="form-control mb-3" type="text" name="memberBirth" placeholder="생년월일" required>

        <input class="form-control mb-3" type="text" name="memberEmail" placeholder="이메일" required>

        <input class="form-control mb-3" type="tel" name="memberPhone"
               required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" title="###-####-####" placeholder="전화번호">

        <div class="page">
            <button class="fun-btn">가입하기</button>
        </div>
    </form>
</div>
</body>
<script>
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const idCheck = document.getElementById("id-check-result");
        $.ajax({
            type: "post", // 보낼타입
            url: "/member/duplicate-check", //주소값
            data: {"memberId": memberId}, //보낼 데이터
            dataType: "text", //데이터 타입
            success: function (checkResult) {
                if (checkResult == "ok") {
                    // 사용가능한 아이디
                    idCheck.innerHTML = "멋진 아이디군요 !!";
                    idCheck.style.color = "green";
                } else {
                    // 이미 사용중인 아이디
                    idCheck.innerHTML = "사용중인 아이디입니다";
                    idCheck.style.color = "red";
                }
                alert("아이디 중복체크 중입니다.....");
            },
            error: function () {
                alert("오타체크");
            }
        })
    }
</script>
</html>
