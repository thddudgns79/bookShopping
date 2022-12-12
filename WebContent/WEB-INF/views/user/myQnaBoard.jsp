<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>문의 게시판</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
		<script>
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
			.btn{
				background-color: rgb(255,255,255);
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
				<div id="topLogo" class="row border justify-content-center"><span><img src="/shopping/resources/images/imageOfBook/mainLogo.png" style="height:80px; margin-top:10px"></span></div>
            	<div id="top-menu" class="row border"><span style="font-size:20px; margin-left:90%;" ><i class="fa-solid fa-magnifying-glass"></i></span></div>
            <div class="row border">
               <!-- 사이드바 -->
               <div id="sideMenu" class="col-3">
                  <div class="mt-5">
                     <ul class="list-group">
                        <li class="text-center list-group-item list-group-item-action"><a href = "${pageContext.request.contextPath}/controller/user/myPageMainController" class="btn">내 프로필</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "${pageContext.request.contextPath}/controller/user/cartDetailController" class="btn">장바구니</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "${pageContext.request.contextPath}/controller/user/myLikeListController" class="btn">찜 목록</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "${pageContext.request.contextPath}/controller/user/myPageReviewListController" class="btn">리뷰 목록</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "${pageContext.request.contextPath}/controller/user/myQnaBoardController" class="btn">문의 목록</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "${pageContext.request.contextPath}/controller/user/myPageOrderController" class="btn">주문 내역</a></li>
                     </ul>
                  </div>
               </div>
               <!-- 메인바 -->
               <div class="col-9">
                  <div class="container" style="width:650px; font-size:12px; ">
                  	<!-- 글 목록  -->
					<div class="row mt-5">
						<table class="table">
						    <thead style="background-color:rgb(88,39,35);color:#ffffff;">
						      <tr>
						        <th>No.</th>
						        <th>카테고리</th>
						        <th>제목</th>
						        <th>작성자</th>
						        <th>작성일</th>
						        <th>조회수</th>
						      </tr>
						    </thead>
							    <tbody>
								    <c:forEach var="qnaDto" items="${pageList}">
								      <tr onclick="location.href='${pageContext.request.contextPath}/controller/qna/qnaDetailController?qna_no=${qnaDto.qna_no}'" style="cursor:pointer;">
								      	<td>${qnaDto.qna_no}</td>
							    		<td>${qnaDto.qna_category}</td>
							    		<td>${qnaDto.qna_title}</td>
							    		<td>${qnaDto.user_id}</td>
							    		<td>${qnaDto.qna_date}</td>
							    		<td>${qnaDto.qna_view }</td>
								      </tr>
								    </c:forEach>
							    </tbody>
						  </table>					
						</div>  
						<!-- 페이저 -->
						<div class="row justify-content-center mt-3">
							<div>
								<a href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?pageNo=1&category=${userDto}" class="btn btn-outline-primary btn-sm" style="background-color:#ffffff; color:black">처음</a>		
								<c:if test="${pager.groupNo >1 }">
									<a href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?pageNo=${pager.startPageNo-1}&category=${userDto}" class="btn btn-outline-info btn-sm" style="background-color:#ffffff; color:black">이전</a>
								</c:if>
								<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<c:if test="${pager.pageNo !=i }">
										<a href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?pageNo=${i}&category=${userDto}" class="btn btn-outline-success btn-sm" style="background-color:#ffffff; color:black">${i}</a>
									</c:if>
									
									<c:if test="${pager.pageNo ==i }">
										<a href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?pageNo=${i}&category=${userDto}" class="btn btn-primary btn-sm" style="background-color: rgb(88, 39, 35);color:#ffffff;">${i}</a>
									</c:if>
								</c:forEach>
								
								<c:if test="${pager.groupNo< pager.totalGroupNo }">
									<a href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?pageNo=${pager.endPageNo+1}&category=${userDto}" class="btn btn-outline-info btn-sm " style="background-color:#ffffff; color:black">다음</a>
								</c:if>
								<a href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?pageNo=${pager.totalPageNo}&category=${userDto}" class="btn btn-outline-primary btn-sm" style="background-color:#ffffff; color:black">맨끝</a>
							</div>
						</div>
	                  </div> 
	               </div>
               </div>
            </div>
		</div>
	</body>
</html>