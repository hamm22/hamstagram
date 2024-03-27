<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임라인</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/timelinestyle.css" type="text/css">
</head>
<body>

	<nav>
		<div class="nav-container">
			<div class="nav-1">
				<p class="logo" align="center">LOGO</p>
			</div>
			<input id="searchInput" type="search" class="input-search"
				placeholder="검색">
			<div class="nav-2">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					fill="currentColor" class="bi bi-house-door-fill mr-3"
					viewBox="0 0 16 16">
			<path
						d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5" />
			</svg>
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					fill="currentColor" class="bi bi-send mr-3" viewBox="0 0 16 16">
		  	<path
						d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576zm6.787-8.201L1.591 6.602l4.339 2.76z" />
			</svg>
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					fill="currentColor" class="bi bi-person-circle mr-3"
					viewBox="0 0 16 16">
		  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
		  <path fill-rule="evenodd"
						d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
		</svg>
			</div>
		</div>
	</nav>

	<div id="wrap">
		<section class="d-flex">
			<div class="left-box">
				<div class="profile">
					<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28"
						fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
			  			<path
									d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
						</svg>
					프로필
				</div>
				<button type="button" class="btn btn-success ml-3 mr-3"
					id="postBtn2">게시하기</button>
				<br>
				<button type="button" class="btn btn-success ml-3 mt-3 mr-3"
					id="logoutBtn" onclick="logout()">로그아웃</button>
			</div>

			<div class="main-box">
				<div class="post-box mt-3">
					<input type="text" placeholder="게시글을 남겨 보세요."
						class="form-control post-editor mt-3" id="contentsInput">

					<div class="post-items d-flex mt-3">
					
					<!-- 파일 이미지 -->
					<label for="fileInput">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
	 					 <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0" />
	 					 <path
									d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1z" />
						</svg>
					</label>
					<input type="file" id="fileInput" style="display: none;">


						<button type="button" class="btn btn-success mt-1 ml-3 mr-3"
							id="postBtn">게시하기</button>
					</div>
				</div>

				<!-- 게시물 -->
				<div class="Bulletin d-flex mt-4 ml-5">

					<c:forEach var="post" items="${postList }">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-person-circle mt-2"
							viewBox="0 0 16 16">
  					<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
  					<path fill-rule="evenodd"
								d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
							</svg>
						<div class="userName ml-2 ">${post.userLoginId }</div>
						<div>
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
								fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
 				 			<path
									d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z" />
							</svg>
						</div>
				</div>
				

				<div class="post-content mt-2">
				
					<div class="post-contents">
						<img src="${post.imagePath }" id="contnentImage">
					</div>
					
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="25"
						fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
						<path
							d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3" />
					</svg>
				</div>

				<div class="post-react">
					<div class="d-flex mt-2">
						<div>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
								fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
 						 <path
									d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15" />
					</svg>
							<br>200 likes
						</div>

						<div>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
								fill="currentColor" class="bi bi-chat-left-text-fill"
								viewBox="0 0 16 16">
					  <path
									d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793zm3.5 1a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 2.5a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 2.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1z" />
					</svg>
						</div>

					</div>
					
					<!-- 게시글 콘텐츠 내용 -->
					<p class="content-text mt-2" id="contentsInput">
						${post.contents }
					</p>
					
					<div class="text-secondary comment-view">댓글 더보기</div>
					
					<!-- 댓글 -->
					<div class="comments d-flex mt-2">
						<div class="nickname">사용자1</div>
						<div class="comment ml-2 text-secondary">댓글1</div>
					</div>
					
					</c:forEach>
				</div>

			</div>


			<!-- right-box -->
			<div class="right-box">
				<div class="myProfile ml-2">
					<svg xmlns="http://www.w3.org/2000/svg" width="56" height="56"
						fill="currentColor" class="bi bi-person-circle mr-2"
						viewBox="0 0 16 16">
			  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
			  <path fill-rule="evenodd"
							d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
			</svg>
						<c:if test="${not empty userId }">
							<div class="userID mr-3" id="myId">${userLoginId }님</div>
						</c:if>
				</div>

<!-- 				recommend -->
				<div class="section-recommend">
					<div class="menu-title">
						<span class="sub-title ml-3 mt-2">회원님을 위한 추천</span> <span
							class="find-more">모두 보기</span>
					</div>
					<ul class="recommend-list">
						<li>
							<div class="recommend-friend-profile">
								<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
									fill="currentColor" class="bi bi-person-circle"
									viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
				  <path fill-rule="evenodd"
										d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
				</svg>
								<div class="profile-text">
									<span class="userID point-span mt-1">baron</span>
								</div>
							</div> <span class="btn-follow">팔로우</span>
						</li>
						<li>
							<div class="recommend-friend-profile">
								<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
									fill="currentColor" class="bi bi-person-circle"
									viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
				  <path fill-rule="evenodd"
										d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
				</svg>
								<div class="profile-text">
									<span class="userID point-span mt-1">Elson</span>
								</div>
							</div> <span class="btn-follow">팔로우</span>
						</li>
						<li>
							<div class="recommend-friend-profile">
								<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
									fill="currentColor" class="bi bi-person-circle"
									viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
				  <path fill-rule="evenodd"
										d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
				</svg>
								<div class="profile-text">
									<span class="userID point-span mt-1">Seana</span>
								</div>
							</div> <span class="btn-follow">팔로우</span>
						</li>
					</ul>
				</div>

			</div>
	</div>
	</section>
	</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {  
		
		$("#postBtn").on("click", function() {
			let contents = $("#contentsInput").val();
			let file = $("#fileInput")[0].files[0]; // files는 파일 목록, 여러개이면 files[0]이 아닌 files로 사용
			
			if(contents == "") {
				alert("내용을 입력하세요");
				return ;
			}
			
			// 파일 선택에 대한 유효성 검사
			if(file == null){
				alert("파일을 선택하세요.");
				return;
			}
			
			let formData = new FormData();
			formData.append("contents", contents);
			formData.append("imageFile", file);
			
			$.ajax({
				type:"post"
				, url:"/post/create"
				, data:formData // 파일이 포함되어있어서 keyvalue속성 사용못함
				, enctype:"multipart/form-data" // 파일 업로드 필수 옵션
				, processData: false			// 파일 업로드 필수 옵션
				, contentType: false			// 파일 업로드 필수 옵션
				, success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else {
						alert("게시글 작성 실패");
					}
				}
				, error:function() {
					alert("게시글 작성 에러");
				}
			});
			
		});
	});
	
	function logout() {
		  window.location.href = "/user/logout";
		}
</script>
</body>
</html>