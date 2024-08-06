<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<div class="container-fluid">
    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="index.html" class="navbar-brand"><h1 class="text-primary display-6">상조쇼핑몰</h1></a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                <div class="navbar-nav mx-auto">
                    <a href="index.do" class="nav-item nav-link active">메인</a>
                    <a href="index.do" class="nav-item nav-link">상품목록</a>
                    <a href="productInfo.do" class="nav-item nav-link">상품상세</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">추가메뉴</a>
                        <div class="dropdown-menu m-0 bg-secondary rounded-0">
                            <a href="cartList.do" class="dropdown-item">장바구니</a>
                            <a href="orderList.do" class="dropdown-item">주문</a>
                            <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                            <a href="404.html" class="dropdown-item">404 Page</a>
                        </div>
                    </div>
                    <a href="helpDesk.do" class="nav-item nav-link">고객센터</a>
                </div>
                <div class="d-flex m-3 me-0">
                    <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
                    <a href="cartList.do" class="position-relative me-4 my-auto">
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
                            <a href="myPage.do" class="my-auto">
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
                    <label for="memberId" class="col-form-label">아이디</label>
                    <input type="text" class="form-control" id="memberId" placeholder="아이디 (20자)">
                    <input type="button" class="btn" id="cleanIdCheckBtn" value="재입력"></input>
                    <input type="button" class="btn" id="idCheckBtn" value="아이디 체크"></input>
                </div>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-50 mx-auto d-flex">
                    <label for="memberPw" class="col-form-label">비밀번호</label>
                    <input type="text" class="form-control" id="memberPw" placeholder="비밀번호 (20자)">
                </div>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-50 mx-auto d-flex">
                    <label for="memberName" class="col-form-label">이름</label>
                    <input type="text" class="form-control" id="memberName" placeholder="이름 (8자)">
                </div>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-50 mx-auto d-flex">
                    <label for="memberPhone" class="col-form-label">전화번호</label>
                    <input type="text" class="form-control" id="memberPhone" placeholder="전화번호 (11자)">
                </div> 
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-50 mx-auto d-flex">
                    <label for="memberEmail" class="col-form-label">이메일</label>
                    <input type="text" class="form-control" id="memberEmail" placeholder="이메일 작성">
                </div>
            </div>
            <!-- 주소 입력란 -->
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-50 mx-auto d-flex">
                    <input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                    <input type="text" id="addressCode" class="form-control" placeholder="우편번호" readonly>
                </div>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-50 mx-auto d-flex">
                    <input type="text" id="addressMain" class="form-control" placeholder="도로명주소" readonly>
                    <input type="text" id="addressDetail" class="form-control" placeholder="상세주소">
                </div>
            </div>
            <!--주소 입력란 끝-->
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-50 mx-auto d-flex">
                    <input type="reset" class="btn btn-secondary" value="초기화"></input>
                    <input type="button" id="joinBtn" class="btn btn-primary" value="회원가입" disabled></input>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 주소 입력 관련 스크립트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addressCode').value = data.zonecode;
                document.getElementById("addressMain").value = roadAddr;
            }
        }).open();
    }
