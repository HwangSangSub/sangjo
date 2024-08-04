<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<div class="container-fluid">
    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="index.html" class="navbar-brand"><h1 class="text-primary display-6">Fruitables</h1></a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                <div class="navbar-nav mx-auto">
                    <a href="index.html" class="nav-item nav-link active">Home</a>
                    <a href="shop.html" class="nav-item nav-link">Shop</a>
                    <a href="shop-detail.html" class="nav-item nav-link">Shop Detail</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu m-0 bg-secondary rounded-0">
                            <a href="cart.html" class="dropdown-item">Cart</a>
                            <a href="chackout.html" class="dropdown-item">Chackout</a>
                            <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                            <a href="404.html" class="dropdown-item">404 Page</a>
                        </div>
                    </div>
                    <a href="contact.html" class="nav-item nav-link">Contact</a>
                </div>
                <div class="d-flex m-3 me-0">
                    <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
                    <a href="#" class="position-relative me-4 my-auto">
                        <i class="fa fa-shopping-bag fa-2x"></i>
                        <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
                    </a>
                    <c:choose>
                    	<c:when test="${empty member}">
	                    	<!-- 로그인 모달 창을 띄어준다. -->
		                    <a data-bs-toggle="modal" data-bs-target="#loginModel"  class="my-auto">
		                        로그인
		                    </a>
                    	</c:when>
                    	<c:otherwise>
                    		<!-- 마이페이지가 완성되면 링크를 연결해주자 -->
                    		<a class="my-auto">
		                        <i class="fas fa-user fa-2x"></i>
		                    </a>
		                    <a href="logout.do" class="my-auto">
		                    	로그아웃
		                    </a>
                    	</c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>
    </div>
</div>
<!--로그인 모달 창 -->
<div class="modal fade" id="loginModel" tabindex="-1" aria-labelledby="loginModelLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="loginModelLabel">New message</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form>
            <div class="mb-3">
              <label for="memberId" class="col-form-label">아이디</label>
              <input type="text" class="form-control" id="memberId">
            </div>
            <div class="mb-3">
                <label for="memberPw" class="col-form-label">비밀번호</label>
                <input type="text" class="form-control" id="memberPw">
              </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">로그인</button>
        </div>
      </div>
    </div>
</div>
<!--로그인 모달용 스크립트 -->
<script>
    var loginModel = document.getElementById('loginModel')
    loginModel.addEventListener('show.bs.modal', function (event) {
        // 모달 제목 객체 얻어오기
        var modalTitle = loginModel.querySelector('.modal-title');
        var memberIdInput = loginModel.querySelector('#memberId');
        var memberPwInput = loginModel.querySelector('#memberPw');
        var loginBtn = loginModel.querySelector('button.btn-primary')
        // 모달창 제목
        modalTitle.textContent = '로그인'

        // 모달 버튼 클릭 벤트
        loginBtn.addEventListener('click',function(e){
            memberService.login(memberIdInput.value,memberPwInput.value);
        })
    })
    const memberService = {
    		login(memberId,memberPw){
    			let url = "login.do?" + 
                    "memberId="+memberId+
                    "&memberPw="+memberPw;
    			console.log(url);
    			fetch(url)
    			.then(result => {
    				return result.json();
    			})
    			.then(function(result){
    				if(result.loginResult == "Faild"){
    					alert("아이디 또는 비밀번호가 틀립니다.");
    				}else{
    					location.replace("index.do");
    				}
    			})
    		}
    }
</script>
