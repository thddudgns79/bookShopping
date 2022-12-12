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
		

	
		
		.text{
		 font-size: 20px;
		
		}
		.text1{
		 font-size: 20px;
		 font-weight: 1000;
		}
		
		.text2{
		 font-size: 40px;
		 font-weight: 1000;
		}
		
		.text3{
		 font-size: 30px;
		 font-weight: 1000;
		}

		.ordertext{
		 font-size: 20px;
		 font-weight: 1000;
		}
		
		.ordertext2{
		
		 text-align: right;
		 font-size: 15px;
		 font-weight: 1000;
		}

		.buttombox{
			border: 1px solid black;
		}
		
		#box{
			height:10%
		}
		#button{
		text-align: center;
		}
		hr{
		background-color:rgb(88,39,35);
		
		}
		
	</style>
	<body>
		<div id="wrapper">
			<div id=one class="container-fluid">
				<div class="row justify-content-center">
					<img src="${pageContext.request.contextPath}/resources/images/imageOfBook/mainLogo.png"/>
				</div>
				<div class="row mx-2">
					<div class="col-3 mt-3" >
						<span style="font-size:23px; font-weight:bold;">주문/결제</span>
					</div>
					
					<div class="col-9 d-flex justify-content-end mt-4 ">
						<span style="font-size:15px; font-weight:bold;"> 장바구니 > 주문/결제 > 완료</span>
					</div>
				</div>
				<hr/>
		
				<div id= two class="row">
					<dlv id=two1 class="col-9">
						<div class="d-flex flex-column">
						   <div class="card">
				 				<div class="card-body">
					 				<form method="post" id="joinForm" name="joinForm" action="${pageContext.request.contextPath}/controller/book/bookOrderController" >
		       						 	<div class="form-group">
							           		<label for="name">수령인 이름</label>
							            	<input type="text" class="form-control" id="uname" name="orderReceiveName" placeholder="홍길동"/>
		       							</div>
			       							 
								        <div class="form-group">
								            <label for="phone">전화번호</label>
								            <input type="text" class="form-control" id="phone" name="orderTel" placeholder="010-1234-1234"/>
								            <small id="phoneHelp" class="form-text text-muted"></small>
								        </div>
								            
								        <div class="form-group">
								            <label for="adress">배송 주소</label>
								            <input type="text" class="form-control" id="uadress" name="orderAddress"/>
		       							</div>
			       							 
								        <div class="form-group">
								            <label for="adress">배송 메모</label>
								            <input type="text" class="form-control" id="uadress" name="orderMemo" placeholder="문앞에 놔주세요."/>
		       							</div>
		       							<div class="text-center"> 
									    	<input type="submit" class="btn btn-primary" style="background-color:rgb(88,39,35);"  value="주문하기" />
										</div>
						            </form>
							 	</div>	
							</div>
						</div>
					</dlv>
					<dlv id=two1 class="col-3 mt-5">
						<div class="card">
				 			<div class="card-body">
								<div>
									<span style="font-size:17px; font-weight:bold;">상품 총 금액 :</span>
									<span style="font-size:17px;">${totalPrice}</span>
									<hr/>
									<div><span style="font-size:17px; ">약관동의</span>
									<hr/>
										<div id="div1">
						       	 			<p><input type="checkbox"  name="agree" value="age"/>만 14세 이상입니다</p>
						       	 			<p><input type="checkbox"  name="agree" value="use"/>이용약관</p>
						       	 			<p><input type="checkbox"  name="agree" value="Marketing"/>마케팅동의</p>
						       	 		</div>
									</div>
								</div>
							</div>
						</div>
					</dlv>
				</div>
			</div>
		</div>
	</body>
</html>