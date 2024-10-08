<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<script>
//회원 변수(공통 사용) <-- el 테그를 사용하므로 jsp 파일내에 작성해야한다.
let memberId = "${member.memberId}";
</script>
<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
	<h1 class="text-center text-white display-6">상품목록</h1>
</div>
<!-- Single Page Header End -->


<!-- Fruits Shop Start-->
<div class="container-fluid fruite py-5">

	<div class="container py-5">
		<h1 class="mb-4">쇼핑</h1>
		<div class="row g-4">
			<div class="col-lg-12">
				<div class="row g-4">
					<div class="col-xl-3">
						<div class="input-group w-100 mx-auto d-flex">
							<input type="text" id="keyword" class="form-control p-3"
								placeholder="검색어입력" aria-describedby="search-icon-1"
								value="${keyword }"> <input type="hidden" id="nowCdName" value="${searching.cdName }"/>
							<span id="search-icon-1" class="input-group-text p-3"><i
								class="fa fa-search"></i></span>
						</div>
					</div>
					<div class="col-6"></div>
					<div class="col-xl-3">
						<div
							class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
							<label for="fruits">정렬:</label> 
							<select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3" form="fruitform">
								<option value="latest" ${searching.order == 1 ? "selected" : "" }>최신등록순</option>
								<option value="lowPrice" ${searching.order == 2 ? "selected" : "" }>낮은금액순</option>
								<option value="highPrice" ${searching.order == 3 ? "selected" : "" }>높은금액순</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row g-4">
					<div class="col-lg-3">
						<div class="row g-4">
							<div class="col-lg-12">
								<div class="mb-3">
									<h4>카테고리</h4>
									<ul class="list-unstyled fruite-categorie">
										<c:forEach var="item" items="${categoryList }">
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#" data-bs-toggle="collapse"
														data-bs-target="#collapseBody_${item.categoryName }"
														id="categorySelectList"> <i
														class="fas fa-apple-alt me-2"></i><span>${item.categoryName }</span></a>
													<span>(3)</span>
												</div>
												<div class="collapse cloneapse"
													id="collapseBody_${item.categoryName }">
													<div class="card card-body" style="display: none;"></div>
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
							<div class="col-md-6 col-lg-6 col-xl-4" id="orgProductList"
								style="display: none;">
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
										<h4>
											<c:choose>
												<c:when test="${fn:length(item.productName) > 26}">
													<c:out value="${fn:substring(item.productName, 0, 25)}">
													</c:out>...
											</c:when>
												<c:otherwise>
													<c:out value="${item.productName}">
													</c:out>
												</c:otherwise>
											</c:choose>
										</h4>
										<!-- <p>${item.productContent }</p> -->
										<div class="d-flex justify-content-between flex-lg-wrap">
											<!-- <p class="text-dark fs-5 fw-bold mb-0">${item.productPrice }원</p> -->
											<p>
												<fmt:formatNumber value="${item.productPrice }"
													pattern="#,###" />원
											</p>
											<button type="button"
												onclick="addCartEvent(${item.productNo})"
												class="btn border border-secondary rounded-pill px-3 text-primary">
												<i class="fa fa-shopping-bag me-2 text-primary"
													onclick="addCartEvent(${item.productNo})"></i>장바구니 추가
											</button>
										</div>
									</div>
								</div>
							</div>
							<c:forEach var="item" items="${productList }">
								<div class="col-md-6 col-lg-6 col-xl-4" id="orgProductList"
									data-product-no="${item.productNo}">
									<div class="rounded position-relative fruite-item">
										<div class="fruite-img"
											style="border-color: #ffb524 1px solid !important;">
											<img src="img/product/${item.productImg }"
												class="img-fluid w-100 rounded-top" alt="">
										</div>
										<div
											class="text-white bg-secondary px-3 py-1 rounded position-absolute"
											style="top: 10px; left: 10px;">${item.cdName }</div>
										<div
											class="p-4 border border-secondary border-top-0 rounded-bottom">
											<h4>
												<c:choose>
													<c:when test="${fn:length(item.productName) > 26}">
														<c:out value="${fn:substring(item.productName, 0, 25)}">
														</c:out>...
											</c:when>
													<c:otherwise>
														<c:out value="${item.productName}">
														</c:out>
													</c:otherwise>
												</c:choose>
											</h4>
											<!-- <p>${item.productContent }</p> -->
											<div class="d-flex justify-content-between flex-lg-wrap">
												<!-- <p class="text-dark fs-5 fw-bold mb-0">${item.productPrice }원</p> -->
												<p>
													<fmt:formatNumber value="${item.productPrice }"
														pattern="#,###" />원
												</p>
												<button type="button"
													onclick="addCartEvent(${item.productNo})"
													class="btn border border-secondary rounded-pill px-3 text-primary">
													<i class="fa fa-shopping-bag me-2 text-primary"
														onclick="addCartEvent(${item.productNo})"></i>장바구니 추가
												</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-12" style="margin-left:150px;">
						<div class="pagination d-flex justify-content-center mt-5">
							<input type="hidden" id="startPage" value="${paging.startPage-1}" />
							<input type="hidden" id="endPage" value="${paging.endPage+1}" />
							<c:if test="${paging.prev}">
								<a class="rounded prev">&laquo;</a> 
							</c:if>
							<c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage }">
								<c:choose>
									<c:when test="${paging.page == p}">
										<a class="active rounded pageNum" data-page="${p}">${p}</a> 
									</c:when>
									<c:otherwise>
										<a class="rounded pageNum" data-page="${p}">${p}</a> 
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.next}">
								<a class="rounded next">&raquo;</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Fruits Shop End-->

<script src="js/category.js"></script>