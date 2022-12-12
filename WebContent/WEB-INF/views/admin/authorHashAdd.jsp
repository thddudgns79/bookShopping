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

		</style>
		<script>
			
			function urlChange1() {
				var searchWord = $("#searchBox").val();
				var url = "${pageContext.request.contextPath}/controller/admin/authorListController?searchWord=" + searchWord;
				$("#searchButton").attr("href", url);
			}
			
			function urlChange2() {
				var hashString = $("#hashBox").val();
				var url = "${pageContext.request.contextPath}/controller/admin/hashTagAddController?hashString=" + hashString;
				$("#insertHashButton").attr("href", url);
			}
			
			
			
		</script>
	</head>
	<body>
		<div id = "wrapper" class = "container-fluid">
			<div class="card m-2">
			   <div class="card-header">
			     	 <span style = "font-size : 25px" class = "font-weight-bold mr-3">저자 추가 / 해시태그 추가</span>
			   </div>
			   <div class="card-body">   
			  	 <div class = "mb-5">
			  	 	<div><a href = "/shopping" class = "btn btn-info mb-5">메인페이지로 이동</a></div>
			   	 	<h4 class = "mb-3 font-weight-bold">해시태그 추가</h4>
			   	 	<div class = "container-fluid">
			   	 		<div class = "row">
			   	 			<div class = "col-sm-4 ml-0 p-0"><input type = "text" class="form-control mb-2" placeholder="해사태그 입력" id = "hashBox" onchange = "urlChange2()"></div>
			   	 			<div class = "col-sm-1 ml-1 p-0"><a href = "" class = "btn btn-primary" id = "insertHashButton">추가</a></div>
			   	 			<div class = "col-sm-7"></div>
			   	 		</div>
			   	 	</div>
			   		
			   		<div>
				   		<c:forEach var = "bh" items = "${bookHashList}">
				   			<a href = "${pageContext.request.contextPath}/controller/admin/hashTagPopController?hashString=${bh.hash_id}" class = "btn btn-sm btn-info"><span class = "mr-2">#${bh.hash_id}</span></a>
				   		</c:forEach>
			   		</div>
					
			   	 </div>  
			   	 <div class = "mb-5">
			   	 	<h4 class = "mb-3 font-weight-bold">저자 추가</h4>
			   		<div class = "container-fluid">
			   	 		<div class = "row">
			   	 			<div class = "col-sm-4 ml-0 p-0"><input type = "text" class="form-control mb-2" placeholder="저자명 검색" id = "searchBox" onchange = "urlChange1()"></div>
			   	 			<div class = "col-sm-1 ml-1 p-0"><a href = "" class = "btn btn-primary" id = "searchButton">검색</a></div>
			   	 			<div class = "col-sm-7"></div>
			   	 		</div>
			   	 	</div>
			   		<div>
				   		<c:forEach var = "at" items = "${bookAuthorList}">
				   			<a href = "${pageContext.request.contextPath}/controller/admin/authorPopController?authorNo=${at.author_no}" class = "btn btn-sm btn-info"><span class = "mr-2">${at.author_name}</span></a>
				   		</c:forEach>
			   		</div>
					
			   	 </div>  
			      <table class="table table-sm table-bordered">
			         <thead>
			            <tr>
			               <th>저자 번호</th>
			               <th>저자 이름</th>
			            </tr>
			         </thead>
			         <tbody>
			         <c:forEach var = "author" items = "${authorList}">
				            <tr class = "authorElement">
	       		                <td id = "authorNoBox">${author.author_no}</td>
			               		<td>${author.author_name}</td>
			               		<td width = 60><a href = "${pageContext.request.contextPath}/controller/admin/authorAddController?authorNo=${author.author_no}" class = "btn btn-sm btn-primary">추가</a></td>
			            	</tr>
			         </c:forEach>
			            
			            <tr>
			               <td colspan="6" class="text-center">
			                  <div>
			                     <a href="${pageContext.request.contextPath}/controller/admin/authorListController?searchWord=${searchWord}&pageNo=1" class="btn btn-outline-primary btn-sm">처음</a>
			                     <c:if test="${pager.groupNo > 1}">
			                     	<a href="${pageContext.request.contextPath}/controller/admin/authorListController?searchWord=${searchWord}&pageNo=${pager.startPageNo-1}" class="btn btn-outline-info btn-sm">이전</a>
			                     </c:if>
			                     
			                     <c:forEach var = "i" begin = "${pager.startPageNo}" end = "${pager.endPageNo}">
				                     <c:if test="${pager.pageNo != i}">
				                     	<a href="${pageContext.request.contextPath}/controller/admin/authorListController?searchWord=${searchWord}&pageNo=${i}" class="btn btn-outline-success btn-sm">${i}</a>
				                     </c:if>
				                     <c:if test="${pager.pageNo == i}">
				                     	<a href="${pageContext.request.contextPath}/controller/admin/authorListController?searchWord=${searchWord}&pageNo=${i}" class="btn btn-outline-danger btn-sm">${i}</a>
				                     </c:if>
			                     </c:forEach>
			                     
			                     
			                     <c:if test="${pager.groupNo < pager.totalGroupNo}">
			                     	<a href="${pageContext.request.contextPath}/controller/admin/authorListController?searchWord=${searchWord}&pageNo=${pager.endPageNo+1}" class="btn btn-outline-info btn-sm">다음</a>
			                     </c:if>
			                     <a href="${pageContext.request.contextPath}/controller/admin/authorListController?searchWord=${searchWord}&pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm">맨끝</a>
			                  </div>
			               </td>
			            </tr>
			         </tbody>
			      </table>
			   </div>
			</div>
		</div>
	</body>
</html>
