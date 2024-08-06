<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">아이디 찾기</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">아이디 찾기</li>
    </ol>
</div>
<!-- Single Page Header End -->


<!-- findId Start -->
<div class="container-fluid testimonial py-5">
  <div class="container py-5">
    <div class="testimonial-header text-center">
      <h4 class="text-primary">회원</h4>
      <h1 class="display-5 mb-5 text-dark">아이디 찾기</h1>
    </div>
      <div id="findIdInputBox">
        <div class="input-form-box"><span>이메일 </span><input id="emailInput" type="text" class="form-control"></div>
        <br>
        <div class="button-login-box" >
          <button type="button" id="findIdBtn" class="btn btn-primary btn-xs" style="width:100%">이메일로 아이디 찾기</button>
        </div>
        <br>
        <br>
        <div class="input-form-box"><span>찾기 결과 </span><input id="idInput" type="text" class="form-control"></div>
        <br>
      </div>
  </div>
</div>
<!-- findId End -->
<script>
  let fundIdInputBox = document.querySelector('#findIdInputBox');
  let findIdBtn = fundIdInputBox.querySelector('#findIdBtn');
  findIdBtn.addEventListener('click',function(e){
    let emailInput = fundIdInputBox.querySelector('#emailInput');
    let idInput = fundIdInputBox.querySelector('#idInput');
    let url = 'findId.do?memberEmail='+emailInput.value;
    fetch(url)
    .then(result => {
      return result.json();
    })
    .then(function(result){
      if(result.memberId == "Faild"){
        alert("해당 이메일에대한 아이디는 없습니다.");
      }else{
        idInput.value = result.memberId;
      }
    })
  })
</script>