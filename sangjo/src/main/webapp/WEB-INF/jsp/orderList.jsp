<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		<form action="#">
			<div class="row g-5">
				<div class="col-md-12 col-lg-6 col-xl-7">
					<div class="row">
						<div class="col-md-12 col-lg-6">
							<div class="form-item w-100">
								<label class="form-label my-3">이름<sup>*</sup></label> <input
									type="text" class="form-control">
							</div>
						</div>
						<div class="col-md-12 col-lg-6">
							<div class="form-item w-100">
								<label class="form-label my-3">성<sup>*</sup></label> <input
									type="text" class="form-control">
							</div>
						</div>
					</div>

					<div class="form-item">
						<label class="form-label my-3">주소 <sup>*</sup></label> <input
							type="text" class="form-control" placeholder="집 번호 거리 이름">
					</div>
					<div class="form-item">
						<label class="form-label my-3">도시/구<sup>*</sup></label> <input
							type="text" class="form-control">
					</div>

					<div class="form-item">
						<label class="form-label my-3">우편번호<sup>*</sup></label> <input
							type="text" class="form-control">
					</div>
					<div class="form-item">
						<label class="form-label my-3">휴대폰<sup>*</sup></label> <input
							type="tel" class="form-control">
					</div>


					<hr>

					<div class="form-item">
						<textarea name="text" class="form-control" spellcheck="false"
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
								<tr>
									<th scope="row">
										<div class="d-flex align-items-center mt-2">
											<img src="img/vegetable-item-2.jpg"
												class="img-fluid rounded-circle"
												style="width: 90px; height: 90px;" alt="">
										</div>
									</th>
									<td class="py-5">멋쟁이 토마토</td>
									<td class="py-5">$999.00</td>
									<td class="py-5">2</td>
									<td class="py-5">$138.00</td>
								</tr>
								<tr>
									<th scope="row">
										<div class="d-flex align-items-center mt-2">
											<img src="img/vegetable-item-5.jpg"
												class="img-fluid rounded-circle"
												style="width: 90px; height: 90px;" alt="">
										</div>
									</th>
									<td class="py-5">나는야 감자</td>
									<td class="py-5">$69.00</td>
									<td class="py-5">2</td>
									<td class="py-5">$138.00</td>
								</tr>
								<tr>
									<th scope="row">
										<div class="d-flex align-items-center mt-2">
											<img src="img/vegetable-item-3.png"
												class="img-fluid rounded-circle"
												style="width: 90px; height: 90px;" alt="">
										</div>
									</th>
									<td class="py-5">원숭이 밥</td>
									<td class="py-5">$69.00</td>
									<td class="py-5">2</td>
									<td class="py-5">$138.00</td>
								</tr>
								<tr>
									<th scope="row"></th>
									<td class="py-5"></td>
									<td class="py-5"></td>
									<td class="py-5">
										<p class="mb-0 text-dark py-3">소계</p>
									</td>
									<td class="py-5">
										<div class="py-3 border-bottom border-top">
											<p class="mb-0 text-dark">$414.00</p>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"></th>
									<td class="py-5">
										<p class="mb-0 text-dark py-4">배송비</p>
									</td>
									<td colspan="3" class="py-5">

										<div class="form-check text-start">
											<input type="checkbox"
												class="form-check-input bg-primary border-0" id="Shipping-2"
												name="Shipping-1" value="Shipping"> <label
												class="form-check-label" for="Shipping-2">고정 요금:
												3,000원 </label>
										</div>

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
											<p class="mb-0 text-dark">$999.00</p>
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
									name="Transfer" value="Transfer"> <label
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
									name="Paypal" value="Paypal"> <label
									class="form-check-label" for="Paypal-1">Paypal</label>
							</div>
						</div>
					</div>
					<div
						class="row g-4 text-center align-items-center justify-content-center pt-4">
						<button type="button"
							class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">주문
							하기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>