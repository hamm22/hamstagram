<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/joinstyle.css" type="text/css">
</head>
<body>

		<div id="wrap">
			<section class="contents d-flex justify-content-center">
				<div class = "user-box">
				 <p class="logo" align="center">LOGO</p>
					<input type="text" placeholder="성명" class="form-control mt-3" id="nameInput">
					<div class = "d-flex">
					<input type="text" placeholder="아이디" class="form-control mt-3" id="idInput">
					<button type="button" class="btn btn-success mt-3" id="duplicateBtn">중복확인</button>
					</div>
					<div class="small text-danger d-none mt-1" id="duplicateId">사용중인 아이디입니다.</div>
										
					<input type="password" placeholder="비밀번호" class="form-control mt-3" id="passwordInput">
					<input type="password" placeholder="비밀번호확인" class="form-control mt-3" id="passwordConfirmInput">
					<input type="text" placeholder="이메일주소" class="form-control mt-3" id="emailInput">
					<input type="text" placeholder="전화번호" class="form-control mt-3" id="phoneNumberInput">
					<button type="button" class="btn btn-success mt-4" id="joinBtn">가입하기</button>	
				</div>
			</section>
		
		</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {
	
			// 중복 체크 확인
			var isDuplicateCheck = false;
			// 중복 상태
			var isDuplicateId = true;
			
			$("#idInput").on("input", function(){
				// 중복체크 확인, 중복상태 변수값 초기화
				isDuplicateCheck = false;
				isDuplicateId = true;
				$("#duplicateId").addClass("d-none");
			});
			
			// 중복 버튼
			$("#duplicateBtn").on("click", function() {
				let id = $("#idInput").val();
				
				if(id == ""){
					alert("id를 입력하세요");
					return;
				} 
				
			$.ajax({
				type:"get"
				, url:"/user/duplicate-id"
				, data:{"loginId":id}
				, success:function(data) {
					isDuplicateCheck = true;
 					// 중복됨 {"isDuplicate":true}
 					// 중복 안됨 {"isDuplicate":false}
					if(data.isDuplicate) {
					isDuplicateId = true;
					$("#duplicateId").removeClass("d-none");
					} else{
						isDuplicateId = false;
						$("#duplicateId").addClass("d-none");
					}
				}
				,error:function(){
					alert("중복확인 에러");
				}
			});
			
			});
			
			// 영문 조합 비밀번호 설정
			let regPass = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,20}$/;
			
			// 가입 버튼
			$("#joinBtn").on("click", function() {
					
					let id = $("#idInput").val();
					let password = $("#passwordInput").val();
					let passwordConfirm = $("#passwordConfirmInput").val();
					let name = $("#nameInput").val();
					let email = $("#emailInput").val();
					let phoneNumber = $("#phoneNumberInput").val();
	
				
					// 유효성 검사 
					if(id == "") {
						alert("아이디를 입력하세요");
						return ;
					}
					
					if(password == "") {
						alert("비밀번호를 입력하세요");
						return ;
					}
					
					if(password != passwordConfirm) {
						alert("비밀번호가 일치하지 않습니다");
						return ;
					}
					
					if(name == "") {
						alert("이름을 입력하세요");
						return 0;
					}
					
					if(email == "") {
						alert("이메일을 입력하세요");
						return ;
					}
					if(phoneNumber == "") {
						alert("전화번호를 입력하세요");
						return ;
					}
					
					if (password.length < 6 || password.length > 20) {
						  alert("비밀번호는 6자리 이상 20자리 이하로 입력해야 합니다.");
						  return;
					}
					
					// 영문, 숫자 조합으로 비밀번호 설정
					if(!regPass.test(password)){
						alert("영문,숫자 조합으로 입력해주세요.");
						return ;
					} 
					
					// 중복아이디 가입 방지
					if (isDuplicateId) {
						  alert("아이디가 중복되었습니다. 다른 아이디를 입력해주세요.");
						  return;
					}
					
					// 010으로 시작하지않는 폰번호 가입 방지
					if(!phoneNumber.startsWith("010") && !phoneNumber.startsWith("010") ){
						alert("전화번호를 다시 입력해주세요");
						return;
					}
					
					
				
				$.ajax({
					type:"post"
					, url:"/user/join"
						, data:{"name":name, "loginId":id, "password":password, "email":email, "phoneNumber":phoneNumber}
					, success:function(data) {
						if(data.result == "success") {
							location.href = "/user/login-view";
						} else {
							alert("가입 실패");
						}
					}
					, error:function() {
						alert("가입 에러!!");
					}
				});
				
				
			});
			
		});
	
	</script>
</body>
</html>