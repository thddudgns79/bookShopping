<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
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
			.card-header{
				background-color: RGB(247,233,184);
			}
		</style>
		
	</head>
	<body>
		
		<!-- 전체 레이아웃 -->
		<div id="wrapper">
			<div class="container-fluid">
				<div id="topLogo" class="row border justify-content-center"><span><img src="${pageContext.request.contextPath}/resources/images/imageOfBook/mainLogo.png" style="height:80px; margin-top:10px"></span></div>
				
				<div id="top-menu" class="row border"><span style="font-size:20px; margin-left:90%;" ><i class="fa-solid fa-magnifying-glass"></i></span></div>
				
				<div class="row border">
					<!-- 사이드바 -->
					<div id="sideMenu" class="col-3 border">
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
					<div class="col-9 mt-5">
						<div class="container-fluid">
							<div class="row justify-content-center">
								<c:forEach var = "order" items = "${orderList}" varStatus = "status">
									<div class="card mb-5">
									<div class="card-header"><span class = "font-weight-bold">No. ${order.order_no}</span><button class="btn btn-secondary btn-sm" style="margin-left:70%; font-size:13px;">주문 취소</button></div>
							
									<div class="card-body">
										<table class="table table-bordered" style="width:500px; font-size:13px;">
										    <tbody>
										      <tr>
										        <td><b>주문일</b></td>
										        <td>${order.order_date} </td>
										      </tr>
										      <tr>
										        <td><b>주문 아이디</b></td>
										        <td>${order.user_id}</td>
										      </tr>
										      <tr>
										        <td><b>수령인</b></td>
										        <td>${order.order_receivename}</td>
										      </tr>
										      <tr>
										        <td><b>전화번호</b></td>
										        <td>${order.order_tel}</td>
										      </tr>
										      <tr>
										        <td><b>배송 주소</b></td>
										        <td>${order.order_address}</td>
										      </tr>
										      <tr>
										        <td><b>배송 메모</b></td>
										        <td>${order.order_memo}</td>
										      </tr>
										      <tr>
										        <td><b>주문 상태</b></td>
										        <c:if test="${fn:contains(order.order_status, 'Y')}">
										        	<td>주문완료</td>
										        </c:if>
										        <c:if test="${fn:contains(order.order_status, 'N')}">
										        	<td>취소된 주문입니다</td>
										        </c:if>
										        
										      </tr>
										    </tbody>
									  </table>
									</div>
									<div class="card-foot">
										<div class="card-header"><span>주문 상세</span></div>
										<div class="card-body">
											<table class="table table-bordered" style="width:500px; font-size:13px;">
												<tbody>
													<c:forEach var = "orderDetail" items = "${order.orderDetails}" varStatus = "status">
														<tr>
															<td style="width:100px; height:50px; margin:0px auto; padding:0px">
																<c:if test="${orderDetail.fileName != null}">
													               	<p>
													               		<span>
													               			<a href = "${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${orderDetail.book_no}">
													               				<img src = "../book/DownloadAttachController?reqType=1&bookNo=${orderDetail.book_no}" width = "100"/>
													               			</a>
													               		</span> <br/>
													               	</p>
												                </c:if> 
															</td>
													        <td>
													        	<a href = "${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${orderDetail.book_no}">
													               	<b>${orderDetail.book_name}</b>			
										               			</a>
										               		</td>
													        <td>${orderDetail.od_qty}권</td>
													        <td><a class="btn btn-primary btn-sm" href = "${pageContext.request.contextPath}/controller/user/reviewCreateController?bookNo=${orderDetail.book_no}">리뷰쓰기</a></td>
											      		</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
			    				</div>
			    				<hr/>
							</c:forEach>	
						</div>
						<div id = "pagerBar" style = "text-align : center">
			                     <a href="${pageContext.request.contextPath}/controller/user/myPageOrderController?pageNo=1" class="btn btn-outline-primary btn-sm">처음</a>
			                     <c:if test="${pager.groupNo > 1}">
			                     	<a href="${pageContext.request.contextPath}/controller/user/myPageOrderController?pageNo=${pager.startPageNo-1}" class="btn btn-outline-info btn-sm">이전</a>
			                     </c:if>
			                     
			                     <c:forEach var = "i" begin = "${pager.startPageNo}" end = "${pager.endPageNo}">
				                     <c:if test="${pager.pageNo != i}">
				                     	<a href="${pageContext.request.contextPath}/controller/user/myPageOrderController?pageNo=${i}" class="btn btn-outline-success btn-sm">${i}</a>
				                     </c:if>
				                     <c:if test="${pager.pageNo == i}">
				                     	<a href="${pageContext.request.contextPath}/controller/user/myPageOrderController?pageNo=${i}" class="btn btn-outline-danger btn-sm">${i}</a>
				                     </c:if>
			                     </c:forEach>
			                     
			                     
			                     <c:if test="${pager.groupNo < pager.totalGroupNo}">
			                     	<a href="${pageContext.request.contextPath}/controller/user/myPageOrderController?pageNo=${pager.endPageNo+1}" class="btn btn-outline-info btn-sm">다음</a>
			                     </c:if>
			                     <a href="${pageContext.request.contextPath}/controller/user/myPageOrderController?pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm">맨끝</a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>