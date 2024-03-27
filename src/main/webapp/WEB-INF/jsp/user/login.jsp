<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<section class="contents d-flex justify-content-center">
			<div class="user-box">
				<p class="logo" align="center">LOGO</p>
				<form id="loginForm">
					<input type="text" placeholder="아이디" class="form-control mt-3" id="idInput">
					<input type="password" placeholder="비밀번호" class="form-control mt-3" id="passwordInput">
					<button type="submit" class="btn btn-success mt-4" id="requestBtn">로그인</button>
				</form>
				<hr class="mt-5">
				<a href="/user/join-view" class="mt-3 addition">회원가입</a>
			</div>
		</section>

	</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script>

	$(document).ready(function() {

		$("#loginForm").on("submit", function(e) {

			// submit 이벤트가 가진 고유의 기능을 취소
			e.preventDefault();

			let id = $("#idInput").val();
			let password = $("#passwordInput").val();

			// 유효성 검사
			if (id == "") {
				alert("아이디를 입력하세요");
				return;
			}

			if (password == "") {
				alert("비밀번호를 입력하세요");
				return;
			}

			console.log("id : " + id + " 비밀번호 : " + password);

			$.ajax({
				type : "post",
				url : "/user/login",
				data : {
					"loginId" : id,
					"password" : password
				},
				success : function(data) {
					if (data.result == "success") {
						location.href = "/post/timeline-view";
					} else {
						alert("아이디와 비밀번호를 확인해 주세요");
					}
				},
				error : function() {
					alert("로그인 에러!");
				}
			});

		});

	});
</script>

</body>
</html>