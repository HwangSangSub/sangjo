<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!--
	<table class="table table-hover table-striped">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody> 
			<c:forEach items="${boards}" var="board">
				<tr>
					<td>${board.bno}</td>
					<td><a href="get?bno=${board.bno} ">${board.title}</a></td>
					<td>${board.writer}</td>
					<td>${board.hitCount}</td>
					<td>${board.regDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
-->
<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
	<h1 class="text-center text-white display-6">Testimonial</h1>
	<ol class="breadcrumb justify-content-center mb-0">
		<li class="breadcrumb-item"><a href="#">Home</a></li>
		<li class="breadcrumb-item"><a href="#">Pages</a></li>
		<li class="breadcrumb-item active text-white">Testimonial</li>
	</ol>
</div>
<!-- Single Page Header End -->
<div class="container-fluid testimonial py-5">
	<div class="container py-5">
		<div class="testimonial-header text-center">
			<h4 class="text-primary">고객센터</h4>
			<h1 class="display-5 mb-5 text-dark">공지사항</h1>
		</div>
		<div class="owl-carousel testimonial-carousel" id="boardList">
			<c:forEach var="board" items="${boardList}">
				<div class="testimonial-item img-border-radius bg-light rounded p-4" id="boardClone">
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
</div>