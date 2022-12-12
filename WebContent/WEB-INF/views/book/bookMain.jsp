<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
     
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<!-- jQuery library -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
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
			
			#wrapper, #header{
				width : 1150px;
				margin : 0px auto;
			}
			
			img {
				width : 100%;
				height : 100%;
			}
			#search {
				text-align: center;
				vertical-align : middle;
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
			/* 사이드바 만들기 시작 */
			
			.bestSellerItems {
				border : 1px solid gray;
				border-radius: 25px;
			}
			
			.sidenav{
				padding-top: 20px;
				height: 100%;
			}
			.sidenav a, .dropdown-btn{
				padding: 6px 8px 6px 16px;
				font-size: 20px;
				color: #818181;
				display: block;
				border: none;
				background: none;
				width:100%;
				text-align: center;
				cursor: pointer;
				outline: none;    
			}
			.dropdown-btn{
				border: 2px solid #ffffff;
				border-radius: 8px;
				border-color: RGB(61 31 29);
			}
			.sidenav a:hover, .dropdown-btn:hover{
				color: RGB(88 39 35);
			}
			.dropdown-container a:hover{
				background-color: RGB(252 244 224);
			}
			.dropdown-container{
				display: none;
			}
			/* 사이드바 만들기 끝 */
			
		</style>
		<script>
		
		$(function(){
			$(".dropdown-btn").click(function(){
				$(this).next().toggle();
				
				if($(this).next().css("display") == "none"){
					$(this).css({"background-color":"white",
						"color":""});
				}else{
					$(this).css({"background-color":"RGB(61 31 29)",
						"color":"white"});
				}
			});
		});
		
		function urlChange() {
			var searchWord = $("#searchBox").val();
			var url = "${pageContext.request.contextPath}/controller/book/bookMainController?searchType=2&searchWord=" + searchWord;
			$("#searchButton").attr("href", url);
		}
		
		
		

	
		</script>
	</head>

	<body>
		<div id = "header" class="container-fluid">
			<div class="row justify-content-end">						
				<ul style="text-align:center;">
					<c:if test="${userDto == null}">
						<li class = "topLi"><a href = "${pageContext.request.contextPath}/controller/user/loginController"><span>로그인</span></a></li>
					</c:if>
					<c:if test="${userDto != null}">
						<li class = "topLi"><a href = "${pageContext.request.contextPath}/controller/user/logoutController"><span>로그아웃</span></a></li>
					</c:if>
					<li class = "topLi"><a href = "${pageContext.request.contextPath}/controller/user/signUpController"><span>회원가입</span></a></li>
					<li class = "topLi"><a href = "${pageContext.request.contextPath}/controller/qna/qnaBoardController"><span>문의게시판</span></a></li>
					<li class = "topLi"><a href = "${pageContext.request.contextPath}/controller/admin/bookCreateController"><span>상품 등록</span></a></li>
				</ul>
				
			</div>
			
			<div class = "row justify-content-center align-items-center">
				<div class = "col-sm-3"><a href = "#"><img src = "${pageContext.request.contextPath}/resources/images/imageOfBook/mainLogo.png" class = "w-75 h-75"/></a></div>
				<div class = "col-sm-5"><input type="text" class="form-control" placeholder="책제목/저자명/출판사/해시태그 검색" id = "searchBox" onchange = "urlChange()"></div>
				<div class = "col-sm-2"><a href = "" class = "btn btn-primary" id = "searchButton">검색</a></div>
				<div class = "col-sm-1 pr-0"><a href = "${pageContext.request.contextPath}/controller/user/cartDetailController"><img src = "${pageContext.request.contextPath}/resources/images/imageOfBook/장바구니.png" class = "rounded w-50 h-50"/></a></div>
				<div class = "col-sm-1 pl-0"><a href = "${pageContext.request.contextPath}/controller/user/myPageMainController"><img src = "${pageContext.request.contextPath}/resources/images/imageOfBook/마이페이지.png" class = "rounded w-50 h-50"/></a></div>
			</div>
			
		</div>
		<div id = "wrapper">
			<div class = "container-fluid">
				<div class = "row justify-content-center">
				<!-- 카테고리, 서브카테고리 목록 -->
					<div class = "col-sm-3 sidenav sticky-top">
						<c:forEach var="i" items="${categoryMap}"> 
							<button class="dropdown-btn">${i.key.category_name} </button>
							<div class="dropdown-container">
								<c:forEach var="j" items="${i.value}"> 
									<a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=1&pageNo=1&categoryNo=${i.key.category_no}&subCategoryNo=${j.sub_no}">${j.sub_name}</a>
						   	 	</c:forEach>
							</div>
						</c:forEach> 
					</div>
					
					<div class = "col-sm-9 container-fluid p-0">
						<c:if test="${fn:length(weekBestSeller) > 0}">
						<div class = "font-weight-bold text-center mb-5" style = "font-size : 20px">주간 베스트셀러</div>
						<div class = "row mb-5" id = "weekBestSellerItems">
							<div class = "col-1"></div>
							<c:forEach var="i" items="${weekBestSeller}"> 
								<div class = "col-2">
									<div>
										 <c:if test="${i.fileName != null}">
							               	<p>
							               		<span>
							               			<a href = "${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${i.book_no}">
							               			<img src = "DownloadAttachController?reqType=1&bookNo=${i.book_no}" width = "100"/></a>
							               		</span> <br/>
							               	</p>
							              </c:if>
									</div>
									<div>
										<a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${i.book_no}" class="text-dark">
											<h6><b>${i.book_name}</b></h6>
										</a>
									</div>
								</div>
							</c:forEach>
							<div class = "col-1"></div>
						</div>
						</c:if>
						<c:if test="${userDto != null}">
							<div class = "font-weight-bold text-center mb-5" style = "font-size : 20px">${userDto.user_id}님 맞춤 베스트셀러</div>
							<div class = "row mb-5" id = "userBestSeller">
							<div class = "col-1"></div>
							<c:forEach var="i" items="${userBestSeller}"> 
								<div class = "col-2">
									<div>
										 <c:if test="${i.fileName != null}">
							               	<p>
							               		<span>
							               			<a href = "${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${i.book_no}">
							               			<img src = "DownloadAttachController?reqType=1&bookNo=${i.book_no}" width = "100"/></a>
							               		</span> <br/>
							               	</p>
							              </c:if>
									</div>
									<div>
										<a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${i.book_no}" class="text-dark">
											<h6><b>${i.book_name}</b></h6>
										</a>
									</div>
								</div>
							</c:forEach>
							<div class = "col-1"></div>
						</div>
						</c:if>
						
						<div class = "font-weight-bold text-center mb-5" style = "font-size : 20px">신간 베스트셀러</div>
						<div class = "row mb-5" id = "newBestSeller">
							<div class = "col-1"></div>
							<c:forEach var="i" items="${newBestSeller}"> 
								<div class = "col-2">
									<div>
										 <c:if test="${i.fileName != null}">
							               	<p>
							               		<span>
							               			<a href = "${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${i.book_no}">
							               			<img src = "DownloadAttachController?reqType=1&bookNo=${i.book_no}" width = "100"/></a>
							               		</span> <br/>
							               	</p>
							              </c:if>
									</div>
									<div>
										<a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${i.book_no}" class="text-dark">
											<h6><b>${i.book_name}</b></h6>
										</a>
									</div>
								</div>
							</c:forEach>							
							<div class = "col-1"></div>
						</div>
						
						<c:forEach var="i" items="${bookList}"  varStatus="status">  
						  	<div class="row align-items-center">
	                           
		                        <div class="col-3 border">
		                           <c:if test="${i.fileName != null}">
						               	<p>
						               		<span>
						               			<a href = "${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${i.book_no}">
						               			<img src = "DownloadAttachController?reqType=1&bookNo=${i.book_no}" width = "100"/></a>
						               		</span> <br/>
						               	</p>
					              </c:if>
		                        </div>
	                        
		                        <div class="col-9 mt-5">
		                           <div>
		                          	 <a href="${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${i.book_no}" class="text-dark">
		                           		<h4><b>${i.book_name}</b></h4>
		                           	 </a>
		                           </div>
		                           <div><span style="font-size:13px;"> 
		                          	<c:forEach var = "author" items = "${i.authorList}" varStatus="status2">
		                           	<c:if test="${!status2.last}">
		                           		${author.author_name} ·
		                           	</c:if>
		                           	<c:if test="${status2.last}">
		                           		${author.author_name}
		                           	</c:if>
		                           </c:forEach> 
		                           / ${i.book_publisher} / ${i.book_date} 출시</span></div>
		                           <div>
		                              <span style="font-size:13px; color:green;"><b>10%</b></span>
		                              <span style="font-size:13px;"><b>${i.book_price * 0.9}원</b></span>
		                              <span style="font-size:11px;"><del>${i.book_price}원</del></span>
		                           </div>
		                           <div>
		                              <span style="font-size:13px;">${bookDetailList[status.index]}</span>
		                           </div>
		                           <div>
		                              <span style="font-size:13px;">리뷰 평점 : ${i.reviews_avg}점</span>
		                           </div>
		                           <div>
		                           	  <c:forEach items = "${i.hashList}" var = "hashTag">
		                           	  	 <span style="font-size:13px;" class = "font-weight-bold">#${hashTag.hash_id}</span>
		                           	  </c:forEach>
		                           </div>
		                        </div>
							 </div>
		                     <hr/>
						</c:forEach>
					
	                    <div id = "pagerBar" style = "text-align : center">
	                    	<c:if test="${searchType == 1}">
	                    		  <a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=1&categoryNo=${categoryNo}&subCategoryNo=${subCategoryNo}&pageNo=1" class="btn btn-outline-primary btn-sm">처음</a>
	                    	</c:if>
	                    	<c:if test="${searchType == 2}">
	                    		  <a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=2&searchWord=${searchWord}&pageNo=1" class="btn btn-outline-primary btn-sm">처음</a>
	                    	</c:if>
		                   
		                     <c:if test="${pager.groupNo > 1}">
		                     	<c:if test="${searchType == 1}">
	                    		  <a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=1&categoryNo=${categoryNo}&subCategoryNo=${subCategoryNo}&pageNo=${pager.startPageNo-1}" class="btn btn-outline-primary btn-sm">이전</a>
		                    	</c:if>
		                    	<c:if test="${searchType == 2}">
		                    		  <a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=2&searchWord=${searchWord}&pageNo=${pager.startPageNo-1}" class="btn btn-outline-primary btn-sm">이전</a>
		                    	</c:if>
		                     </c:if>
		                     
		                     <c:forEach var = "i" begin = "${pager.startPageNo}" end = "${pager.endPageNo}">
		                     
			                     <c:if test="${pager.pageNo != i}">
			                     	<c:if test="${searchType == 1}">
	                    		  		<a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=1&categoryNo=${categoryNo}&subCategoryNo=${subCategoryNo}&pageNo=${i}" class="btn btn-outline-success btn-sm">${i}</a>
			                    	</c:if>
			                    	<c:if test="${searchType == 2}">
		                    		 	<a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=2&searchWord=${searchWord}&pageNo=${i}" class="btn btn-outline-success btn-sm">${i}</a>
			                    	</c:if>
			                     </c:if>
			                     
			                     <c:if test="${pager.pageNo == i}">
			                     	<c:if test="${searchType == 1}">
	                    		  		<a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=1&categoryNo=${categoryNo}&subCategoryNo=${subCategoryNo}&pageNo=${i}" class="btn btn-outline-danger btn-sm">${i}</a>
			                    	</c:if>
			                    	<c:if test="${searchType == 2}">
		                    		 	<a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=2&searchWord=${searchWord}&pageNo=${i}" class="btn btn-outline-danger btn-sm">${i}</a>
			                    	</c:if>
			                     </c:if>
			                     
		                     </c:forEach>
		                     
		                     
		                     <c:if test="${pager.groupNo < pager.totalGroupNo}">
		                     	<c:if test="${searchType == 1}">
	                    		  <a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=1&categoryNo=${categoryNo}&subCategoryNo=${subCategoryNo}&pageNo=${pager.endPageNo+1}" class="btn btn-outline-info btn-sm">다음</a>
		                    	</c:if>
		                    	<c:if test="${searchType == 2}">
		                    		  <a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=2&searchWord=${searchWord}&pageNo=${pager.endPageNo+1}" class="btn btn-outline-info btn-sm">다음</a>
		                    	</c:if>
		                     </c:if>
		                     
		                     <c:if test="${searchType == 1}">
	                    		  <a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=1&categoryNo=${categoryNo}&subCategoryNo=${subCategoryNo}&pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm">맨끝</a>
                    		 </c:if>
                    		 <c:if test="${searchType == 2}">
                    		  <a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=2&searchWord=${searchWord}&pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm">맨끝</a>
                    		 </c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>