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
								<span>??????????????? ?????????????????????.</span>
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
								<span>???????????? ?????????????????????.</span>
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
								<span>?????? ??????????????? ???????????? ???????????????.</span>
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
								<span>?????? ?????? ???????????????.</span>
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
			                     <div class="ml-3 mt-1"><span style="font-size:15px;">${firstAuthor.author_name} ???  ${authorSize}???/  ${bookInfo.book_publisher} / ${bookInfo.book_date} ??????</span></div>
			                     <hr/>
			                     <div class="ml-3">
			                        <span style="font-size:13px;"><b>?????? : ${bookInfo.book_price}???</b></span>
			                     </div>
			                     <div class="ml-3">
			                        <span style="font-size:20px; color:red;"><b>????????? : ${bookInfo.book_price * 0.9}???</b></span>
			                     <span style="font-size:15px; color:red;"><b>(10% ??????)</b></span>
			                     </div>
			                     <hr/>
			                     <div class="ml-3"><span style="font-size:15px;">???????????? : ${bookInfo.book_store}???</span></div>
				                 <div class="ml-3"><span style="font-size:15px;">??? ????????? : ${bookInfo.book_page}???</span></div>
				                 <div class="ml-3"><span style="font-size:15px;">?????? : ${bookInfo.book_lang}</span></div>
				                 <hr/>
				                 <div>
									<span class = "font-weight-bolder mr-3 ml-3" style="font-size:20px">??? ?????? ??????</span>
									<span class = "font-weight-bolder" style="font-size:20px">12,420???</span>
								 </div>
								 <hr/>
								 <div class = "btn-group mr-2 ml-3">
									<button class = "btn btn-primary btn-small" onclick = "cartPlus()">+</button>
									<input type="text" value = "1" readonly style="text-align:center; width :20px" id = "cartQty"/>
									<button class = "btn btn-primary btn-small" onclick = "cartMinus()">-</button>
								 </div>
								 <a href="${pageContext.request.contextPath}/controller/book/addDibController?bookNo=${bookInfo.book_no}"  
								 class = "btn btn-primary btn-small mr-2">???</a>						
								 <a href="${pageContext.request.contextPath}/controller/book/addCartController?bookNo=${bookInfo.book_no}&bookQty=" 
								 class = "btn btn-primary btn-small mr-2" id = "addCartButton" onclick = "addCart()">???????????? ??????</a>
								 <a href="${pageContext.request.contextPath}/controller/book/bookOrderController?bookNo=${bookInfo.book_no}&bookQty=" 
								 class = "btn btn-primary btn-small mr-2" id = "orderButton" onclick = "order()">????????????</a>
				             </div>
				          </div>
			            
			            <div class = "row part">
			               <div class = "col-sm-12">
			                     <div><span><h3 class = "font-weight-bold">??? ?????????</h3></span></div>
			                     <div>
			                        <span class = "font-weight-normal" style="font-size:14px;">
			                        	${bookInfo.book_detail}
			                      </span>
			                     </div>
			                </div>
			            </div>

				
				
				
				
				<!--  ----------------------------------------------------------------------------------------  -->
				
				
				
					
					
					
					
					<!--  ?????? ?????? -->
					<div class = "row part">
						<div id = "authorList" class = "col-sm-12">
							<h3 class = "font-weight-bolder">?????? ??????</h3>
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
					
					
					
					<!--  ?????? ????????? -->
					<div class = "row part">
						<div id = "reviewList"class = "col-sm-12">
							<h3 class = "font-weight-bold">?????? ??????</h3>
							<p>
								?????? 10?????? ??????????????? ???????????? YES????????? 3????????? ????????????.<br>
								3,000??? ?????? ?????? ??? ?????? ?????? ??? ???????????? 300???, ??????????????? 600?????? YES???????????? ????????????.<br>
								(CD/LP, DVD/Blu-ray, ?????? ??? ???????????? ??????, ??????24 ???????????? ?????? ??????) 
							</p>
							<c:forEach var = "review" items = "${reviewList}">
								<div class = "review card">
									<div class = "card-header">
										<span>${review.user_id}</span> | <span>${review.review_date}</span> | <span>?????? : ${review.review_score}</span>
									</div>
									<div class = "card-body">
										<p class = "font-weight-normal" style="font-size:13px;">
											${review.review_content}
										</p>
									</div>
								</div>
							</c:forEach>
	
							<div id = "pagerBar" style = "text-align : center">
			                     <a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${bookInfo.book_no}&reviewPageNo=1" class="btn btn-outline-primary btn-sm">??????</a>
			                     <c:if test="${pager.groupNo > 1}">
			                     	<a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${bookInfo.book_no}&reviewPageNo=${pager.startPageNo-1}" class="btn btn-outline-info btn-sm">??????</a>
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
			                     	<a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${bookInfo.book_no}&reviewPageNo=${pager.endPageNo+1}" class="btn btn-outline-info btn-sm">??????</a>
			                     </c:if>
			                     <a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${bookInfo.book_no}&reviewPageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm">??????</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>