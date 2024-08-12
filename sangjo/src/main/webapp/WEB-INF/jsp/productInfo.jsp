<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<head>
	<style>
		/* 내부 링크 관련 */
		.outer{
			display: flex;
		}
		.inner{
			z-index: 10;
		}
		.link{
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
		}
		/* 별점 클릭 */
		#selectStar .fa-star:hover{
			color :rgb(255,181,36);
		}
		
		/*평균 별점 표시*/
		.fa-star-half{
			z-index: 10;
		}

		.behid-star{
			margin-left: -18.1px;
		}

		/* 리뷰 페이징 링크 */
		.pagination{
			display: flex !important;
		}
		.pagination span { 
			color: var(--bs-dark);
			padding: 10px 16px;
			text-decoration: none;
			transition: 0.5s;
			border: 1px solid var(--bs-secondary);
			margin: 0 4px;
		}
	</style>
</head>
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
						<h5 class="fw-bold mb-3 price">${productMain.productPrice}</h5>
						<!-- 상품에대한 전체 리뷰 평균.-->
						<div class="d-flex mb-4">
							<c:forEach begin="1" end="5" varStatus="status">
								<c:choose>
									<c:when test="${status.count <= avgPoint}">
										<i class="fa fa-star text-secondary"></i> 
									</c:when>
									<c:when test="${status.count - avgPoint <= 0.5 
													&& status.count - avgPoint > 0 }">
										<i class="fa fa-star-half text-secondary"></i> 
										<i class="fa fa-star behid-star"></i>
									</c:when>
									<c:otherwise>
										<i class="fa fa-star "></i> 
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						<p class="mb-4">
							${productMain.productContent}
						</p>
						<!-- 장바구니에 값추가 -->
						<c:if test="${not empty member.memberId }">
							<a id="cartAdd"
							class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i
							class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
						</c:if>
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
							</div>
							<!-- 리뷰 리스트 보여주기 -->
							<div class="tab-pane" id="nav-mission" role="tabpanel"
								aria-labelledby="nav-mission-tab">
								<div id="review-list">
									<!-- 밑의 부분을 복사해서 자바스크립트로 그려줄 것이다.-->
									<div class="d-flex review-item" style="display: none !important; ">
										<img src="img/avatar.jpg" class="img-fluid rounded-circle p-3"
											style="width: 100px; height: 100px;" alt="">
										<div class="">
											<p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
											<div class="d-flex">
												<h5>Jason Smith</h5>
												<div class="d-flex mb-3" style="margin-left: 20px;">
													<i class="fa fa-star text-secondary"></i> 
													<i class="fa fa-star text-secondary"></i> 
													<i class="fa fa-star text-secondary"></i> 
													<i class="fa fa-star text-secondary"></i> 
													<i class="fa fa-star"></i>
												</div>
											</div>
											<p>The generated Lorem Ipsum is therefore always free from
												repetition injected humour, or non-characteristic words etc.
												Susp endisse ultricies nisi vel quam suscipit</p>
												<br>
										</div>
									</div>
								</div>
								<ul class="pagination"></ul>
							</div>
						</div>
					</div>
					<!-- 리뷰 추가파트 로그인 했을 때만 보이게한다. -->
					<c:if test="${not empty member.memberId }">
					<form action="addReview.do">
						<input type="hidden" name="memberId" value="${member.memberId}">
						<input type="hidden" name="productNo" value="${productMain.productNo}">
						<h4 class="mb-1 fw-bold">Leave a Reply</h4>
						<div class="row g-4">
							<div class="col-lg-12">
								<div class="border-bottom rounded my-4">
									<textarea name="reviewContent" class="form-control border-0" cols="30"
										rows="8" placeholder="Your Review *" spellcheck="false"></textarea>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="d-flex justify-content-between py-3 mb-5">
									<div class="d-flex align-items-center">
										<p class="mb-0 me-3">Please rate:</p>
										<div id="selectStar" class="d-flex align-items-center"
											style="font-size: 30px;">
											<input name="reviewPoint" type="hidden" value="0">
											<!-- 별점 주기 -->
											<i class="fa fa-star" onclick="starClickEvent(1)"></i> 
											<i class="fa fa-star" onclick="starClickEvent(2)"></i>
											<i class="fa fa-star" onclick="starClickEvent(3)"></i> 
											<i class="fa fa-star" onclick="starClickEvent(4)"></i> 
											<i class="fa fa-star" onclick="starClickEvent(5)"></i>
										</div>
									</div>
									<input type="submit"
										class="btn border border-secondary text-primary rounded-pill px-4 py-3"
										value="Post Comment">
										</input>
								</div>
							</div>
						</div>
					</form>
					<button onclick="removeReviewClick()"></button>
					</c:if>
				</div>
			</div>
		</div>
		<h1 class="fw-bold mb-0">Related products</h1>
		<div class="vesitable">
			<!-- 밑의 div의 클래스들은 아래의 div 객체의 개수를 통해 특정개수이상이되면
			좌우 이동버튼을 만들어준다. -->
			<div class="owl-carousel vegetable-carousel justify-content-center">
				
				<!-- 아이템 반복문 -->
				<c:forEach var="product" items="${productLsit}">	
					<div class="border border-primary rounded position-relative vesitable-item outer">				
						<a href="productInfo.do?productNo=${product.productNo }" class="link"></a>
						<div class="vesitable-img">
							<img src="${product.productImg }"
								class="img-fluid w-100 rounded-top" alt=""/>
						</div>
						<div
							class="text-white bg-primary px-3 py-1 rounded position-absolute"
							style="top: 10px; right: 10px;">${category.cdName}
						</div>
						<div class="p-4 pb-0 rounded-bottom">
							<h4>${product.productName}</h4>
							<p class="productListContents">${product.productContent}</p>
							<div class="d-flex justify-content-between flex-lg-wrap">
								<p class="text-dark fs-5 fw-bold price">${product.productPrice}</p>
								<c:if test="${not empty member.memberId }">
									<button onclick="addCartEvent('${product.productNo}','${product.productName}')" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary inner">
										<i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart
									</button>
								</c:if>
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
	// 회원 변수(공통 사용)
	let memberId = "${member.memberId}";

	// 매인 제품에서의 카트에 값 추가
	let productNo = "${productMain.productNo}";
	let productName = "${productMain.productName}"
	let cartAddBtn = document.querySelector('#cartAdd');
	if(cartAddBtn != null){
		// 버튼에 이벤트추가는 null 이 아닐경우에만 해주자 
		cartAddBtn.addEventListener("click",function(e){
			let cartListVO = {
				productNo : productNo,
				productName : productName,
				memberId : memberId,
			}
			addCart(cartListVO);
		});
	}

	// 같은 카테고리 상품에서의 카트에 값 추가
	function addCartEvent(productNo, productName){
		let cartListVO = {
			productNo : productNo,
			productName : productName,
			memberId : memberId,
		}
		addCart(cartListVO);
	}
