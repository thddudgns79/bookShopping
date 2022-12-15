<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<c:if test="${result eq '재고 부족'}">
							<div style="font-weight: bold;"> 현재 재고부족으로 주문이 불가능합니다. 이용에 불편을 드려 죄송합니다.</div>
						</c:if>
						<c:if test="${result eq '잔액 부족'}">
							<div style="font-weight: bold;"> 잔액이 부족하여 주문이 불가능합니다. 충전 후 이용해 주시길 바랍니다. 감사합니다.</div>
						</c:if>
						
						
						<div>
							<a class="btn btn-sm" style="margin:auto; display:block;" href="${pageContext.request.contextPath}">메인페이지 가기</a>
						</div>
					
					</div>
				</div>			
			</div>
		</div>
	</body>
</html>