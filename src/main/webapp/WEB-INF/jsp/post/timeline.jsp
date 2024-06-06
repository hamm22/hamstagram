<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임라인</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/timelinestyle.css" type="text/css">
</head>
<body>

	<nav>
		<div class="nav-container">
			<div class="nav-1">
				<p class="logo mr-3" align="center">Hamstagram</p>
			</div>
			<input id="searchInput" type="search" class="input-search" placeholder="검색">
			<div class="nav-2">
				<i class="bi bi-house-door-fill mr-3"></i>
				<i class="bi bi-send mr-3"></i>
				<i class="bi bi-person-circle"></i>
			</div>
		</div>
	</nav>

	<div id="wrap">
		<section class="d-flex">
			<div class="left-box">
				<div class="profile">
					<i class="bi bi-person-fill"></i>
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
					<input type="text" placeholder="게시글을 남겨 보세요." class="form-control post-editor mt-3" id="contentsInput">

					<div class="post-items d-flex mt-3">
						
						<!-- 파일 이미지 -->
						<label for="fileInput">
							<i class="bi bi-image"></i>
						</label>
						<input type="file" id="fileInput" style="display: none;">
						<button type="button" class="btn btn-success mt-1 ml-3 mr-3" id="postBtn">게시하기</button>
					</div>
				</div>

				<!-- 게시물 -->
				<div class="Bulletin d-flex mt-4 ml-5">

					<c:forEach var="post" items="${postList }">
					
						<i class="bi bi-person-circle"></i>
						<div class="userName ml-2 ">${post.userLoginId }</div>
						<%-- 로그인한 사용자가 작성한 게시글일 경우 --%>
						<c:if test="${userId eq post.userId }"> 
							<i class="bi bi-gear-fill more-btn" data-toggle="modal" data-target="#moreModal" data-post-id="${post.id }"></i> <!-- modal -->
						</c:if>
					</div>

				<div class="post-content mt-2">
				
					<div class="post-contents">
						<img src="${post.imagePath }" id="contnentImage">
					</div>
				</div>

				<div class="post-react">
					<div class="d-flex mt-2">
						<div>
							
							 <!-- 좋아요 jstl --> <!-- data-변수(변수이름 자유) -->
							<p>
								<c:choose>
									<c:when test="${post.like }">
										<i class="bi bi-heart-fill text-danger unlike-icon" data-post-id="${post.id }"></i>
									</c:when>
									<c:otherwise>
										<i class="bi bi-heart like-icon" data-post-id="${post.id }"></i>
									</c:otherwise>
								</c:choose>
								
								${post.likeCount } like
							</p>
							
						</div>
					</div>
					
					<!-- 게시글 콘텐츠 내용 -->
					<div class="content-text">
						${post.contents }
					</div>
					
					<div class="text-secondary comment-view">댓글 더보기</div>
					
					<!-- 댓글 -->
					
					<div class="comments d-flex mt-3">

						<c:forEach var="comment" items="${post.commentList }">
							<div>
								<b>${comment.userLoginId }</b> ${comment.contents }
							</div>
						</c:forEach>
					</div>
					
					<div class="d-flex justify-content-between mt-3">
							<input type="text" class="form-control col-10" id="commentInput ${post.id }">
							<button type="button" class="btn btn-success col-2 comment-btn" data-post-id="${post.id }">게시</button>
					</div>
					
					</c:forEach>
				</div>
			</div>


			<!-- right-box -->
			<div class="right-box">
				<div class="myProfile ml-2">
					<i class="bi bi-person-circle mr-2"></i>
						<c:if test="${not empty userId }">
							<div class="userID mr-3" id="myId">${userLoginId }님</div>
						</c:if>
				</div>