</script>
<!-- 상품 추가하는 요청 -->
<script>
	function addCart(cartListVO){
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
				alert("장바구니에 "+cartListVO.productName+"추가가 실패하였습니다.");
			}else{
				alert("장바구니에 "+cartListVO.productName+"추가가 완료되었습니다.")
			}
		});
	}
</script>
<!-- 가격 표시하기 -->
<script>
	let priceTexts = document.querySelectorAll('.price');
	priceTexts.forEach(function(price){
		price.innerText = numberToPrice(price.innerText) + "원";
	})
	function numberToPrice(number){
		let count = 0;
		let newPrice =[];
		for(let i = number.length; i >= 0; i--){
			newPrice.unshift(number[i]);
			if(count % 3 == 0 && count != 0){
				newPrice.unshift(',');
			}
			count++;
		}
		return newPrice.join('');
	}
</script>
<!-- 글짜 제한하기 -->
<script>
	let contentTexts = document.querySelectorAll('.productListContents');
	contentTexts.forEach(function(content){
		let contentText = content.innerText;
		if(contentText.length >= 50 ){
			content.innerText = contentText.substring(contentText, 50) + "...";
		}else{
			let needCount = 50 - contentText.length;
			contentText += "<span style='color:white'>"
			for(let i = 0; i<needCount; i++){
				contentText += "아";
			}
			contentText += "</span>"
			content.innerHTML = contentText;
		}
	})
