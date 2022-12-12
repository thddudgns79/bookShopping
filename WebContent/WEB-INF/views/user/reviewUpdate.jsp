<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
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
				width : 500px;
				margin : 0px auto;
			}
			
			img {
				width : 100%;
				height : 100%;
			}
			

		</style>
	</head>
	<body>
		<div id = "wrapper">
			<div class = "font-weight-bold mt-5" style = "font-size : 30px">리뷰 수정</div>
			<div class = "mt-3 mb-3">
				<img src = "/bookShopping/imageOfbookList/책11.png" style = "width : 75px; height : 100px" class = "mr-3"/><span class = "font-weight-bold"></span>
			</div>
			<form method="post" action = "/shopping/controller/user/reviewUpdateController">
				<div class = "form-group">
					<div class = "font-weight-bold" style = "font-size : 15px">평점</div>
					<div class = "form-check-inline">
						<input type="radio" name="rating" value="1" id="1" class = "form-check-input"/><label for="1" class = "form-check-label">1점</label>
					</div>
					<div class = "form-check-inline">
						<input type="radio" name="rating" value="2" id="2" class = "form-check-input"/><label for="2" class = "form-check-label">2점</label>
					</div>
					<div class = "form-check-inline">
						<input type="radio" name="rating" value="3" id="3" class = "form-check-input"/><label for="3" class = "form-check-label">3점</label>
					</div>
					<div class = "form-check-inline">
						<input type="radio" name="rating" value="4" id="4" class = "form-check-input"/><label for="4" class = "form-check-label">4점</label>
					</div>
					<div class = "form-check-inline">
						<input type="radio" name="rating" value="5" id="5" class = "form-check-input"/><label for="5" class = "form-check-label">5점</label>
					</div>
				</div>
				<div class = "form-group">
					<label for = "reviewContent" class = "font-weight-bold" style = "font-size : 15px">리뷰 작성</label>
					<textarea class = "form-control" rows="10" id = "reviewContent" name = "reviewContent" placeholder = "내용을 10자 이상 입력해주세요."></textarea>
				</div>
				<div class = "form-group form-check">
					<input type = "checkbox" id = "spoilerCheck" name = "spoilerCheck" class = "form-check-input"/>
					<label for = "spoilerCheck" class="form-check-label">이 리뷰는 스포일러를 포함하고 있습니다.</label>
				</div>
				<button type="submit" class="btn btn-primary" style = "margin-left :200px">수정 완료</button>
			</form>
		</div>
	</body>
</html>