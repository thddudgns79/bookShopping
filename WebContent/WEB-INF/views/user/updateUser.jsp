<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 정보 수정</title>
	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		
		<script>
		function handleCheckData(){
			var result=false;

			//password 유효성----------------------------------
			//패스워드 검사
			var password = document.querySelector("#password");
			var passwordValue = password.value;
			var passwordPattern =  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
			var passwordTest = passwordPattern.test(passwordValue);
			if(passwordTest){
				password.classList.remove("bg-danger");
			}else{
				password.classList.add("bg-danger");
				result=false;
			}
			
			//이메일 유효성 검사
			var email = document.querySelector("#email");
			var emailValue =email.value;
			var emailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/;
			var emailTest= emailPattern.test(emailValue);
			if(emailTest){
				email.classList.remove("bg-danger");
			}else{
				email.classList.add("bg-danger");
				result=false;
			}   
			
			
			//생년월일
			var birthday = document.querySelector("#birthday");
			var birthdayValue =birthday.value;
			var birthdayPattern = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
			var birthdayTest= birthdayPattern.test(birthdayValue);
			if(birthdayTest){
				birthday.classList.remove("bg-danger");
			}else{
				birthday.classList.add("bg-danger");
				result=false;
			} 
			
			
			//성별
			

			//전화 유효성 검사
			
			var phone = document.querySelector("#phone");
			var phoneValue = phone.value;
			var phonePattern =  /^010-\d{3,4}-\d{4}$/;
			var phoneTest = phonePattern.test(phoneValue);
			if(phoneTest){
				phone.classList.remove("bg-danger");
			}else{
				phone.classList.add("bg-danger");
				result=false;
			} 
			
			return result; 
			
		}
		
		</script>
		
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
			
		}
		


		
	
		.row{
		 margin: 0 auto;
		}
		
		.card{
			width : 1150px;
		
		}
	
	</style>

<body>
	<div id="wrapper">
		<div id="d" class="container-fluid">
			<div class="d-flex flex-column">
				<div id="c" class="row justify-content-center ">
					<dlv id="교보문고로고" class="col b "> 
					<a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=1&categoryNo=1&subCategoryNo=1&pageNo=1">
					<img
						src="${pageContext.request.contextPath}/resources/images/imageOfbookList/mainLogo.png"
						width="174" height="92" /></a></dlv>
				</div>
				<div class="row">
					<div class="card">
						<div class="card-body">
							<form method="post" id="joinForm" name="joinForm" action="updateUserController"
								onsubmit="return handleCheckData()" novalidate>

								<div class="form-group">
									<label for="password">비밀번호</label> <input type="password"
										class="form-control" id="password" name="password" value="" />
									<small id="passwordHelp" class="form-text text-muted">알파벳
										대소문자, 숫자를 혼용해서 8자 이상 15장 이하</small>
								</div>

								<div class="form-group">
									<label for="name">이름</label> <input type="text"
										class="form-control" id="uname" name="uname" value="" />
								</div>

								<div class="form-group">
									<label for="email">이메일</label> <input type="email"
										class="form-control" id="email" name="email" value="" />
								</div>

								<div class="form-group">
									<label for="phone">전화번호</label> <input type="text"
										class="form-control" id="phone" name="phone" value="" /> <small
										id="phoneHelp" class="form-text text-muted">예)
										010-123-1234, 010-1234-1234</small>
								</div>


								<div class="form-group">
									<label for="adress">주소</label> <input type="text"
										class="form-control" id="uadress" name="uadress" value="" />
								</div>


								<div class="text-center">
									<input type="submit" class="btn btn-primary btn-block"
										style="background-color: rgb(88, 39, 35);" value="수정하기" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>