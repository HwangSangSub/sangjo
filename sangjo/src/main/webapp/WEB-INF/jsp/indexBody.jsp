<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<script>
//회원 변수(공통 사용) <-- el 테그를 사용하므로 jsp 파일내에 작성해야한다.
let memberId = "${member.memberId}";
</script>

<!-- Modal Search Start -->
<div class="modal fade" id="searchModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-fullscreen">
		<div class="modal-content rounded-0">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Search by
					keyword</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body d-flex align-items-center">
				<div class="input-group w-75 mx-auto d-flex">
					<input type="search" class="form-control p-3"
						placeholder="keywords" aria-describedby="search-icon-1"> <span
						id="search-icon-1" class="input-group-text p-3"><i
						class="fa fa-search"></i></span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal Search End -->
<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
	<h1 class="text-center text-white display-6">상품보기</h1>
	<ol class="breadcrumb justify-content-center mb-0">
		<li class="breadcrumb-item"><a href="#">집</a></li>
		<li class="breadcrumb-item"><a href="#">페이지</a></li>
		<li class="breadcrumb-item active text-white">가게</li>
	</ol>
</div>
<!-- Single Page Header End -->


<!-- Fruits Shop Start-->
<div class="container-fluid fruite py-5">

	<div class="container py-5">
		<h1 class="mb-4">신선한 과일 가게</h1>
		<div class="row g-4">
			<div class="col-lg-12">
				<div class="row g-4">
					<div class="col-xl-3">
						<div class="input-group w-100 mx-auto d-flex">
							<input type="search" class="form-control p-3"
								placeholder="keywords" aria-describedby="search-icon-1">
							<span id="search-icon-1" class="input-group-text p-3"><i
								class="fa fa-search"></i></span>
						</div>
					</div>
					<div class="col-6"></div>
					<div class="col-xl-3">
						<div
							class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
							<label for="fruits">Default Sorting:</label> <select id="fruits"
								name="fruitlist" class="border-0 form-select-sm bg-light me-3"
								form="fruitform">
								<option value="volvo">Nothing</option>
								<option value="saab">Popularity</option>
								<option value="opel">Organic</option>
								<option value="audi">Fantastic</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row g-4">
					<div class="col-lg-3">
						<div class="row g-4">
							<div class="col-lg-12">
								<div class="mb-3">
									<h4>Categories</h4>
									<ul class="list-unstyled fruite-categorie">
										<c:forEach var="item" items="${categoryList }">
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#" data-bs-toggle="collapse"
														data-bs-target="#collapseBody_${item.categoryName }" id="categorySelectList">
														<i class="fas fa-apple-alt me-2"></i><span>${item.categoryName }</span></a> <span>(3)</span>
												</div>
												<div class="collapse cloneapse"
													id="collapseBody_${item.categoryName }">
													<div class="card card-body" style="display:none;"></div>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="position-relative">
									<img src="img/banner-fruits.jpg"
										class="img-fluid w-100 rounded" alt="">
									<div class="position-absolute"
										style="top: 50%; right: 10px; transform: translateY(-50%);">
										<h3 class="text-secondary fw-bold">
											Fresh <br> 과일 <br> Banner
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="row g-4 justify-content-center" id="productList">
							<div class="col-md-6 col-lg-6 col-xl-4" style="display: none;">
								<div class="rounded position-relative fruite-item">
									<div class="fruite-img">
										<img src="img/product/${item.productImg }"
											class="img-fluid w-100 rounded-top" alt="">
									</div>
									<div
										class="text-white bg-secondary px-3 py-1 rounded position-absolute"
										 style="top: 10px; left: 10px;">${item.cdName}</div>
									<div
										class="p-4 border border-secondary border-top-0 rounded-bottom">
										<h4>${item.productName}</h4>
										<p>${item.productContent }</p>
										<div class="d-flex justify-content-between flex-lg-wrap">
											<p class="text-dark fs-5 fw-bold mb-0">${item.productPrice }원</p>
											<a href="#"
												class="btn border border-secondary rounded-pill px-3 text-primary"><i
												class="fa fa-shopping-bag me-2 text-primary"></i> 카트에 넣어라</a>
										</div>
									</div>
								</div>
							</div>
							<c:forEach var="item" items="${productList }">
								<div class="col-md-6 col-lg-6 col-xl-4">
									<div class="rounded position-relative fruite-item">
										<div class="fruite-img" style="border-color: #ffb524 1px solid !important;">
											<img src="img/product/${item.productImg }"
												class="img-fluid w-100 rounded-top" alt="">
										</div>
										<div
											class="text-white bg-secondary px-3 py-1 rounded position-absolute"
											style="top: 10px; left: 10px;">${item.cdName }</div>
										<div
											class="p-4 border border-secondary border-top-0 rounded-bottom">
											<h4>${item.productName}</h4>
											<p>${item.productContent }</p>
											<div class="d-flex justify-content-between flex-lg-wrap">
												<p class="text-dark fs-5 fw-bold mb-0">${item.productPrice }원</p>
												<a href="#"
													class="btn border border-secondary rounded-pill px-3 text-primary"><i
													class="fa fa-shopping-bag me-2 text-primary"></i> Add to
													cart</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-12">
						<div class="pagination d-flex justify-content-center mt-5">
							<a href="#" class="rounded">&laquo;</a> <a href="#"
								class="active rounded">1</a> <a href="#" class="rounded">2</a> <a
								href="#" class="rounded">3</a> <a href="#" class="rounded">4</a>
							<a href="#" class="rounded">5</a> <a href="#" class="rounded">6</a>
							<a href="#" class="rounded">&raquo;</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Fruits Shop End-->

<script src="js/category.js"></script>