<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
	<h1 class="text-center text-white display-6">주문 확인</h1>
	<ol class="breadcrumb justify-content-center mb-0">
		<li class="breadcrumb-item"><a href="#">홈</a></li>
		<li class="breadcrumb-item"><a href="#">페이지</a></li>
		<li class="breadcrumb-item active text-white">주문 확인</li>
	</ol>
</div>
<!-- Single Page Header End -->

<div class="container-fluid py-5">
	<div class="container py-5">
		<h1 class="mb-4">주문 정보 확인</h1>
		<form action="order.do" method="post">
			<div class="row g-5">
				<div class="col-md-12 col-lg-6 col-xl-7">
					<div class="form-item w-100">
						<label class="form-label my-3">이름</label> <input type="text"
							class="form-control" name="fullName" value="${fullName}" readonly>
					</div>
					<div class="form-item">
						<label class="form-label my-3">휴대폰</label> <input type="tel"
							class="form-control" name="phone" value="${phone}" readonly>
					</div>
					<div class="form-item">
						<label class="form-label my-3">주소</label> <input type="text"
							class="form-control" name="address" value="${address}" readonly>
					</div>
					<div class="form-item">
						<label class="form-label my-3">상세주소</label> <input type="text"
							class="form-control" name="detailAddress"
							value="${detailAddress}" readonly>
					</div>
					<div class="form-item">
						<input name="orderMemo" value="${orderMemo}" class="form-control"
							spellcheck="false" readonly></input>
					</div>
					<hr>
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
								<c:set var="subtotal" value="0" />
								<c:forEach var="i" begin="0"
									end="${fn:length(fn:split(productNos, ','))-1}">
									<tr>
										<th scope="row">
											<div class="d-flex align-items-center mt-2">
												<img
													src="${pageContext.request.contextPath}/img/${fn:split(productImgs, ',')[i]}"
													class="img-fluid rounded-circle"
													style="width: 90px; height: 90px;" alt="">
											</div>
										</th>
										<td class="py-5">${fn:split(productNames, ',')[i]}</td>
										<td class="py-5">${fn:split(productPrices, ',')[i]}원</td>
										<td class="py-5">${fn:split(quantities, ',')[i]}</td>
										<td class="py-5"><c:set var="price"
												value="${fn:split(productPrices, ',')[i]}" /> <c:set
												var="quantity" value="${fn:split(quantities, ',')[i]}" /> <c:set
												var="total" value="${price * quantity}" /> ${total}원 <c:set
												var="subtotal" value="${subtotal + total}" /></td>
									</tr>
								</c:forEach>
								<tr>
									<th scope="row"></th>
									<td class="py-5"></td>
									<td class="py-5"></td>
									<td class="py-5">
										<p class="mb-0 text-dark py-3">소계</p>
									</td>
									<td class="py-5">
										<div class="py-3 border-bottom border-top">
											<p class="mb-0 text-dark">${subtotal}원</p>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"></th>
									<td class="py-5">
										<p class="mb-0 text-dark py-4">배송비</p>
									</td>
									<td colspan="3" class="py-5 text-end">
										<p class="mb-0 text-dark py-3">고정 요금: 3,000원</p>
									</td>
								</tr>
								<tr>
									<th scope="row"></th>
									<td class="py-5">
										<p class="mb-0 text-dark text-uppercase py-3">총합</p>
									</td>
									<td class="py-5"></td>
									<td class="py-5"></td>
									<td class="py-5">
										<div class="py-3 border-bottom border-top">
											<p class="mb-0 text-dark">${subtotal + 3000}원</p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div
						class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
						<div class="col-12">
							<div class="form-check text-start my-3">
								<input type="checkbox"
									class="form-check-input bg-primary border-0" id="Transfer-1"
									name="Transfer" value="Transfer" checked> <label
									class="form-check-label" for="Transfer-1">직접 은행 이체</label>
							</div>
							<p class="text-start text-dark">주문 ID를 결제 참조로 사용해 저희 은행 계좌로
								직접 결제해 주세요. 자금이 계좌에 입금된 후에만 주문이 발송됩니다.</p>

						</div>
					</div>
				</div>

			</div>
	</div>
	<div
		class="row g-4 text-center align-items-center justify-content-center pt-4">
		<input type="hidden" name="memberId" value="${member.memberId}">
		<button type="submit"
			class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">주문하기</button>
	</div>
	</form>
</div>
</div>


