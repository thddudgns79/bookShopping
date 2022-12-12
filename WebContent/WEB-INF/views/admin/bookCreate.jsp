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
			
			img {
				width : 100%;
				height : 100%;
			}
		</style>
		<script>
			function getSubcategory() {
				var categoryNo = $(event.target).val();
				console.log(categoryNo);
				$.ajax({
					url: "/shopping/controller/admin/getSubCategoryController?categoryNo=" + categoryNo,
					type: "get",
					success: function(data) {
						console.log(data);
						$("#subCategory").html(data);
					}
				});
			}
			
			function handleCheckData(){

	            var result = true;
	            
	            //Id 유효성 검사
	            var bookPublishedDate = $("#bookPublishedDate");
	            var bookPublishedDateValue = bookPublishedDate.val();
	            var bookPublishedDatePattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
	            var bookPublishedDateTest = bookPublishedDatePattern.test(bookPublishedDateValue);
	            if(bookPublishedDateTest){
	            	bookPublishedDate.removeClass("bg-danger");
	            }else{
	            	bookPublishedDate.addClass("bg-danger");
	               result = false;
	            }
	            return result;
			}
			
		</script>
	</head>
	<body>
		<div id = "wrapper" class = "container-fluid">
			<div class = "row justify-content-center align-items-center">
				<div class = "card" style = "width : 75%">
					<div class = "card-header text-center">
						<span class = "font-weight-bold" style = "font-size : 20px">상품 등록(책 정보 입력)</span>
					</div>
					<form method = "post" action = "${pageContext.request.contextPath}/controller/admin/bookCreateController" onsubmit="return handleCheckData()" enctype="multipart/form-data" id = "bookInfowrite" class = "card-body container-fluid" style = "width : 75%">
						<div class = "row form-group mb-3 justify-content-center align-items-center" >
							<label for = "bookName" class = "col-sm-3 text-center">제목  </label>
							<input type = "text" class = "col-sm-9 form-control" id = "bookName" name = "bookName"/>
						</div>
						
						<div class = "row form-group mb-3 justify-content-center align-items-center">
							<label class = "col-sm-3 text-center">출판사  </label>
							<input type = "text" class = "col-sm-9 form-control" id = "bookPublisher" name = "bookPublisher"/>
						</div>
						
						<div class = "row form-group mb-3 justify-content-center align-items-center">
							<label class = "col-sm-3 text-center">소개글  </label>
							<textarea class = "col-sm-9 form-control" id = "bookIntro" name = "bookDetail"/></textarea>
						</div>
						
						<div class = "row form-group mb-3 justify-content-center align-items-center">
							<label class = "col-sm-3 text-center">가격  </label>
							<input type = "text" class = "col-sm-9 form-control" id = "bookPrice" name = "bookPrice"/>
						</div>
						
						<div class = "row form-group mb-3 justify-content-center align-items-center">
							<label class = "col-sm-3 text-center">페이지 수  </label>
							<input type = "text" class = "col-sm-9 form-control" id = "bookPage" name = "bookPage"/>
						</div>
						
						<div class = "row form-group mb-3 justify-content-center align-items-center">
							<label class = "col-sm-3 text-center">언어  </label>
							<input type = "text" class = "col-sm-9 form-control" id = "bookLang" name = "bookLang"/>
						</div>
						
						<!-- (19|20)\\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01]) -->
						<div class = "row form-group mb-3 justify-content-center align-items-center">
							<label class = "col-sm-3 text-center">출간일  </label>
							<input type = "text" class = "col-sm-9 form-control" id = "bookPublishedDate" name = "bookPublishedDate"/>
						</div>
						
						<div class="form-group">
				            <label for="battach">Attach</label> 
				            <input type="file" class="form-control" id="battach" name="battach"> 
				        </div>
						<div class = "row form-group mb-3 justify-content-center align-items-center">
							<div class = "col-sm-4 text-center"><span>카테고리/서브카테고리</span></div>
							<div class = "col-sm-3 pl-0">
								<select id = "category" name = "category" class = "text-center form-control" onchange = "getSubcategory()">
									 <c:forEach var = "category" items = "${categoryList}">
										<option value="${category.category_no}" class = "text-center">${category.category_name}</option>
									</c:forEach> 
								</select>
							</div>
							
							<div class = "col-sm-3 pl-0 pr-0">
								<select id = "subCategory" name = "subNo" class = "text-center form-control">
								</select>
							</div>
							<div class = "col-sm-2">
								<button type = "submit" class = "btn btn-sm btn-primary">상품등록</button>
							</div>
						</div>
					</form>
				</div>	
			</div>
		</div>
	</body>
</html>