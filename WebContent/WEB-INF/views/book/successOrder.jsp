<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문페이지</title>
	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
	</head>
	<style>
		*{
			padding : 0px;
			margin : 0px;
			box-sizing: border-box;
		}
		
		#wrapper{
			width : 1150px;
			margin : 0px auto;
			border-style: outset;
			
		}
		

		
	</style>
	<body>
		<div id="wrapper">
			<div class="container">
				<h2>실행 결과 </h2>
				<div class="card">
					<div class="card-body">
						<div style="font-weight: bold;">주문이 완료되었습니다. 이용해 주셔서 감사합니다.</div>
						<div>
							<a class="btn btn-sm" style="margin:auto; display:block;" href="${pageContext.request.contextPath}">메인페이지 가기</a>
						</div>
					
					</div>
				</div>			
			</div>
		</div>
	</body>
</html>