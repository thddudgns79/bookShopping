<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
		<script>
			function deleteReview() {
				var reviewno = $(event.target).val();
			 		$.ajax({
			 			url:"/shopping/controller/user/deleteReviewListController?review_no=" + reviewno,
	 		 			type: "get",
			 			success: function(data) {	
			 				$(".card-body").html(data);
			 			}
			 		});
			 	}
		</script>
		<style>
			
			*{
				padding : 0px;
				margin : 0px;
				box-sizing: border-box;
			}
			
			#wrapper{
				width : 1150px;
				margin : 0px auto;
			}
			
			img {
				width : 100%;
				height : 100%;
			}
			
			
			h3 {
				margin-bottom: 30px;
			}
		</style>
	</head>
	<body>
	<div id="wrapper">
		<div class="container-fluid">
			<div id="topLogo" class="row border justify-content-center">
				<span>
				<a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=1&categoryNo=1&subCategoryNo=1&pageNo=1"><img
					src="${pageContext.request.contextPath}/resources/images/imageOfBook/mainLogo.png"
					style="height: 80px; margin-top: 10px"></a></span>
			</div>

			<div id="top-menu" class="row border">
				<span style="font-size: 20px; margin-left: 90%;"><i
					class="fa-solid fa-magnifying-glass"></i></span>
			</div>
			<div class="row">
				<!-- 사이드바 -->
				<div id="sideMenu" class="col-3">
					<div class="mt-5">
						<ul class="list-group">
							<li class="text-center list-group-item list-group-item-action"><a
								href="/shopping/controller/user/myPageMainController"
								class="btn">내 프로필</a></li>
							<li class="text-center list-group-item list-group-item-action"><a
								href="/shopping/controller/user/cartDetailController"
								class="btn">장바구니</a></li>
							<li class="text-center list-group-item list-group-item-action"><a
								href="/shopping/controller/user/myLikeListController"
								class="btn">찜 목록</a></li>
							<li class="text-center list-group-item list-group-item-action"><a
								href="/shopping/controller/user/myPageReviewListController"
								class="btn">리뷰 목록</a></li>
							<li class="text-center list-group-item list-group-item-action"><a
								href="/shopping/controller/user/myQnaBoardController"
								class="btn">문의 목록</a></li>
							<li class="text-center list-group-item list-group-item-action"><a
								href="/shopping/controller/user/myPageOrderController"
								class="btn">주문 내역</a></li>
						</ul>
					</div>
				</div>
				<div id="reviewList" class="col-9 mt-5">
					<div class="card m-2">
						<div class="card-header">
							<h3 class="font-weight-bold">나의 리뷰</h3>
						</div>
						<div class="card-body">
								<table class="table table-sm table-bordered">
									<c:forEach var="reviewDto" items="${pageList}">
										<div class="review card">
											<div class="card-header container-fluid">
												<div class="row">
													<div class="col-10">
														<a href="../book/bookInfo.html"> <span>${reviewDto.review_no}. ${reviewDto.book_name}</span></a>
										|
														<!-- <span>thddudgns79</span> |  -->
														<span>${reviewDto.review_date}</span> | <span>평점 :
															${reviewDto.review_score}점</span>
													</div>
													<div>
														<a class="btn btn-primary  btn-sm mb-2 mr-3"
															style="background-color: rgb(88, 39, 35);"
															href="/shopping/controller/user/reviewUpdateController?review_no=${reviewDto.review_no}">수정</a>
													</div>
													<div>
															<button value="${reviewDto.review_no}" class="btn btn-primary btn-sm"  
															style="background-color: rgb(88, 39, 35);" 
															onclick="deleteReview()">삭제</button>
													</div>
												</div>
											</div>
											<div class="card-body">
												<p class="font-weight-normal" style="font-size: 13px;">
													${reviewDto.review_content}</p>
											</div>
										</div>
									</c:forEach>
								
									<tr>
										<td class="text-center">
											<div>
												<a href="myPageReviewListController?pageNo=1"
													class="btn btn-outline-primary btn-sm">처음</a>
												<c:if test="${pager.groupNo >1 }">
													<a
														href="myPageReviewListController?pageNo=${pager.startPageNo-1}"
														class="btn btn-outline-info btn-sm">이전</a>
												</c:if>
												<c:forEach var="i" begin="${pager.startPageNo}"
													end="${pager.endPageNo}">
													<c:if test="${pager.pageNo != i}">
														<a href="myPageReviewListController?pageNo=${i}"
															class="btn btn-outline-success btn-sm">${i}</a>
													</c:if>
													<c:if test="${pager.pageNo == i}">
														<a href="myPageReviewListController?pageNo=${i}"
															class="btn btn-danger btn-sm">${i}</a>
													</c:if>
												</c:forEach>
												<c:if test="${pager.groupNo < pager.totalGroupNo}">
													<a
														href="myPageReviewListController?pageNo=${pager.endPageNo+1}"
														class="btn btn-outline-info btn-sm">다음</a>
												</c:if>
												<a
													href="myPageReviewListController?pageNo=${pager.totalPageNo}"
													class="btn btn-outline-primary btn-sm">맨끝</a>
											</div>
										</td>
									</tr>
								</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>