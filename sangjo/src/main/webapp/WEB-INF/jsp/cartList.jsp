<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Single Page Header 시작 -->
<div class="container-fluid py-5">
	<div class="container py-5">
		<!-- 로그인 상태 확인 -->
		<c:if test="${sessionScope.member == null}">
			<div class="alert alert-warning" role="alert">
				로그인 후 장바구니를 확인할 수 있습니다. <a href="index.do">로그인</a>
			</div>
		</c:if>

		<!-- 장바구니가 비어 있을 때 메시지 표시 -->
		<c:if test="${not empty cartList}">
			<c:if test="${empty cartList}">
				<div class="alert alert-info" role="alert">장바구니가 비어 있습니다.
					장바구니에 상품을 추가해 주세요.</div>
			</c:if>
		</c:if>

		<!-- 에러 메시지 표시 -->
		<c:if test="${not empty param.errorMessage}">
			<div class="alert alert-danger" role="alert">
				<c:out value="${param.errorMessage}" />
			</div>
		</c:if>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">상품</th>
						<th scope="col">상품명</th>
						<th scope="col">가격</th>
						<th scope="col">수량</th>
						<th scope="col">합계</th>
						<th scope="col">순삭</th>
					</tr>
				</thead>
				<tbody id="cart">
					<c:forEach var="item" items="${cartList}">
						<c:set var="itemTotal"
							value="${item.productPrice * item.quantity}" />
						<tr data-cart-no="${item.cartNo}"
							data-product-no="${item.productNo}"
							data-product-price="${item.productPrice}"
							data-product-name="${item.productName}"
							data-product-img="${item.productImg}">
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
								<p class="mb-0 mt-4">${item.productPrice}원</p>
							</td>
							<td>
								<div class="input-group quantity mt-4" style="width: 100px;">
									<div class="input-group-btn">
										<button
											class="btn btn-sm btn-minus rounded-circle bg-light border"
											data-product-id="${item.productNo}">
											<i class="fa fa-minus"></i>
										</button>
									</div>
									<input type="text" id="quantity"
										class="form-control form-control-sm text-center border-0"
										value="${item.quantity}" readonly>
									<div class="input-group-btn">
										<button
											class="btn btn-sm btn-plus rounded-circle bg-light border"
											data-product-id="${item.productNo}">
											<i class="fa fa-plus"></i>
										</button>
									</div>
								</div>
							</td>
							<td>
								<p class="mb-0 mt-4">${itemTotal}원</p>
							</td>
							<td>
								<button onclick='remove_proNo(event)'
									data-cart-no="${item.cartNo}"
									class="btn btn-md rounded-circle bg-light border mt-4"
									data-product-id="${item.productNo}">
									<i class="fa fa-times text-danger"
										data-cart-no="${item.cartNo}"></i>
								</button>
							</td>
						</tr>
					</c:forEach>
					<c:set var="grandTotal" value="0.0" />
					<c:forEach var="item" items="${cartList}">
						<c:set var="itemTotal"
							value="${item.productPrice * item.quantity}" />
						<c:set var="grandTotal" value="${grandTotal + itemTotal}" />
					</c:forEach>
					<c:set var="shippingCost" value="3000" />
					<c:set var="totalAmount" value="${grandTotal + shippingCost}" />
				</tbody>
			</table>
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
							<p id="grandTotal" class="mb-0">${grandTotal}원</p>
						</div>
						<div class="d-flex justify-content-between">
							<h5 class="mb-0 me-4">배송비</h5>
							<div class="">
								<p class="mb-0">${shippingCost}원</p>
							</div>
						</div>
						<p class="mb-0 text-end">민수네 집으로 배송합니다.</p>
					</div>
					<div
						class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
						<h5 class="mb-0 ps-4 me-4">총 합계</h5>
						<p class="mb-0 pe-4">${totalAmount}원</p>
					</div>
					<form action="orderList.do" method="post" id="cartForm">
						<input type="hidden" name="grandTotal" value="${grandTotal}">
						<input type="hidden" name="shippingCost" value="${shippingCost}">
						<input type="hidden" name="totalAmount" value="${totalAmount}">
						<input type="hidden" name="productImgs" value="${productImgs}">
						<input type="hidden" name="cartNos" value="${cartNos}"> <input
							type="hidden" name="productNos" value="${productNos}"> <input
							type="hidden" name="productNames" value="${productNames}">
						<input type="hidden" name="productPrices" value="${productPrices}">
						<input type="hidden" name="quantities" value="${quantities}">
						<button
							class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
							type="submit">결제 진행</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="js/CartList.js"></script>