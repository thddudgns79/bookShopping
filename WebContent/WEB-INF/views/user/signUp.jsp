<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
		
		
		<script>
			function checkId(){	
				$.ajax({
					url:'SearchUserIdController',
					type:'post',
					data: {user_id:$('#user_id').val()},
					success: function(data) {
						$("#checkUserId").html(data);
					}
				});
					
			} 
			
			function handleCheckData(){

	            var result = true;
	            
	            //Id 유효성 검사
	            var uid = $("#user_id");
	            var uidValue = uid.val();
	            var uidPattern = /^(?=.*\d)(?=.*[a-z]).{6,10}$/;
	            var uidTest = uidPattern.test(uidValue);
	            if(uidTest){
	               uid.removeClass("bg-danger");
	            }else{
	               uid.addClass("bg-danger");
	               result = false;
	            }
	            
	            
	            
	           //Password 유효성 검사 
	            var password = $("#password");
	            var passwordValue = password.val();
	               var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/; 
	               var passwordPatternTest = passwordPattern.test(passwordValue);
	               if(passwordPatternTest) {
	                  password.removeClass("bg-danger");
	               } else {
	                  password.addClass("bg-danger");
	                  result = false;
	               }

	            //Email 유효성 검사
	            var email = $("#email")
	            var emailValue = email.val();
	            var emailPattern = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	            var emailTest = emailPattern.test(emailValue);
	            if(emailTest){
	               email.removeClass("bg-danger");
	            }else{
	               email.addClass("bg-danger");
	               result = false;
	            }
	            
	          	//생년월일 유효성 검사 
	            var birth = $("#birthday");
	            var birthValue = birth.val();
               	var birthPattern = /^d{4}-\d{2}-\d{2}$/; 
           	 	var birthPatternTest = birthPattern.test(birthValue);
           	 	if( birthPatternTest) {
       	  	 		birth.removeClass("bg-danger");
           	 	} else {
           	   		birth.addClass("bg-danger");
               		result = false;
               	}
	               
	            //Phone 유효성 검사 
	            var phone = $("#phone");
	            var phoneValue = phone.val();
	               var phonePattern = /^010-\d{3,4}-\d{4}$/; 
	               var phonePatternTest = phonePattern.test(phoneValue);
	               if(phonePatternTest) {
	                  phone.removeClass("bg-danger");
	               } else {
	                  phone.addClass("bg-danger");
	                  result = false;
	               } 
	            console.log(result);
	            return result;
	         }
			
			
		
		</script>
		
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
	</head>
	
	<body>
		<div id="wrapper">
			<div class="container-fluid">
				<div class="row justify-content-center ">
					<div><img src="${pageContext.request.contextPath}/resources/images/imageOfbookList/mainLogo.png" width="174" height="92"/></div>
				</div>
				<div class="row justify-content-center mt-5">
					<form method="post" id="joinForm" name="joinForm" action="signUpController" onsubmit="return handleCheckData()" novalidate>
						<div class="card" style="width:800px;">
							<div class="card-header">
								<span>회원가입</span>
							</div>
							<div class="card-body">		
								<div class="container-fluid">
									<div class="row">
										<div class="col-3"><label for="user_id">아이디</label></div>
										<div class="col-3"><input type="text" id="user_id" name="user_id" value="Abc123"></div>
										<div class="col-5 ml-3" id="checkUserId">
											<input type="text" class="btn btn-sm" id="check" onclick="checkId()" value="중복확인" style="width:80px; background-color:rgb(88,39,35);color:#ffffff;">									
										</div>
										
									</div>
									<div class="row mt-3">
										<div class="col-3"><label for="password">비밀번호</label></div>
										<div class="col-9"><input type="password" style="width:80%;" id="password" name="password" value="Abc12345"></div>
										<span style="font-size: 8px; margin-left:37%;">알파벳 대소문자, 숫자를 혼용해서 8자 이상 15장 이하</span>
									</div>
									<div class="row mt-3">
										<div class="col-3"><label for="user_name">이름</label></div>
										<div class="col-9"><input type="text" style="width:80%;" id="user_name" name="user_name"></div>
									</div>
									<div class="row mt-3">
										<div class="col-3"><label for="email">이메일</label></div>
										<div class="col-9"><input type="text" style="width:80%;" id="email" name="email" value="Abc123@mycompany.com"></div>
									</div>
									<div class="row mt-3">
										<div class="col-3"><label for="birthday">생년월일</label></div>
										<div class="col-9"><input type="text" style="width:80%;" id="birthday" name="birthday" value="2022-01-01"></div>
									</div>
									<div class="row mt-3">
										<div class="col-3"><label>성별</label></div>
										<div class="col-9">
											<select id="sex" name="sex">
								            	<option value="male">남자</option>
								            	<option value="female">여자</option>
								            </select>
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-3"><label for="phone">전화번호</label></div>
										<div class="col-9"><input type="text" style="width:80%;" id="phone" name="phone" value="010-123-1234"></div>
									</div>
									<div class="row mt-3">
										<div class="col-3"><label for="address">주소</label></div>
										<div class="col-9"><input type="text" style="width:80%;" id="address" name="address"></div>
									</div>
								</div>			
							</div>
							<div class="card-footer">
								 <input type="submit" class="btn btn-block" style="background-color:rgb(88,39,35);color:#ffffff"  value="가입하기" />
								 
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	
	</body>
	
</html>