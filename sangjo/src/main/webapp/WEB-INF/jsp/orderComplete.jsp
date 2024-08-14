<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
    <title>결제 결과</title>
    <style>
        .message-box {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            background-color: #f8f9fa;
        }
        .message {
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .success {
            background-color: #d4edda;
            color: #155724;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
        }     
                  
    </style>
</head>
<body>
    <div class="message-box">
        <div class="message success">
            <h1>경★주문이 접수되었습니다★축 </h1>
            <p>그대가 지불할 총 금액: ${sessionScope.sessionTotalAmount}원</p>
            <p>국민은행 61870104241940 예금주 : 이성철</p>            
            <a href="index.do">계속 쇼핑하기</a>
        </div>
    </div>
</body>