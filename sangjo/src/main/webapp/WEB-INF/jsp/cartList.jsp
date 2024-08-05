<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Single Page Header 시작 -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">장바구니</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">홈</a></li>
        <li class="breadcrumb-item"><a href="#">페이지</a></li>
        <li class="breadcrumb-item active text-white">장바구니</li>
    </ol>
</div>
<!-- Single Page Header 끝 -->

<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">상품</th>
                        <th scope="col">상품명</th>
                        <th scope="col">가격</th>
                        <th scope="col">수량</th>
                        <th scope="col">합계</th>
                        <th scope="col">처리</th>
                    </tr>
                    
                </thead>
               
                <tbody>
             
                 
                    <c:forEach var="item" items="${cartList}">
                        <c:set var="itemTotal" value="${item.productPrice * item.quantity}" />
                        <tr>
                            <th scope="row">
                                <div class="d-flex align-items-center">
                                    <img src="img/${item.productImg}"
                                        class="img-fluid me-5 rounded-circle"
                                        style="width: 80px; height: 80px;" alt="">
                                </div>
                            </th>
                            <td>
                                <p class="mb-0 mt-4">${item.productName}</p>
                            </td>
                            <td>
                                <p class="mb-0 mt-4">${item.productPrice} 원</p>
                            </td>
                            <td>
                                <div class="input-group quantity mt-4" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-minus rounded-circle bg-light border" data-product-id="${item.productNo}">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text"
                                        class="form-control form-control-sm text-center border-0"
                                        value="${item.quantity}"
                                        readonly> <!-- 수량은 수정할 수 없도록 설정 -->
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-plus rounded-circle bg-light border" data-product-id="${item.productNo}">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <p class="mb-0 mt-4">${itemTotal} 원</p>
                            </td>
                            <td>
                                <button class="btn btn-md rounded-circle bg-light border mt-4" data-product-id="${item.productNo}">
                                    <i class="fa fa-times text-danger"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:set var="grandTotal" value="0.0" />
                    <c:forEach var="item" items="${cartList}">
                        <c:set var="itemTotal" value="${item.productPrice * item.quantity}" />
                        <c:set var="grandTotal" value="${grandTotal + itemTotal}" />
                    </c:forEach>
                    <c:set var="shippingCost" value="3000" />
                    <c:set var="totalAmount" value="${grandTotal + shippingCost}" />
                   
                </tbody>
            </table>
        </div>
        <div class="mt-5">
            <input type="text"
                class="border-0 border-bottom rounded me-5 py-3 mb-4"
                placeholder="쿠폰 코드">
            <button
                class="btn border-secondary rounded-pill px-4 py-3 text-primary"
                type="button">쿠폰 적용</button>
        </div>
        <div class="row g-4 justify-content-end">
            <div class="col-8"></div>
            <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                <div class="bg-light rounded">
                    <div class="p-4">
                        <h1 class="display-6 mb-4">
                            장바구니 <span class="fw-normal">총 합계</span>
                        </h1>
                        <div class="d-flex justify-content-between mb-4">
                            <h5 class="mb-0 me-4">소계:</h5>
                            <p class="mb-0">${grandTotal} 원</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h5 class="mb-0 me-4">배송비</h5>
                            <div class="">
                                <p class="mb-0">정액 배송비: ${shippingCost} 원</p>
                            </div>
                        </div>
                        <p class="mb-0 text-end">우크라이나로 배송합니다.</p>
                    </div>
                    <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                        <h5 class="mb-0 ps-4 me-4">총 합계</h5>
                        <p class="mb-0 pe-4">${totalAmount} 원</p>
                    </div>
                    <button
                        class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                        type="button">결제 진행</button>
                    
                </div>
            </div>
        </div>
    </div>
</div>