<!-- 				recommend -->
				<div class="section-recommend">
					<div class="menu-title">
						<span class="sub-title ml-3 mt-2">회원님을 위한 추천</span>
						<span class="find-more">모두 보기</span>
					</div>
					<ul class="recommend-list">
						<li>
							<div class="recommend-friend-profile">
								<i class="bi bi-person-circle"></i>
								<div class="profile-text">
									<span class="userID point-span mt-1">baron</span>
								</div>
							</div> <span class="btn-follow">팔로우</span>
						</li>
						<li>
							<div class="recommend-friend-profile">
								<i class="bi bi-person-circle"></i>
								<div class="profile-text">
									<span class="userID point-span mt-1">Elson</span>
								</div>
							</div> <span class="btn-follow">팔로우</span>
						</li>
						<li>
							<div class="recommend-friend-profile">
								<i class="bi bi-person-circle"></i>
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

	<!-- Modal -->
	<div class="modal fade" id="moreModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-body text-center">
					<a href = "#" id="deleteBtn">삭제하기</a>
				</div>
				
			</div>
		</div>
	</div>



<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() { 
		
		$("#deleteBtn").on("click", function(){
			
			let id = $(this).data("post-id");
			
			$.ajax({
				type:"delete"
				, url:"/post/delete"
				, data:{"id" : id}
				, success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else {
						alert("삭제 실패!");
					}
					}
			, error:function() {
				alert("삭제 에러!");
			}
		});
	});
		
		$(".more-btn").on("click", function(){
			
			let id = $(this).data("post-id");
			
			// 삭제 버튼에 data-post-id에 해당하는 postId 값을 저장
			$("#deleteBtn").data("post-id", id);
			
// 			$.ajax({
// 				type:"delete"
// 				, url:"/post/delete"
// 				, data:{"id" : id}
// 				, success:function(data){
				
// 					if(data.result == "success"){
// 						location.reload();
// 					} else{
// 						alert("삭제 실패");
// 						}
// 					}
// 				,error:function(){
// 					alert("삭제 에러");
// 				}
// 			});
		});
		
		// 댓글
		$(".comment-btn").on("click", function() {
			
			let id = $(this).data("post-id");
			
			// 버튼 옆에 있는 input태그 객체화
			// 1. 이벤트가 발생한 버튼 태그 옆에 있는 태그를 개체화
			// let comment = $(this).prev().val();
			
			// 2. 버튼태그가 가진 데이터를 이용해서 input 태그에 id 부여
			// 기록 하는 내용, 조회부분은 따로 만들어야함
			let comment = $("#commentInput" + id).val();
			
			alert(comment);
			
			if(comment == "") {
				alert("댓글을 입력하세요");
				return ;
			}
			
			$.ajax({
				type:"post"
				, url: "/post/comment/create"
			    , data: {"postId" : id, "contents" : comment} // postId 여러개게시글에 하나를 가져옴
				, success:function(data) {
					if (data.result == "success") {
						location.reload();
					} else {
					alert("댓글 작성 실패");
					}
				}
				, error:function() {
					alert("댓글 작성 에러");
				}
				
			});
			
		});
		
		
		// 좋아요
		$(".like-icon").on("click", function() {
			
			// 좋아요 대상 게시글 pk
			// data-post-id
			let id = $(this).data("post-id");
			
			// api호출
			$.ajax({
				type:"post"
				, url:"/post/like"
				, data:{"postId":id}
				, success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else {
						alert("좋아요 실패");
					}
				}
				, error:function() {
					alert("좋아요 에러");
				}
			});
			
		});
		
		
		// 좋아요 취소
		$(".unlike-icon").on("click", function() {
			
			// 좋아요 대상 게시글 pk
			// data-post-id
			let id = $(this).data("post-id");
			
			$.ajax({
				type:"delete"
				, url:"/post/unlike"
				, data:{"postId":id}
				, success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else {
						alert("좋아요 취소 실패");
					}
				}
				, error:function() {
					alert("좋아요 취소 에러")
				}
			});
			
		});
			
		
		// 게시글	
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