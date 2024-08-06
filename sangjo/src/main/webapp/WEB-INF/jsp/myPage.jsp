<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
div.input-group>label.col-form-label {
	width: 80px;
}
</style>
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
					<button class="nav-link" id="myorder-tab" data-bs-toggle="tab"
						data-bs-target="#myorder" type="button" role="tab"
						aria-controls="myorder" aria-selected="false">주문내역</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="myinquiry-tab" data-bs-toggle="tab"
						data-bs-target="#myinquiry" type="button" role="tab"
						aria-controls="myinquiry" aria-selected="false">문의내역</button>
				</li>
			</ul>

			<!-- 내용 -->
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="userModInfo" role="tabpanel"
					aria-labelledby="userinfo-tab">
					<!-- 헤더 부분 -->
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
						${member }
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group mx-auto d-flex">
							<label for="memberId" class="col-form-label">아이디</label> <input
								type="text" class="form-control" id="memberId"
								value="${member.memberId }" readonly>
						</div>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group mx-auto d-flex">
							<label for="memberPw" class="col-form-label">비밀번호</label> <input
								type="text" class="form-control" id="memberPw"
								placeholder="변경할 비밀번호 (20자)"> <input type="hidden"
								id="memberOldPw" value="${member.memberPw }">
						</div>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group mx-auto d-flex">
							<label for="memberName" class="col-form-label">이름</label> <input
								type="text" class="form-control" id="memberName"
								value="${member.memberName }">
						</div>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group mx-auto d-flex">
							<label for="memberPhone" class="col-form-label">전화번호</label> <input
								type="text" class="form-control" id="memberPhone"
								value="${member.memberPhone }">
						</div>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group mx-auto d-flex">
							<label for="memberEmail" class="col-form-label">이메일</label> <input
								type="text" class="form-control" id="memberEmail"
								value="${member.memberEmail }">
						</div>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group mx-auto d-flex">
							<input type="button" id="modBtn" class="btn btn-primary"
								value="변경">
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="myorder" role="tabpanel"
					aria-labelledby="myorder-tab">
					<!-- 헤더 부분 -->
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">주문내역</h5>
					</div>
				</div>
				<div class="tab-pane fade" id="myinquiry" role="tabpanel"
					aria-labelledby="myinquiry-tab">
					<!-- 헤더 부분 -->
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">문의내역</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="js/myPage.js"></script>