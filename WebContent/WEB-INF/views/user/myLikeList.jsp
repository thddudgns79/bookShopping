<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내 찜 목록</title>
	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">	
		<script>
		function deleteDib() {
			var bookNo = $(event.target).val();
		 		$.ajax({
		 			url:"/shopping/controller/user/deleteDibController?book_no=" + bookNo,
 		 			type: "get",
		 			success: function(data) {	
		 				$("#delbid").html(data);
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
			
			tbody>tr:hover {
			  background-color: RGB(247,233,184);
			}
			a{
				color:black;
			}

			td {
		        text-align: center;
		    }
		    .card-header{
         		background-color: RGB(247 233 184);
	         	font-weight: bold;
		    }
	        .td_middle{
	        	width:430px;
		    }
		</style>
				
	</head>

<body>

	<div id="wrapper">
		<div class="container-fluid">
			<div id="topLogo" class="row border justify-content-center">
				<span>
				<a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=1&categoryNo=1&subCategoryNo=1&pageNo=1">
					<img src="${pageContext.request.contextPath}/resources/images/imageOfBook/mainLogo.png"	style="height: 80px; margin-top: 10px">
				</a></span>
			</div>

			<div id="top-menu" class="row border">
				<span style="font-size: 20px; margin-left: 90%;"><i
					class="fa-solid fa-magnifying-glass"></i></span>
			</div>

			<div class="row border">
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
				<!--전체 div를 수직으로 정렬해주는 box -->
				<div class="col-9">
					<!-- 전체 열 box -->
					<div class="row">
						<div class="container-fluid">
							<div class="col">
								<div class="mt-3">
									<span style="font-size: 23px; font-weight: bold;"> 내 찜
										목록</span>
								</div>
							</div>
							<div class="col" id="delbid">

								<table class="table table-hover">
									<thead>
										<tr>
											<th><span>No.</span></th>
											<th><span style="padding: 40%;">책제목</span></th>
											<th><span style="padding: 30%;">저자</span></th>
											<th><span></span></th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="SelectDibDto" items="${pageList}">
												<tr onclick="location.href='${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${SelectDibDto.book_no}'" style="cursor:pointer;">
													<td>${SelectDibDto.book_no}</td>
													<td>${SelectDibDto.book_name}</td>
	
													<td>${SelectDibDto.author_name}
															외 ${SelectDibDto.authorList.size()-1}명
													</td>
													
													<td>
														<div>
															<button value="${SelectDibDto.book_no}"
																class="btn btn-primary btn-sm"
																style="background-color: rgb(88, 39, 35);"
																onclick="deleteDib()">삭제</button>
														</div>
													</td>
												</tr>
												
										</c:forEach>
										<tr>
											<td colspan="6" class="text-center">
												<div>
													<a href="myLikeListController?pageNo=1"
														class="btn btn-outline-primary btn-sm">처음</a>
													<c:if test="${pager.groupNo >1 }">
														<a
															href="myLikeListController?pageNo=${pager.startPageNo-1}"
															class="btn btn-outline-info btn-sm">이전</a>
													</c:if>
													<c:forEach var="i" begin="${pager.startPageNo}"
														end="${pager.endPageNo}">
														<c:if test="${pager.pageNo != i}">
															<a href="myLikeListController?pageNo=${i}"
																class="btn btn-outline-success btn-sm">${i}</a>
														</c:if>
														<c:if test="${pager.pageNo == i}">
															<a href="myLikeListController?pageNo=${i}"
																class="btn btn-danger btn-sm">${i}</a>
														</c:if>
													</c:forEach>
													<c:if test="${pager.groupNo < pager.totalGroupNo}">
														<a href="myLikeListController?pageNo=${pager.endPageNo+1}"
															class="btn btn-outline-info btn-sm">다음</a>
													</c:if>
													<a href="myLikeListController?pageNo=${pager.totalPageNo}"
														class="btn btn-outline-primary btn-sm">맨끝</a>
												</div>
											</td>
										</tr>

									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>