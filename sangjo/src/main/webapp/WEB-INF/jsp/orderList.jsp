<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
	<h1 class="text-center text-white display-6">결제</h1>
	<ol class="breadcrumb justify-content-center mb-0">
		<li class="breadcrumb-item"><a href="#">홈</a></li>
		<li class="breadcrumb-item"><a href="#">페이지</a></li>
		<li class="breadcrumb-item active text-white">결제</li>
	</ol>
</div>
<!-- Single Page Header End -->
<div class="container-fluid py-5">
	<div class="container py-5">
		<h1 class="mb-4">청구 정보</h1>
		<form action="OrderListControl.do" method="post">
			<div class="row g-5">
				<div class="col-md-12 col-lg-6 col-xl-7">
					<div class="row">
						<div class="col-md-12 col-lg-6">
							<div class="form-item w-100">
								<label class="form-label my-3">이름<sup>*</sup></label> <input
									type="text" name="firstName" class="form-control" required>
							</div>
						</div>
						<div class="col-md-12 col-lg-6">
							<div class="form-item w-100">
								<label class="form-label my-3">성<sup>*</sup></label> <input
									type="text" name="lastName" class="form-control" required>
							</div>
						</div>
					</div>

					<div class="form-item">
						<label class="form-label my-3">주소 <sup>*</sup></label> <input
							type="text" name="address" class="form-control"
							placeholder="집 번호 거리 이름" required>
					</div>
					<div class="form-item">
						<label class="form-label my-3">도시/구<sup>*</sup></label> <input
							type="text" name="city" class="form-control" required>
					</div>

					<div class="form-item">
						<label class="form-label my-3">우편번호<sup>*</sup></label> <input
							type="text" name="zipcode" class="form-control" required>
					</div>
					<div class="form-item">
						<label class="form-label my-3">휴대폰<sup>*</sup></label> <input
							type="tel" name="phone" class="form-control" required>
					</div>

					<hr>

					<div class="form-item">
						<textarea name="orderNote" class="form-control" spellcheck="false"
							cols="30" rows="11" placeholder="주문 메모 (선택 사항)"></textarea>
					</div>
				</div>
				<div class="col-md-12 col-lg-6 col-xl-5">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">제품</th>
									<th scope="col">이름</th>
									<th scope="col">가격</th>
									<th scope="col">수량</th>
									<th scope="col">합계</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="i" begin="0" end="${fn:length(cartNos)-1}"
									step="1">
									<tr>
										<td><p>${cartNos[i]}</p></td>
										<td><p>${productNos[i]}</p></td>
										<td><p>${productPrices[i]}원</p></td>
										<td><p>${productNames[i]}</p></td>
										<td><img src="img/${productImgs[i]}"></td>
										<td><p>${quantities[i]}</p></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div
						class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
						<div class="col-12">
							<div class="form-check text-start my-3">
								<input type="checkbox"
									class="form-check-input bg-primary border-0" id="Transfer-1"
									name="paymentMethod" value="DirectBankTransfer"> <label
									class="form-check-label" for="Transfer-1">직접 은행 이체</label>
							</div>
							<p class="text-start text-dark">주문 ID를 결제 참조로 사용해 저희 은행 계좌로
								직접 결제해 주세요. 자금이 계좌에 입금된 후에만 주문이 발송됩니다.</p>
						</div>
					</div>


					<div
						class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
						<div class="col-12">
							<div class="form-check text-start my-3">
								<input type="checkbox"
									class="form-check-input bg-primary border-0" id="Paypal-1"
									name="paymentMethod" value="Paypal"> <label
									class="form-check-label" for="Paypal-1">Paypal</label>
							</div>
						</div>
					</div>
					<div
						class="row g-4 text-center align-items-center justify-content-center pt-4">
						<button type="submit"
							class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">주문하기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script src="js/CartList.js"></script>