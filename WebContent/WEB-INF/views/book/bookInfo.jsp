<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<!-- jQuery library -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<!-- Popper JS -->
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<!-- Latest compiled JavaScript -->
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
			
			img {
				width : 100%;
				height : 100%;
			}
			
			.part {
				margin-bottom: 100px;
			}
			
			h3 {
				margin-bottom: 30px;
			}
		</style>
		<script>
			$(function(){
				$('#cas').modal({
		       		 fadeDuration: 250
		    	 });
				
				$('#caf').modal({
		       		 fadeDuration: 250
		    	 });
				
				$('#das').modal({
		       		 fadeDuration: 250
		    	 });
				
				$('#daf').modal({
		       		 fadeDuration: 250
		    	 });
			})
				
			function cartPlus(){
				var count = parseInt($("#cartQty").val());
				if(count <= 98){
					$("#cartQty").attr("value", count + 1);
					$("#cartQty").text($("#cartQty").val());
				}
				
			}
			
			function cartMinus(){
				var count = parseInt($("#cartQty").val());
				if(count >= 2){
					$("#cartQty").attr("value", count - 1);
					$("#cartQty").text($("#cartQty").val());
				}
				
			}
			
			function order(){
				var count = $("#cartQty").attr("value");
				var queryString = "${pageContext.request.contextPath}/controller/book/bookOrderController?bookNo=${bookInfo.book_no}&bookQty=" + count;
				$("#orderButton").attr("href", queryString);
			}
			
			function addCart(){
				var count = $("#cartQty").attr("value");
				var queryString = "${pageContext.request.contextPath}/controller/book/addCartController?bookNo=${bookInfo.book_no}&bookQty=" + count;
				$("#addCartButton").attr("href", queryString);
				$("#caf").show();
			}
			
		</script>
	</head>
	<body>
		<div id = "wrapper">
			<c:if test="${cartAdd != null && cartAdd == 'success'}">
				<!-- The Modal -->
				<div class="modal fade" id="cas">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- Modal body -->
							<div class="modal-body">
								<span>장바구니에 추가되었습니다.</span>
							</div> 
						</div>
					</div>
				</div>		
			</c:if>
			
			<c:if test="${dibAdd != null && dibAdd == 'success'}">
				<!-- The Modal -->
				<div class="modal fade" id="das">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- Modal body -->
							<div class="modal-body">
								<span>찜목록에 추가되었습니다.</span>
							</div> 
						</div>
					</div>
				</div>	
			</c:if>
			
			<c:if test="${cartAdd != null && cartAdd == 'fail'}">
				<!-- The Modal -->
				<div class="modal fade" id="caf">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- Modal body -->
							<div class="modal-body">
								<span>이미 장바구니에 존재하는 상품입니다.</span>
							</div> 
						</div>
					</div>
				</div>		
			</c:if>
			
			<c:if test="${dibAdd != null && dibAdd == 'fail'}">
				<!-- The Modal -->
				<div class="modal fade" id="daf">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- Modal body -->
							<div class="modal-body">
								<span>이미 찜한 상품입니다.</span>
							</div> 
						</div>
					</div>
				</div>	
			</c:if>
			
			<div class = "container-fluid">
				  <div class="text-center"><a href = "${pageContext.request.contextPath}/HomeController"><img src = "${pageContext.request.contextPath}/resources/images/imageOfBook/mainLogo.png" style = "width : 500px"/></a></div>
			         <div class = "container-fluid">
			            <div class = "row part">
			               <div class = "col-sm-4">
				               <c:if test="${bookInfo.fileName != null}">
					               	<p>
					               		<span>
				               				<img src = "DownloadAttachController?reqType=1&bookNo=${bookInfo.book_no}" width = "100"/>
					               		</span> <br/>
					               	</p>
				              </c:if>
			              </div>
			               <div class = "col-sm-8 mt-5">
			                     <div class="ml-3"><h3><b>${bookInfo.book_name}</b></h3></div>
			                     <div class="ml-3 mt-1"><span style="font-size:15px;">${firstAuthor.author_name} 외  ${authorSize}명/  ${bookInfo.book_publisher} / ${bookInfo.book_date} 출시</span></div>
			                     <hr/>
			                     <div class="ml-3">
			                        <span style="font-size:13px;"><b>정가 : ${bookInfo.book_price}원</b></span>
			                     </div>
			                     <div class="ml-3">
			                        <span style="font-size:20px; color:red;"><b>판매가 : ${bookInfo.book_price * 0.9}원</b></span>
			                     <span style="font-size:15px; color:red;"><b>(10% 할인)</b></span>
			                     </div>
			                     <hr/>
			                     <div class="ml-3"><span style="font-size:15px;">재고수량 : ${bookInfo.book_store}권</span></div>
				                 <div class="ml-3"><span style="font-size:15px;">책 페이지 : ${bookInfo.book_page}쪽</span></div>
				                 <div class="ml-3"><span style="font-size:15px;">언어 : ${bookInfo.book_lang}</span></div>
				                 <hr/>
				                 <div>
									<span class = "font-weight-bolder mr-3 ml-3" style="font-size:20px">총 상품 금액</span>
									<span class = "font-weight-bolder" style="font-size:20px">12,420원</span>
								 </div>
								 <hr/>
								 <div class = "btn-group mr-2 ml-3">
									<button class = "btn btn-primary btn-small" onclick = "cartPlus()">+</button>
									<input type="text" value = "1" readonly style="text-align:center; width :20px" id = "cartQty"/>
									<button class = "btn btn-primary btn-small" onclick = "cartMinus()">-</button>
								 </div>
								 <a href="${pageContext.request.contextPath}/controller/book/addDibController?bookNo=${bookInfo.book_no}"  
								 class = "btn btn-primary btn-small mr-2">♥</a>						
								 <a href="${pageContext.request.contextPath}/controller/book/addCartController?bookNo=${bookInfo.book_no}&bookQty=" 
								 class = "btn btn-primary btn-small mr-2" id = "addCartButton" onclick = "addCart()">장바구니 추가</a>
								 <a href="${pageContext.request.contextPath}/controller/book/bookOrderController?bookNo=${bookInfo.book_no}&bookQty=" 
								 class = "btn btn-primary btn-small mr-2" id = "orderButton" onclick = "order()">바로구매</a>
				             </div>
				          </div>
			            
			            <div class = "row part">
			               <div class = "col-sm-12">
			                     <div><span><h3 class = "font-weight-bold">책 소개글</h3></span></div>
			                     <div>
			                        <span class = "font-weight-normal" style="font-size:14px;">
			                        	${bookInfo.book_detail}
			                      </span>
			                     </div>
			                </div>
			            </div>

				
				
				
				
				<!--  ----------------------------------------------------------------------------------------  -->
				
				
				
					
					
					
					
					<!--  저자 정보 -->
					<div class = "row part">
						<div id = "authorList" class = "col-sm-12">
							<h3 class = "font-weight-bolder">저자 소개</h3>
								<c:forEach var = "author" items = "${authorList}">
									<div class = "card">
										<div class = "card-header">
											<span class = "font-weight-bold ml-3" style="font-size:18px;">${author.author_name}</span>
										</div>
										<div class = "card-body">
											<div class = "container-fluid">
												<div class = "row">
													<div class = "col-sm-3">
														<c:if test="${author.fileName != null}">
											               	<p>
											               		<span>
										               				<img src = "DownloadAttachController?reqType=2&authorNo=${author.author_no}" width = "100"/>
											               		</span> <br/>
											               	</p>
										               </c:if>
													</div>
													<div class = "col-sm-9"><p class = "font-weight-normal" style="font-size:15px;">${author.author_detail}</p></div>
												</div>
											</div>									
										</div>
									</div>
								</c:forEach>
													
							
						</div>
					</div>
					
					
					
					<!--  리뷰 게시판 -->
					<div class = "row part">
						<div id = "reviewList"class = "col-sm-12">
							<h3 class = "font-weight-bold">회원 리뷰</h3>
							<p>
								매주 10건의 우수리뷰를 선정하여 YES포인트 3만원을 드립니다.<br>
								3,000원 이상 구매 후 리뷰 작성 시 일반회원 300원, 마니아회원 600원의 YES포인트를 드립니다.<br>
								(CD/LP, DVD/Blu-ray, 패션 및 판매금지 상품, 예스24 앱스토어 상품 제외) 
							</p>
							<c:forEach var = "review" items = "${reviewList}">
								<div class = "review card">
									<div class = "card-header">
										<span>${review.user_id}</span> | <span>${review.review_date}</span> | <span>평점 : ${review.review_score}</span>
									</div>
									<div class = "card-body">
										<p class = "font-weight-normal" style="font-size:13px;">
											${review.review_content}
										</p>
									</div>
								</div>
							</c:forEach>
	
							<div id = "pagerBar" style = "text-align : center">
			                     <a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${bookInfo.book_no}&reviewPageNo=1" class="btn btn-outline-primary btn-sm">처음</a>
			                     <c:if test="${pager.groupNo > 1}">
			                     	<a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${bookInfo.book_no}&reviewPageNo=${pager.startPageNo-1}" class="btn btn-outline-info btn-sm">이전</a>
			                     </c:if>
			                     
			                     <c:forEach var = "i" begin = "${pager.startPageNo}" end = "${pager.endPageNo}">
				                     <c:if test="${pager.pageNo != i}">
				                     	<a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${bookInfo.book_no}&reviewPageNo=${i}" class="btn btn-outline-success btn-sm">${i}</a>
				                     </c:if>
				                     <c:if test="${pager.pageNo == i}">
				                     	<a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${bookInfo.book_no}&reviewPageNo=${i}" class="btn btn-outline-danger btn-sm">${i}</a>
				                     </c:if>
			                     </c:forEach>
			                     
			                     
			                     <c:if test="${pager.groupNo < pager.totalGroupNo}">
			                     	<a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${bookInfo.book_no}&reviewPageNo=${pager.endPageNo+1}" class="btn btn-outline-info btn-sm">다음</a>
			                     </c:if>
			                     <a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${bookInfo.book_no}&reviewPageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm">맨끝</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>