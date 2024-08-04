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
		                    <!-- 회원가입 모달창을 띄어준다. -->
		                    <a data-bs-toggle="modal" data-bs-target="#joinModal"  class="my-auto">
                                회원가입
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
<!-- 회원가입 모달창 -->
<div class="modal fade" id="joinModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content rounded-0">
            <!-- 헤더 부분 -->
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
                <!-- 닫기 버튼-->
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <!--  몸통 부분 -->
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-50 mx-auto d-flex">
                    <label for="memberId" class="col-form-label">아이디 (20자)</label>
                    <input type="text" class="form-control" id="memberId">
                </div>
                <input type="button" class="btn" id="idCheckBtn" value="아이디 체크"></input>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-50 mx-auto d-flex">
                    <label for="checkedMemberId" class="col-form-label">적용될 아이디</label>
                    <input type="text" class="form-control" id="checkedMemberId" readonly>
                </div>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-50 mx-auto d-flex">
                    <label for="memberPw" class="col-form-label">비밀번호 (20자)</label>
                    <input type="text" class="form-control" id="memberPw">
                </div>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-50 mx-auto d-flex">
                    <label for="memberName" class="col-form-label">이름 (8자)</label>
                    <input type="text" class="form-control" id="memberName">
                </div>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-50 mx-auto d-flex">
                    <label for="memberPhone" class="col-form-label">전화번호 (11자)</label>
                    <input type="text" class="form-control" id="memberPhone">
                </div> 
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-50 mx-auto d-flex">
                    <label for="memberEmail" class="col-form-label">이메일</label>
                    <input type="text" class="form-control" id="memberEmail">
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
    </div>
</div>
<!-- 회원가입 스크립트 -->
<script>
    /* 아이디 중복 체크 */
    let joinModal = document.querySelector('#joinModal');

    let idCheckBtn = joinModal.querySelector('#idCheckBtn');

    idCheckBtn.addEventListener('click',function(e){
        let memberIdInput = joinModal.querySelector("#memberId");
        let checkedMemberIdInput = joinModal.querySelector("#checkedMemberId");
    	memberService.idCheck(memberIdInput.value,checkedMemberIdInput,joinValueCheck);
    })
	
    /* 회원 가입 입력값 확인과 중복 체크 여부 확인 */
    joinModal.addEventListener('input',function(e){ // 글이 입력될 때마다 실행된다.
        joinValueCheck();
    })

    function joinValueCheck(){
        let checkedMemberIdInput = joinModal.querySelector("#checkedMemberId");
        let memberPwInput = joinModal.querySelector("#memberPw");
        let memberNameInput = joinModal.querySelector("#memberName");
        let memberPhoneInput = joinModal.querySelector("#memberPhone");
        let memberEmailInput = joinModal.querySelector("#memberEmail");

        // 위 5개의 인풋테그의 내용이 모두 1글자 이상일경우 회원가입 버튼을 활성화 시킨다.
        if(checkedMemberIdInput.value.length > 0 &&
        memberPwInput.value.length > 0 &&
        memberNameInput.value.length > 0 &&
        memberPhoneInput.value.length > 0 &&
        memberEmailInput.value.length > 0 
        ){
            joinBtn.disabled = false;
        }else{
            joinBtn.disabled = true;
        }
    }

    /* 회원가입 동작 */
    let joinBtn = joinModal.querySelector('#joinBtn');

    joinBtn.addEventListener('click',function(e){
        let checkedMemberId = joinModal.querySelector("#checkedMemberId").value;
        let memberPw = joinModal.querySelector("#memberPw").value;
        let memberName = joinModal.querySelector("#memberName").value;
        let memberPhone = joinModal.querySelector("#memberPhone").value;
        let memberEmail = joinModal.querySelector("#memberEmail").value;
        member = {checkedMemberId ,memberPw ,memberName, memberPhone, memberEmail}
        memberService.join(member);
    })
</script>
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
    let loginModel = document.getElementById('loginModel')
    loginModel.addEventListener('show.bs.modal', function (event) {
        // 모달 제목 객체 얻어오기
        let modalTitle = loginModel.querySelector('.modal-title');
        let memberIdInput = loginModel.querySelector('#memberId');
        let memberPwInput = loginModel.querySelector('#memberPw');
        let loginBtn = loginModel.querySelector('button.btn-primary')
        // 모달창 제목
        modalTitle.textContent = '로그인'

        // 모달 버튼 클릭 벤트
        loginBtn.addEventListener('click',function(e){
            memberService.login(memberIdInput.value,memberPwInput.value);
        })
    })
</script>
<script>
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
   		},
   		idCheck(memberId,checkedMemberIdInput,joinValueCheck){
   			if(memberId.length < 1  ){
                alert("입력된 값이 없습니다.");
                return;
            }
   			
   			let url = "idCheck.do?"+
   					"memberId=" + memberId;
   			console.log(url);
   			
   			fetch(url)
   			.then(result => {
   				return result.json();
   			})
   			.then(function(result){
   				if(result.idCheckResult == "Faild"){
   					alert("이미 사용되고 있는 아이디입니다.");
   				}else{
   					alert("사용가능한 아이디 입니다.");
                    checkedMemberIdInput.value = memberId;
                    // 자바스크립트 코드로 값을 넣는 방식은 input 이벤트로 
                    // 취급되지 않아 여기서 회원 가입 값 체크하는 메서드를 
                    // 실행시켰다.
                    joinValueCheck();
   				}
   			})
   		},
   		join(member={}){
            console.log(member);
	        let url = "join.do?" + 
	            "memberId="+member.checkedMemberId+
	            "&memberPw="+member.memberPw+
	            "&memberName="+member.memberName+
	            "&memberPhone="+member.memberPhone+
	            "&memberEmail="+member.memberEmail;
	            
			console.log(url);
			fetch(url)
			.then(result => {
				return result.json();
			})
			.then(function(result){
				if(result.joinResult == "Faild"){
					alert("서버 오류로 회원가입이 실패하였습니다.");
				}else{
					alert("회원가입이 성공하였습니다.");
					let answerUrl = "login.do?" + 
	                   "memberId="+member.checkedMemberId+
	                   "&memberPw="+member.memberPw;
					location.replace("index.do");
				}
			})
        }
    }
</script>