</script>
<!-- 회원가입 스크립트 -->
<script>
    // 회원 가입 모달
    let joinModal = document.querySelector('#joinModal');
    // 버튼 
    let idCheckBtn = joinModal.querySelector('#idCheckBtn');
    let cleanIdCheckBtn = joinModal.querySelector("#cleanIdCheckBtn");
    // Input 테그 회원
    let memberIdInput = joinModal.querySelector("#memberId");
    let memberPwInput = joinModal.querySelector("#memberPw");
    let memberNameInput = joinModal.querySelector("#memberName");
    let memberPhoneInput = joinModal.querySelector("#memberPhone");
    let memberEmailInput = joinModal.querySelector("#memberEmail");
    // Input 테그 주소 
    let addressCodeInput = joinModal.querySelector("#addressCode");
    let addressMainInput = joinModal.querySelector("#addressMain");
    let addressDetailInput = joinModal.querySelector("#addressDetail");
    /* 아이디 중복 체크 */
    idCheckBtn.addEventListener('click',function(e){
        let memberIdInput = joinModal.querySelector("#memberId");
        memberService.idCheck(memberIdInput,joinValueCheck);
    })

    cleanIdCheckBtn.addEventListener('click',function(e){
        let memberIdInput = joinModal.querySelector("#memberId");
        memberIdInput.readOnly = false;
        memberIdInput.value = '';
    })
    
    /* 회원 가입 입력값 확인과 중복 체크 여부 확인 */
    joinModal.addEventListener('input',function(e){ // 글이 입력될 때마다 실행된다.
        joinValueCheck();
    })
    // 회원 가입 입력값 확인
    function joinValueCheck(){

        // 인풋테그의 내용이 모두 1글자 이상일경우 회원가입 버튼을 활성화 시킨다.
        if(memberIdInput.readOnly &&
            memberPwInput.value.length > 0 &&
            memberNameInput.value.length > 0 &&
            memberPhoneInput.value.length > 0 &&
            memberEmailInput.value.length > 0 &&
            addressCodeInput.value.length > 0 &&
            addressMainInput.value.length > 0 &&
            addressDetailInput.value.length > 0 
        ){
            joinBtn.disabled = false;
        }else{
            joinBtn.disabled = true;
        }
    }

    /* 회원가입 동작 */
    let joinBtn = joinModal.querySelector('#joinBtn');

    joinBtn.addEventListener('click',function(e){
        let memberId = memberIdInput.value;
        let memberPw = memberPwInput.value;
        let memberName = memberNameInput.value;
        let memberPhone = memberPhoneInput.value;
        let memberEmail = memberEmailInput.value;

        let addressCode = addressCodeInput.value;
        let addressMain = addressMainInput.value;
        let addressDetail = addressDetailInput.value;

        member = {memberId ,memberPw ,memberName, memberPhone, memberEmail}
        address = {addressCode,addressMain,addressDetail}
        joinBtn.disabled = false;// 연속클릭 방지를 위해 비활성화
        memberService.join(member,address,joinBtn);
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
            <div class="mb-3">
                <label for="memberId" class="col-form-label">아이디</label>
                <input type="text" class="form-control" id="memberId">
            </div>
            <div class="mb-3">
                <label for="memberPw" class="col-form-label">비밀번호</label>
                <input type="text" class="form-control" id="memberPw">
            </div>
            <div class="mb-3">
            	<a href="findIdForm.do">아이디 찾기</a> / <a href="#">비밀번호 재설정</a> 
            </div>
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
            let url = "login.do";
            let optionObj = {
                // http 의 header 파트
                method: 'post',
                headers: {
                    // 기본값 : application/x-www-form-urlencoded  일명 form 방식
                    
                    // 지금은 json 방식으로 한다.
                    'Content-Type': 'application/json'
                },
                // http 의 body 파트 전달할 내용을 입력한다.
                body: JSON.stringify({
                    memberId: memberId,
                    memberPw: memberPw,
                })
            }
            fetch(url, optionObj)
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
            idCheck(memberIdInput,joinValueCheck){
                if(memberIdInput.value.length < 1  ){
                alert("입력된 값이 없습니다.");
                return;
                }
                
                let url = "idCheck.do?"+
                        "memberId=" + memberIdInput.value;
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
                    memberIdInput.readOnly = true;
                    // 자바스크립트 코드로 값을 넣는 방식은 input 이벤트로 
                    // 취급되지 않아 여기서 회원 가입 값 체크하는 메서드를 
                    // 실행시켰다.
                    joinValueCheck();
                    }
                })
            },
            join(member={},address={},joinBtn){
            console.log(member);
            let url = "join.do";
            let optionObj = {
                method: 'post',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    // 회원 정보 
                    memberId: member.memberId,
                    memberPw: member.memberPw,
                    memberName: member.memberName,
                    memberPhone: member.memberPhone,
                    memberEmail: member.memberEmail,
                    // 주소 정보
                    addressCode: address.addressCode,
                    addressMain: address.addressMain,
                    addressDetail: address.addressDetail
                })
            }
            fetch(url, optionObj)
            .then(result => {
                return result.json();
            })
            .then(function(result){
                if(result.joinResult == "Faild"){
                    alert("서버 오류로 회원가입이 실패하였습니다.");
                    joinBtn.disabled = true;
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