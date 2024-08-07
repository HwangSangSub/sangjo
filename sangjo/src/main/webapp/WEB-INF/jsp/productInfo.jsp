<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
	<h1 class="text-center text-white display-6">Shop Detail</h1>
	<ol class="breadcrumb justify-content-center mb-0">
		<li class="breadcrumb-item"><a href="#">Home</a></li>
		<li class="breadcrumb-item"><a href="#">Pages</a></li>
		<li class="breadcrumb-item active text-white">Shop Detail</li>
	</ol>
</div>
<!-- Single Page Header End -->
<div class="container-fluid py-5 mt-5">
	<div class="container py-5">
		<div class="row g-4 mb-5">
			<div class="col-lg-8 col-xl-12">
				<div class="row g-4">
					<div class="col-lg-6">
						<div class="border rounded">
							<a href="#"> 
								<img src="${productMain.productImg}"
									class="img-fluid rounded" alt="${productMain.productImg}">
							</a>
						</div>
					</div>
					<div class="col-lg-6">
						<h4 class="fw-bold mb-3">${productMain.productName}</h4>
						<p class="mb-3">Category: ${category.cdName}</p>
						<h5 class="fw-bold mb-3">${productMain.productPrice}원</h5>
						<!-- 리뷰 파트가 생기면 적용하자.-->
						<div class="d-flex mb-4">
							<i class="fa fa-star text-secondary"></i> <i
								class="fa fa-star text-secondary"></i> <i
								class="fa fa-star text-secondary"></i> <i
								class="fa fa-star text-secondary"></i> <i class="fa fa-star"></i>
						</div>
						<p class="mb-4">
							${productMain.productContent}
						</p>
						<p class="mb-4">
							${productMain.regDate}
						</p>
						<!-- 장바구니에 값추가 -->
						<a id="cartAdd"
							class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i
							class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
					</div>
					<div class="col-lg-12">
						<nav>
							<div class="nav nav-tabs mb-3">
								<button class="nav-link active border-white border-bottom-0"
									type="button" role="tab" id="nav-about-tab"
									data-bs-toggle="tab" data-bs-target="#nav-about"
									aria-controls="nav-about" aria-selected="true">Description</button>
								<button class="nav-link border-white border-bottom-0"
									type="button" role="tab" id="nav-mission-tab"
									data-bs-toggle="tab" data-bs-target="#nav-mission"
									aria-controls="nav-mission" aria-selected="false">Reviews</button>
							</div>
						</nav>
						<div class="tab-content mb-5">
							<div class="tab-pane active" id="nav-about" role="tabpanel"
								aria-labelledby="nav-about-tab">
								<p>${productMain.productContent}</p>
								<p>${productMain.regDate}</p>
							</div>
							<div class="tab-pane" id="nav-mission" role="tabpanel"
								aria-labelledby="nav-mission-tab">
								<div class="d-flex">
									<img src="img/avatar.jpg" class="img-fluid rounded-circle p-3"
										style="width: 100px; height: 100px;" alt="">
									<div class="">
										<p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
										<div class="d-flex justify-content-between">
											<h5>Jason Smith</h5>
											<div class="d-flex mb-3">
												<i class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star"></i>
											</div>
										</div>
										<p>The generated Lorem Ipsum is therefore always free from
											repetition injected humour, or non-characteristic words etc.
											Susp endisse ultricies nisi vel quam suscipit</p>
									</div>
								</div>
								<div class="d-flex">
									<img src="img/avatar.jpg" class="img-fluid rounded-circle p-3"
										style="width: 100px; height: 100px;" alt="">
									<div class="">
										<p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
										<div class="d-flex justify-content-between">
											<h5>Sam Peters</h5>
											<div class="d-flex mb-3">
												<i class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i>
											</div>
										</div>
										<p class="text-dark">The generated Lorem Ipsum is
											therefore always free from repetition injected humour, or
											non-characteristic words etc. Susp endisse ultricies nisi vel
											quam suscipit</p>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="nav-vision" role="tabpanel">
								<p class="text-dark">Tempor erat elitr rebum at clita. Diam
									dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos
									labore. 3</p>
								<p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu
									diam amet diam et eos labore. Clita erat ipsum et lorem et sit</p>
							</div>
						</div>
					</div>
					<form action="#">
						<h4 class="mb-5 fw-bold">Leave a Reply</h4>
						<div class="row g-4">
							<div class="col-lg-6">
								<div class="border-bottom rounded">
									<input type="text" class="form-control border-0 me-4"
										placeholder="Yur Name *">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="border-bottom rounded">
									<input type="email" class="form-control border-0"
										placeholder="Your Email *">
								</div>
							</div>
							<div class="col-lg-12">
								<div class="border-bottom rounded my-4">
									<textarea name="" id="" class="form-control border-0" cols="30"
										rows="8" placeholder="Your Review *" spellcheck="false"></textarea>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="d-flex justify-content-between py-3 mb-5">
									<div class="d-flex align-items-center">
										<p class="mb-0 me-3">Please rate:</p>
										<div class="d-flex align-items-center"
											style="font-size: 12px;">
											<i class="fa fa-star text-muted"></i> <i class="fa fa-star"></i>
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<a href="#"
										class="btn border border-secondary text-primary rounded-pill px-4 py-3">
										Post Comment</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<h1 class="fw-bold mb-0">Related products</h1>
		<div class="vesitable">
			<div class="owl-carousel vegetable-carousel justify-content-center">
				<!-- 아이템 하나 시작-->
				<c:forEach var="product" items="{$productList}">
					<div
						class="border border-primary rounded position-relative vesitable-item">
						<div class="vesitable-img">
							<img src=${product.productImg}
								class="img-fluid w-100 rounded-top" alt="">
						</div>
						<div
							class="text-white bg-primary px-3 py-1 rounded position-absolute"
							style="top: 10px; right: 10px;">${category.cdName}</div>
						<div class="p-4 pb-0 rounded-bottom">
							<h4>${product.productName}</h4>
							<p>${product.productContent}</p>
							<div class="d-flex justify-content-between flex-lg-wrap">
								<p class="text-dark fs-5 fw-bold">${product.productPrice}</p>
								<a href="#"
									class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
									class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<!-- 카트 (장바구니)에 값 추가하기 -->
<script>
	// 제품 변수
	let productNo = "${product.productNo}";
	// 회원 변수
	let memberId = "${member.memberId}";

	let cartAddBtn = document.querySelector('#cartAdd');
	cartAddBtn.addEventListener("click",function(e){
		let cartListVO = {
			productNo : productNo,
			memberId : memberId,
		}
		let url = "cartAdd.do";
		let optionObj = {
			method: 'post',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(
				cartListVO
			)
		}
		fetch(url,optionObj)
		.then(result => {
			return result.json();
		})
		.then(function(result){
			if(result.addCart == "Faild"){
				alert("장바구니에 추가가 실패하였습니다.");
			}else{
				alert("장바구니에 추가가 완료되었습니다.")
			}
		});
	});
</script>