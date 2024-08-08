<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 확인 및 결제</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/custom.css" rel="stylesheet">
</head>
<body>

<!-- Single Page Header 시작 -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">주문 확인 및 결제</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">홈</a></li>
        <li class="breadcrumb-item"><a href="#">상품 선택</a></li>
        <li class="breadcrumb-item active text-white">주문 확인 및 결제</li>
    </ol>
</div>
<!-- Single Page Header 끝 -->

<div class="container py-5">
    <div class="row">
        <div class="col-md-8">
            <h2 class="mb-4">주문 정보</h2>
            <form action="processOrder.do" method="post">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="firstName" class="form-label">이름</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" required>
                    </div>
                    <div class="col-md-6">
                        <label for="lastName" class="form-label">성</label>
                        <input type="text" class="form-control" id="lastName" name="lastName" required>
                    </div>
                </div>
                <div class="row g-3 mt-3">
                    <div class="col-md-12">
                        <label for="address" class="form-label">주소</label>
                        <input type="text" class="form-control" id="address" name="address" required>
                    </div>
                </div>
                <div class="row g-3 mt-3">
                    <div class="col-md-6">
                        <label for="city" class="form-label">도시/구</label>
                        <input type="text" class="form-control" id="city" name="city" required>
                    </div>
                    <div class="col-md-6">
                        <label for="postalCode" class="form-label">우편번호</label>
                        <input type="text" class="form-control" id="postalCode" name="postalCode" required>
                    </div>
                </div>
                <div class="row g-3 mt-3">
                    <div class="col-md-6">
                        <label for="phone" class="form-label">휴대폰 번호</label>
                        <input type="tel" class="form-control" id="phone" name="phone" required>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col">
                        <label for="orderMemo" class="form-label">주문 메모 (선택 사항)</label>
                        <textarea class="form-control" id="orderMemo" name="orderMemo" rows="3"></textarea>
                    </div>
                </div>

                <!-- Hidden fields for order details -->
                <c:forEach var="i" begin="0" end="${fn:length(fn:split(productNos, ','))-1}">
                    <input type="hidden" name="productNos" value="${fn:split(productNos, ',')[i]}">
                    <input type="hidden" name="productNames" value="${fn:split(productNames, ',')[i]}">
                    <input type="hidden" name="productPrices" value="${fn:split(productPrices, ',')[i]}">
                    <input type="hidden" name="quantities" value="${fn:split(quantities, ',')[i]}">
                </c:forEach>
                
                <div class="mt-4">
                    <button type="submit" class="btn btn-primary">주문 결제</button>
                </div>
            </form>
        </div>

        <div class="col-md-4">
            <h2 class="mb-4">주문 내역</h2>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">상품명</th>
                        <th scope="col">가격</th>
                        <th scope="col">수량</th>
                        <th scope="col">합계</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="i" begin="0" end="${fn:length(fn:split(productNos, ','))-1}">
                        <tr>
                            <td>${fn:split(productNames, ',')[i]}</td>
                            <td>${fn:split(productPrices, ',')[i]}원</td>
                            <td>${fn:split(quantities, ',')[i]}</td>
                            <td>${fn:split(productPrices, ',')[i] * fn:split(quantities, ',')[i]}원</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="3" class="text-end">소계:</td>
                        <td>${grandTotal}원</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="text-end">배송비:</td>
                        <td>${shippingCost}원</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="text-end">총 합계:</td>
                        <td>${totalAmount}원</td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>