</script>
<!-- 별점 입력하기 -->
<script>
	function starClickEvent(starPoint){
		// jsp 에의하여 해당 변수들이 가리키는 테그가 사라지기때문에
		// 메서드 안으로 집어넣었다.
		let selectStarDiv = document.querySelector('#selectStar');
		let selectStarInput = selectStarDiv.querySelector('input');
		let selectStarStars = selectStarDiv.querySelectorAll('.fa-star');

		selectStarInput.value = starPoint;
		selectStarStars.forEach(function(element){
			if(--starPoint >= 0){
				element.style.color = "rgb(255,181,36)";
			}else{
				element.style.color = "rgb(116, 125, 136)";
			}
		});
	}
</script>
<!-- 리뷰 추가 결과 출력하기 -->
<script>
	// url 에서 자료를 가져와 출력한다.
	let query = window.location.search;
	let urlParams = new URLSearchParams(query);
	let addReviewResult = urlParams.get('addReviewResult');
	if(addReviewResult != null){
		if(addReviewResult == "WrongPoint"){
			alert("별을 찍어 점수를 선택해주시길 바랍니다.");
		}else if(addReviewResult == "AlreadyReview"){
			alert("이미 리뷰가 존재합니다.");
		}else if(addReviewResult == "Success"){
			alert("리뷰추가가 완료되었습니다.");
		}
	}
</script>
<!-- 리뷰 서비스 -->
<script>
	const reviewService = {
		getReviewList({productMainNo,reviewPage},loadCallback){
			const xhtp = new XMLHttpRequest();
			xhtp.open('get',"reivewList.do?productMainNo="+productMainNo+
				"&reviewPage="+reviewPage);
			xhtp.send();
			xhtp.onload = loadCallback;
		},
		reviewCnt(productMainNo = 1, loadCallback){
			const xhtp = new XMLHttpRequest();
			xhtp.open('get','reviewCount.do?productMainNo='+productMainNo);
			xhtp.send();
			xhtp.onload = loadCallback;
		},
		removeReview({productMainNo,memberId},loadCallback){
			const xhtp = new XMLHttpRequest();
			xhtp.open('get',"removeReview.do?productMainNo="+productMainNo+
				"&memberId="+memberId);
			xhtp.send();
			xhtp.onload = loadCallback;
		}
	}
