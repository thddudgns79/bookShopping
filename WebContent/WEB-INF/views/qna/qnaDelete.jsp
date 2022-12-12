<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
			.QnA_container{
				width : 900px;
				margin : 0px auto;
			}
			h3{
				margin-top: 7%;
				text-align: left;
			}
			#answer_content, #QnA_content {
				height: 400px;
			}
			.buttons{
				margin-left: 80%;
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
			<div class="QnA_container conatiner-fluid">
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
				<div class="row" id="QnA" style="margin-bottom: 30px;"><h3>1:1 문의</h3></div>
				<form method="post" action="${pageContext.request.contextPath}/controller/qna/qnaDeleteController?qna_no=${qnaDto.qna_no}">
					<div class="row card">	
						<div class="card-header container-fluid">
							<div class="row">
								<div id="QnA_no" class="col-sm-6">
									<span>글번호: </span>
									<span>${qnaDto.qna_no}</span>
								</div>
								<div id="QnA-category" class="col-sm-6">
									<span>문의 유형: </span>
									<span>${qnaDto.qna_category}</span>
								</div>
							</div>
							<hr/>
							
							<div class="row QnA_title">
								<h4 style="margin-left: 7%;">제목: ${qnaDto.qna_title}</h4>
							</div>
							<hr/>
							
							<div class="row">
								<div id="QnA_writer" class="col-sm-6">
									<span>작성자: </span>
									<span>${qnaDto.user_id}</span>
								</div>
								<div class="col-sm-3">
									<span>조회수: </span>
									<span>${qnaDto.qna_view}</span>
								</div>
								<div class="col-sm-3">
									<span>작성일: </span>
									<span>${qnaDto.qna_date}</span>
								</div>
							</div>
						</div>
						<div class="card-body">
							<p id="QnA_content">${qnaDto.qna_content}</p>
						</div>
						<div class="card-footer">
							<button type="button" class ="btn btn-sm" data-toggle="modal" data-target="#myModal" style="background-color:red;color:#ffffff;">삭제</button>
								<!-- The Modal -->
								<div class="modal fade" id="myModal">
									<div class="modal-dialog">
										<div class="modal-content">
											<!-- Modal body -->
											<div class="modal-body">
												<span>정말 삭제하시겠습니까?</span>
											</div>
					
											<!-- Modal footer -->
											<div class="modal-footer">
												<button type="submit" class="btn btn-sm" style="background-color: rgb(88, 39, 35);color:#ffffff;">네</button>
												<button type="button" class="btn btn-sm" data-dismiss="modal" style="background-color:red;color:#ffffff;">아니오</button>
											</div>
									      
										</div>
									</div>
								</div>				
						</div>
					</div>
				</form>
				
				
			</div>

			<div id="footer" style="margin-bottom: 30px;">
			</div>
		</div>
	</body>
</html>