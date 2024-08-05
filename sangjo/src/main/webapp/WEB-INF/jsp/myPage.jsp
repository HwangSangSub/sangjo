<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
	<h1 class="text-center text-white display-6">Contact</h1>
	<ol class="breadcrumb justify-content-center mb-0">
		<li class="breadcrumb-item"><a href="#">Home</a></li>
		<li class="breadcrumb-item"><a href="#">Pages</a></li>
		<li class="breadcrumb-item active text-white">Contact</li>
	</ol>
</div>
<!-- Single Page Header End -->

<div class="container-fluid contact py-5">
	<div class="container py-5">
		<div class="p-5 bg-light rounded">

			<!-- 탭 메뉴 -->
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="userinfo-tab"
						data-bs-toggle="tab" data-bs-target="#userinfo" type="button"
						role="tab" aria-controls="userinfo" aria-selected="true">회원정보</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="myreview-tab" data-bs-toggle="tab"
						data-bs-target="#myreview" type="button" role="tab"
						aria-controls="myreview" aria-selected="false">내리뷰목록</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="wishlist-tab" data-bs-toggle="tab"
						data-bs-target="#wishlist" type="button" role="tab"
						aria-controls="wishlist" aria-selected="false">위시리스트</button>
				</li>
			</ul>

			<!-- 내용 -->
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="userinfo" role="tabpanel" aria-labelledby="userinfo-tab">
					<!-- 헤더 부분 -->
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
					</div>
					<!--  몸통 부분 -->
					<div class="modal-body d-flex align-items-center">
						<div class="input-group w-50 mx-auto d-flex">
							<label for="memberPw" class="col-form-label">비밀번호</label> <input
								type="text" class="form-control" id="memberPw"
								placeholder="비밀번호 (20자)">
						</div>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group w-50 mx-auto d-flex">
							<label for="memberName" class="col-form-label">이름</label> <input
								type="text" class="form-control" id="memberName"
								placeholder="이름 (8자)">
						</div>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group w-50 mx-auto d-flex">
							<label for="memberPhone" class="col-form-label">전화번호</label> <input
								type="text" class="form-control" id="memberPhone"
								placeholder="전화번호 (11자)">
						</div>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group w-50 mx-auto d-flex">
							<label for="memberEmail" class="col-form-label">이메일</label> <input
								type="text" class="form-control" id="memberEmail"
								placeholder="이메일 작성">
						</div>
					</div>
					<!-- 주소는 향후에 추가 -->
					<div class="modal-body d-flex align-items-center">
						<div class="input-group w-50 mx-auto d-flex">
							<input type="reset" class="btn btn-secondary" value="초기화"></input>
							<input type="button" id="joinBtn" class="btn btn-primary" value="회원가입" disabled></input>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="myreview" role="tabpanel" aria-labelledby="myreview-tab">
					<!-- 헤더 부분 -->
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">내리뷰리스트 탭</h5>
					</div>
				</div>
				<div class="tab-pane fade" id="wishlist" role="tabpanel" aria-labelledby="wishlist-tab">
					<!-- 헤더 부분 -->
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">위시리스트 탭</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>