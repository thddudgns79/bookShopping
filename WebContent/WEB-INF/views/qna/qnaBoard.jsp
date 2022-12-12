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
			.topLi{
				list-style: none;
				float: left;
				padding: 5px 15px;
				font-size:4px;
			}
			.topLi a{
				color: #818181;			
			}
			.topLi a:hover{
				color: RGB(61 31 29);
			}
			.topLi::after{
				content:"|";
				float:right;
				color:#ccc;
				margin-right: -17px;
			}
			.topLi:last-child::after{
				content:"";
			}
		</style>
		
	</head>
	<body>
		
		<div id="wrapper">
			
			<div class="container-fluid">
				<!-- 로그인/회원가입/메인페이지 -->
				<div class="row justify-content-end">
					<ul style="text-align:center;">
						<c:if test="${userDto == null}">
							<li class = "topLi"><a href = "${pageContext.request.contextPath}/controller/user/loginController"><span>로그인</span></a></li>
							<li class = "topLi"><a href = "${pageContext.request.contextPath}/controller/user/signUpController"><span>회원가입</span></a></li>
							<li class = "topLi"><a href = "${pageContext.request.contextPath}/HomeController"><span>메인페이지</span></a></li>
						</c:if>
						<c:if test="${userDto != null}">
							<li class = "topLi"><a href = "${pageContext.request.contextPath}/controller/user/logoutController"><span>로그아웃</span></a></li>
							<li class = "topLi"><a href = "${pageContext.request.contextPath}/HomeController"><span>메인페이지</span></a></li>
						</c:if>
					</ul>
				</div>
				<!-- top-logo -->
				<div class="row justify-content-center"><img src="/shopping/resources/images/imageOfBook/mainLogo.png"/></div>
				
				<!-- 전체목록/ 카테고리 조회 -->
				<div class="row mt-5">
					
				  <div><a class="dropdown-item" href="/shopping/controller/qna/qnaBoardController"><button type="button" class="btn">전체</button></a></div>
				  <div class="dropdown ml-1">
				  	<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">카테고리</button>
					<div class="dropdown-menu">
					    <a class="dropdown-item" href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?category=1">배송</a>
					    <a class="dropdown-item" href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?category=2">주문/결제</a>
					    <a class="dropdown-item" href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?category=3">도서/상품정보</a>
					    <a class="dropdown-item" href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?category=4">반품/교환/환불</a>
					    <a class="dropdown-item" href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?category=5">회원정보서비스</a>
					    <a class="dropdown-item" href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?category=6">웹사이트 이용 관련</a>
					    <a class="dropdown-item" href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?category=7">시스템 불편사항</a>
					    <a class="dropdown-item" href="${pageContext.request.contextPath}/controller/qna/qnaBoardCategoryController?category=8">기타</a>
				    </div>
				  </div>
					 	
				</div>
				
				<!-- 글쓰기 버튼 -->
				<c:if test="${userDto.user_id != null }">
					<div class="row justify-content-end mr-4">
						<a href="${pageContext.request.contextPath}/controller/qna/qnaCreateController"><button class="btn btn-sm">문의하기</button></a>
					</div>
				</c:if>
				<c:if test="${userDto.user_id == null }">
					<div class="row justify-content-end mr-4">
						<button type="button" class ="btn btn-sm" data-toggle="modal" data-target="#myModal">문의하기</button>
						<!-- The Modal -->
						<div class="modal fade" id="myModal">
							<div class="modal-dialog">
								<div class="modal-content">
									<!-- Modal body -->
									<div class="modal-body">
										<span>로그인이 필요합니다.</span>
									</div>
			
									<!-- Modal footer -->
									<div class="modal-footer">
										<a href="${pageContext.request.contextPath}/controller/user/loginController"><button class="btn btn-sm" style="background-color:rgb(88,39,35);color:#ffffff;">로그인</button></a>
										<button type="button" class="btn btn-sm" data-dismiss="modal" style="background-color:red;color:#ffffff;">Close</button>
									</div>
							      
								</div>
							</div>
						</div>						
					</div>
				</c:if>
				
				<!-- 글 목록  -->
				<div class="row mt-3"></div>
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
				<!-- 페이저 -->
				<div class="row justify-content-center mt-3">
					<div>
						<a href="${pageContext.request.contextPath}/controller/qna/qnaBoardController?pageNo=1" class="btn btn-outline-primary btn-sm" style="background-color:#ffffff; color:black">처음</a>
						
						<c:if test="${pager.groupNo >1 }">
							<a href="${pageContext.request.contextPath}/controller/qna/qnaBoardController?pageNo=${pager.startPageNo-1}" class="btn btn-outline-info btn-sm" style="background-color:#ffffff; color:black">이전</a>
						</c:if>
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo !=i }">
								<a href="${pageContext.request.contextPath}/controller/qna/qnaBoardController?pageNo=${i}" class="btn btn-outline-success btn-sm" style="background-color:#ffffff; color:black">${i}</a>
							</c:if>
							
							<c:if test="${pager.pageNo ==i }">
								<a href="${pageContext.request.contextPath}/controller/qna/qnaBoardController?pageNo=${i}" class="btn btn-primary btn-sm" style="background-color: rgb(88, 39, 35);color:#ffffff;">${i}</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${pager.groupNo< pager.totalGroupNo }">
							<a href="${pageContext.request.contextPath}/controller/qna/qnaBoardController?pageNo=${pager.endPageNo+1}" class="btn btn-outline-info btn-sm " style="background-color:#ffffff; color:black">다음</a>
						</c:if>
						<a href="${pageContext.request.contextPath}/controller/qna/qnaBoardController?pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm" style="background-color:#ffffff; color:black">맨끝</a>
					</div>
				</div>
				
			</div>
		
		</div>
		
		
	</body>
</html>