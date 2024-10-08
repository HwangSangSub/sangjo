<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
div.input-group>label.col-form-label {
	width: 80px;
}
</style>
<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
	<h1 class="text-center text-white display-6">마이페이지</h1>
</div>
<!-- Single Page Header End -->

<div class="container-fluid testimonial py-5">
	<div class="container py-5">
		<div class="testimonial-header text-center">
			<h1 class="display-5 mb-5 text-dark">공지사항</h1>
		</div>
		<div class="owl-carousel testimonial-carousel" id="boardList">
			<c:forEach var="board" items="${boardList}">
				<div class="testimonial-item img-border-radius bg-light rounded p-4"
					id="boardClone">
					<div class="position-relative">
						<div class="mb-4 pb-4 border-bottom border-secondary">
							<p class="mb-0">${board.boardTitle }</p>
						</div>
						<div class="d-flex align-items-center flex-nowrap">
							<div class="d-block">
								<h4 class="text-dark">${board.boardContent }</h4>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="container py-5">
		<div class="p-5 bg-light rounded">
			<input type="hidden" id="logid" value="${member.memberId }" />
			<!-- 탭 메뉴 -->
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="userModInfo-tab"
						data-bs-toggle="tab" data-bs-target="#userModInfo" type="button"
						role="tab" aria-controls="userModInfo" aria-selected="true">회원정보</button>
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
				<div class="tab-pane fade show active" id="userModInfo"
					role="tabpanel" aria-labelledby="userinfo-tab">
					<!-- 헤더 부분 -->
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">회원정보</h5>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group mx-auto d-flex">
							<input type="text" class="form-control" id="memberIdMy"
								value="${member.memberId }" readonly>
						</div>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group mx-auto d-flex">
							<input type="text" class="form-control" id="memberPwMy"
								placeholder="변경할 비밀번호 (20자)"> <input type="hidden"
								id="memberOldPwMy" value="${member.memberPw }">
						</div>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group mx-auto d-flex">
							<input type="text" class="form-control" id="memberNameMy"
								placeholder="변경할 비밀번호 (20자)" value="${member.memberName }">
						</div>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group mx-auto d-flex">
							<input type="text" class="form-control" id="memberPhoneMy"
								placeholder="변경할 전화번호(-포함)" value="${member.memberPhone }">
						</div>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group mx-auto d-flex">
							<input type="text" class="form-control" id="memberEmailMy"
								placeholder="변경할 이메일" value="${member.memberEmail }">
						</div>
					</div>
					<div class="modal-body d-flex align-items-center">
						<div class="input-group mx-auto d-flex">
							<input type="button" id="modBtn" class="btn btn-primary"
								value="수정">
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="myorder" role="tabpanel"
					aria-labelledby="myorder-tab">
					<!-- 헤더 부분 -->
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">주문내역</h5>
					</div>
					<table class="table table-striped table-bordered" id="myOrdList">
						<thead>
							<tr>
								<th>주문번호</th>
								<th>주문금액</th>
								<th>배송비</th>
								<th>배송지정보</th>
								<th>주문상태</th>
								<th>주문일시</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="myinquiry" role="tabpanel"
					aria-labelledby="myinquiry-tab">
					<!-- 헤더 부분 -->
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">문의내역</h5>
					</div>
					<table class="table table-striped table-bordered" id="myInqList">
						<thead>
							<tr>
								<th>문의번호</th>
								<th>문의제목</th>
								<th>문의타입</th>
								<th>문의일시</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5">
									<button class="btn btn-info" id="" data-bs-toggle="modal"
										data-bs-target="#inquiryIns" type="button" role="modal"
										aria-controls="inquiryIns" aria-selected="false">문의하기</button>

									<div class="modal fade" id="inquiryIns" tabindex="-1"
										aria-labelledby="inquiryInsModalLabel" aria-hidden="true"
										>
										<div
											class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
											<div class="modal-content">
												<!-- 헤더 부분 -->
												<div class="modal-header">
													<h5 class="modal-title" id="inquiryInsModalLabel">문의하기</h5>
													<!-- 닫기 버튼-->
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<!--  몸통 부분 -->
												<div id="cloneUl" class="modal-body">
													<div class="mb-3">
														<label for="inquiryTitleIns" class="col-form-label">문의제목</label>
														<input type="text" class="form-control"
															id="inquiryTitleIns" />
													</div>
													<div class="mb-3">
														<label for="inquiryContentIns" class="col-form-label">문의내용</label>
														<textarea class="form-control" id="inquiryContentIns"
															cols="50" style="overflow: hidden; height: 250px;"></textarea>
													</div>
													<div class="mb-3">
														<button type="button" class="btn btn-success" id="inqAdd">문의하기</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tfoot>
					</table>
					<div class="modal fade cloneDiv" id="inqModel" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true"
						style="display: none" style="width:500px;">
						<div
							class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<!-- 헤더 부분 -->
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">내 문의내역</h5>
									<!-- 닫기 버튼-->
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<!--  몸통 부분 -->
								<div id="cloneUl" class="modal-body">
									<div class="mb-3">
										<label for="inquiryTitle" class="col-form-label">문의제목</label>
										<input type="text" class="form-control" id="inquiryTitle"
											disabled />
									</div>
									<div class="mb-3">
										<label for="inquiryContent" class="col-form-label">문의내용</label>
										<textarea class="form-control" id="inquiryContent" cols="50"
											style="overflow: hidden; height: 250px;" disabled></textarea>
									</div>
									<div class="mb-3">
										<label for="inquiryAnswer" class="col-form-label">답변내용</label>
										<textarea class="form-control" id="inquiryAnswer" cols="50"
											style="overflow: hidden; height: 200px;" disabled></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="js/myPage.js"></script>