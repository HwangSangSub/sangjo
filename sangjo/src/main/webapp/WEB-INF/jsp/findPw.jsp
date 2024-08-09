<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
  <style>
    #changePwInputBox{
      display: none;
    }
  </style>
</head>

<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">비밀번호 찾기</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">비밀번호 찾기</li>
    </ol>
</div>
<!-- Single Page Header End -->


<!-- findPw Start -->
<div class="container-fluid testimonial py-5">
  <div class="container py-5">
    <div class="testimonial-header text-center">
      <h4 class="text-primary">회원</h4>
      <h1 class="display-5 mb-5 text-dark">비밀번호 찾기</h1>
    </div>
      <div id="findPwInputBox">
        <div class="input-form-box"><span>이메일 </span><input id="emailInput" type="text" class="form-control"></div>
        <br>
        <div class="button-login-box" >
          <button type="button" id="findPwBtn" class="btn btn-primary btn-xs" style="width:100%">인증코드 받기</button>
        </div>
      </div>
      <div id="changePwInputBox">
        <div class="input-form-box"><span>인증 코드 </span><input id="verificationCode" type="text" class="form-control"></div>
        <div class="input-form-box"><span>새로운 비밀번호 </span><input id="newMemberPw" type="password" class="form-control"></div>
        <br>
        <div class="button-login-box" >
          <button type="button" id="changePwBtn" class="btn btn-primary btn-xs" style="width:100%">비밀번호 변경하기</button>
        </div>
      </div>
  </div>
</div>
<!-- findPw End -->
<script>
  let findPwInputBox = document.querySelector('#findPwInputBox');
  let findPwBtn = findPwInputBox.querySelector('#findPwBtn');
  findPwBtn.addEventListener('click',function(e){
    let emailInput = findPwInputBox.querySelector('#emailInput');
    let url = 'findPw.do?memberEmail='+emailInput.value;
    fetch(url)
    .then(result => {
      return result.json();
    })
    .then(function(result){
      if(result.sendEmail == "Faild"){
        alert("해당 이메일에대한 회원은 없습니다.");
      }else{
        alert("인증코드는 " + result.sendEmail + "입니다.");
        findPwInputBox.style.display = "none";
        changePwInputBox.style.display = "block";
      }
    })
  })
  let changePwInputBox = document.querySelector('#changePwInputBox');
  let changePwBtn = changePwInputBox.querySelector('#changePwBtn');
  changePwBtn.addEventListener('click',function(e){
    let emailInput = findPwInputBox.querySelector('#emailInput');
    let verificationCodeInput = changePwInputBox.querySelector('#verificationCode');
    let newMemberPw = changePwInputBox.querySelector('#newMemberPw');
    let url = 'changePw.do';
    let optionObj = {
        method: 'post',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          verificationCode: verificationCodeInput.value,
          memberEmail: emailInput.value,
          newMemberPw: newMemberPw.value,
        })
    }
    fetch(url,optionObj)
    .then(result => {
      return result.json();
    })
    .then(function(result){
      if(result.changePassword == "Faild"){
        alert("비밀번호 변경에 실패하였습니다.");
      }else{
        alert("비밀번호 변경에 성공하였습니다.");
      }
    })
  })
</script>