</script>
<!-- 리뷰 리스트 그리기 -->
<script>
	const productMainNo = "${productMain.productNo}";// el 테그를 사용하기 때문에 jsp 파일과 한곳에 있어야한다.
	let reviewPage=1;
	let reviewDiv = document.querySelector('#review-list');
	
	showReviewList();
	// 리뷰 리스트 보여주기
	function showReviewList(){
		reviewDiv.querySelectorAll('.review-item').forEach((div,idx) => {
			//console.log("제거작업");
			// 첫번째 자료는 복제를 위해 필요하므로 제거하지 않는다.
			if(idx != 0){
				div.remove();
			}
		})
		reviewService.getReviewList({productMainNo,reviewPage},function(){
			let result = JSON.parse(this.responseText);
			result.forEach(review => {
				reviewDiv.appendChild(makeRow(review));
			})
		})
		// 페이지 번호 부분 출력
		reviewService.reviewCnt(productMainNo,createPageList);
	}
	// 리뷰 객체 만들기
	function makeRow(review = {}){
		let cloned = document.querySelector('#review-list > .d-flex')
			.cloneNode(true);
		cloned.style.display='block';
		//console.log(review);
		cloned.querySelector('h5').innerText = review.memberId;
		cloned.querySelector('div > p:nth-of-type(1)').innerText= review.regDate;
		cloned.querySelector('div > p:nth-of-type(2)').innerText= review.reviewContent;
		let starsHTMLString="";
		for(let i = 1; i <= 5; i++){
			if( i <= review.reviewPoint){
				starsHTMLString += "<i class='fa fa-star text-secondary'></i>"
			}else{
				starsHTMLString += "<i class='fa fa-star'></i>"
			}
		}
		let starsDiv = cloned.querySelector('div > div > div >div').innerHTML = starsHTMLString;

		return cloned;
	}

	// 페이지 링크 그리기
	function createPageList(){
		let result = JSON.parse(this.responseText);
		let reviewCnt = result.reviewCnt;
		let startPage, endPage;
		let next, prev;
		let realEnd = Math.ceil(reviewCnt/5);
		let nowPage = reviewPage;

		endPage = Math.ceil(nowPage/10) * 10;
		startPage = endPage - 9;
		endPage = endPage > realEnd ? realEnd : endPage;

		prev = startPage > 1; // 이전 10개의 페이지를 구분.
		next = endPage < realEnd ? true : false;

		// 기존 html 지우기
		document.querySelector('ul.pagination').innerHTML = '';

		// prev 링크
		let li = document.createElement('li');
		li.className = 'page-item';
		if(prev){
			let aTag = document.createElement('a');
			aTag.setAttribute('data-page',startPage -1);
			aTag.className = 'page-link';
			aTag.innerHTML = 'prev';
			li.appendChild(aTag);
		}else{
			li.classList.add('disabled'); // li 요소의 클래스 추가.
			let span = document.createElement('span');
			span.className = 'page-link';
			span.innerHTML = 'prev';
			li.appendChild(span);
		}
		document.querySelector('ul.pagination').appendChild(li);

		// 리뷰 페이지 링크 10개 출력
		for(let i = startPage; i <= endPage; i++){
			let li = document.createElement('li');
			li.className = 'page-item';
			if(nowPage == i){
				li.classList.add('active');
				let span = document.createElement('span');
				span.className = 'page-link';
				span.innerHTML = i;
				li.appendChild(span);				
			}else{
				let aTag = document.createElement('a');
				aTag.setAttribute('data-page',i);
				aTag.className = 'page-link';
				aTag.innerHTML = i;
				li.appendChild(aTag);
			}
			document.querySelector('ul.pagination').appendChild(li);
		}

		// next 링크
		li = document.createElement('li');
		li.className = 'page-item';
		if(next){ // next가 존재여부이다.
			let aTag = document.createElement('a');
			aTag.setAttribute('data-page',endPage + 1 );
			aTag.className = 'page-link';
			aTag.innerHTML = 'next';
			li.appendChild(aTag);
		}else{
			li.classList.add('disabled'); 
			let span = document.createElement('span');
			span.className = 'page-link';
			span.innerHTML = 'next';
			li.appendChild(span);
		}
		document.querySelector('ul.pagination').appendChild(li);

		pageMoveEvent();
	}

	function pageMoveEvent(){
		document.querySelectorAll('ul.pagination a')
			.forEach(item=>{
				item.addEventListener('click', function(e){
					reviewPage = item.dataset.page;
					showReviewList();
				})
			})
	}
</script>
<!-- 리뷰 삭제하기 -->
<script>
	function removeReviewClick(){
		reviewService.removeReview({productMainNo,memberId},function(e){
			let result = JSON.parse(this.responseText);
			if(result.removeReview == "Success"){
				alert("삭제 성공");
			}else{
				alert("삭제 실패");
			}
		})
	}
</script>