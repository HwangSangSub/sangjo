<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>장바구니</title>
</head>
<body>
    <h2>장바구니</h2>
    <table border="1">
        <thead>
            <tr>
                <th>상품번호</th>
                <th>상품가격</th>
                <th>주문수량</th>
                <th>총 금액</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${OrderList}">
                <tr>
                    <td>${item.productNo}</td>
                    <td>${item.odPrice}</td>
                    <td>${item.odCnt}</td>
                    <td>${item.odPrice * item.odCnt}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="index.do">메인으로 돌아가기</a>
</body>
</html>