<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1:1 문의 접수</title>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
		<style>
			* {
				padding: 0px;
				margin: 0px;
				box-sizing: border-box;
			}
			
			#wrapper {
				width: 1150px;
				margin: 0px auto;
			}
			
			.text {
				font-size: 20px;
			}
			
			.text1 {
				font-size: 20px;
				font-weight: 1000;
			}
			
			.text2 {
				font-size: 40px;
				font-weight: 1000;
			}
			
			.text3 {
				font-size: 30px;
				font-weight: 1000;
			}
			
			.ordertext {
				font-size: 20px;
				font-weight: 1000;
			}
			
			.ordertext2 {
				text-align: right;
				font-size: 15px;
				font-weight: 1000;
			}
			
			.buttombox {
				border: 1px solid black;
			}
			
			#box {
				height: 10%
			}
			
			#button {
				text-align: center;
			}
			
			.inside {
				height: 20%
			}
			
			hr {
				background-color: rgb(88, 39, 35);
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
			<div id=one class="container-fluid">
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
				<div class="row justify-content-center">
					<img src="${pageContext.request.contextPath}/resources/images/imageOfBook/mainLogo.png" />
				</div>
				<div class="row mx-2">
					<div class="col-3 mt-3">
						<span style="font-size: 23px; font-weight: bold;">1:1 문의 접수</span>
					</div>

					<div class="col-9 d-flex justify-content-end mt-4 ">
						<span style="font-size: 15px; font-weight: bold;"></span>
					</div>

				</div>
				<hr />

				<div id=two class="row">
					<div id=two1 class="col">
						<div class="d-flex flex-column">
							<div class="card">
								<div class="card-body">
									<form id="joinForm" name="joinForm" method="post" action="qnaCreateController?userId=${userDto.user_id}" >

										<div class="form-group">
											<div class="row">
												<div class="col-2">
													<label for="qna_category">문의 유형</label>
												</div>

												<div class="col-10">
													<select id="qna_category" name="qna_category" class="form-control">
														<option value="[배송]">배송</option>
														<option value="[주문/결제]">주문/결제</option>
														<option value="[도서/상품정보]">도서/상품정보</option>
														<option value="[반품/교환/환불]">반품/교환/환불</option>
														<option value="[회원정보서비스]">회원 정보서비스</option>
														<option value="[웹사이트 이용 관련]">웹 사이트 이용 관련</option>
														<option value="[시스템 불편사항]">시스템 불편사항</option>
														<option value="[기타]">기타</option>
													</select>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-2">
												<label for="qna_title">제목</label>
											</div>
											<div class="col-10">
												<input type="text" class="form-control " id="qna_title" name="qna_title"/>
											</div>
										</div>

										<div class="row mt-3">
											<div class="col-2 ">
												<label for="qna_content">내용</label>
											</div>
											<div class="col-10">
												<textarea class="form-control" rows="5" id="qna_content" name="qna_content"></textarea>
											</div>
										</div>
										<div class="row mx-2 bottonbox d-flex justify-content-center mt-3">
											<div>
												<button type="submit" class="btn btn-primary" style="background-color: rgb(88, 39, 35);">문의신청 </button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>