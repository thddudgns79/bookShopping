<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
      <script>
            function handleCheckData(){
              let result = true;
               
               //Id 유효성 검사
               let uid = document.querySelector("#uid");
               let uidValue = uid.value;
               let uidPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,10}$/;
               let uidTest = uidPattern.test(uidValue);
               if(uidTest){
                  uid.classList.remove("bg-danger");
               }else{
                  uid.classList.add("bg-danger");
                  result = false;
               }
               //Password 유효성 검사 
               let password = document.querySelector("#password")
               let passwordValue = password.value;
                  var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/; 
                  var passwordPatternTest = passwordPattern.test(passwordValue);
                  if(passwordPatternTest) {
                     password.classList.remove("bg-danger");
                  } else {
                     password.classList.add("bg-danger");
                     result = false;
                  }
                  
              return result;
           }
        </script>
      <style>
         *{
            margin: 0px;
            padding : 0px;
            box-sizing: border-box;
         }
         
         #wrapper{
            width: 600px;
            height: 100px;
            margin: 0 auto;
            
         }
         #header{
            height:186px;
         }
         #banner{
           display:block;
            margin-top: 108px;
            height: 40px;
         }
         li {
            list-style:none;
            float: left;
            padding: 0 15px;
            width: 150px;
         }
         li::after{
            content:"|";
            float:right;
            color: gray;
            margin-right: -10px;
         }
         li:last-child::after{
            content: "";
         }
         
         #container{
            height:560px;
         }
         .login_error_wrap{
            width:528px;
            height: 55px;
         }
      
         #footer{
            height:200px;
         }
         
      </style>      
   </head>
   <body>
            <div id="wrapper" >
               <div id="header">
                  <div id="banner" class="row text-center">
                     <div class="d-flex justify-content-center">			
                     
                        <span>
                        <a href="${pageContext.request.contextPath}/controller/book/bookMainController?searchType=1&categoryNo=1&subCategoryNo=1&pageNo=1">
                        <img src="${pageContext.request.contextPath}/resources/images/imageOfBook/mainLogo.png" style="height:80px; margin-top:100px">
                        </a></span>
                     </div>
                  </div>
               </div>
               <div id="container" class="container">
                  <div id="log_in">
                      <div class="card"> 
                         <div class="card-header" style="background-color:RGB(88 39 35); color:white;"></i>ID 로그인</div>
                        
                         <div class="card-body">
                            <form method="post" id="joinForm" name="joinForm" action="${pageContext.request.contextPath}/controller/user/loginController" onsubmit="return handleCheckData()" novalidate>
                               <div>
                                 <div class="form-group">
                                     <label for="userId"></label>
                                     <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디"/>
                                  </div>
                                  <div class="form-group">
                                     <label for="userPwd"></label>
                                     <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호"/>
                                  </div>
                               </div>
                               <div class="login_error_wrap">
                                  
                               </div>
                                     
                               <div class="text-center" style="margin-top: 30px;">
                               <input type="submit" class="btn bg-secondary text-white" value="로그인" />
                               <input type="reset" class="btn bg-secondary text-white" value="회원가입" />
                               </div>
                            </form>
                         </div>
                      </div>
                   </div>
                   <div id="find_wrap" class="container mt-3">
                      <div>
                         <ul style="text-align:center;">
                        <li><a href="#">비밀번호 찾기</a></li>
                        <li><a href="#">아이디 찾기</a></li>
                        <li><a href="#">회원가입 하기</a></li>
                      </ul> 
                      </div>
                   </div>
            </div>
               <div id="footer"></div>       
            </div>         
         
   </body>
</html>