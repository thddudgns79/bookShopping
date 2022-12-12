<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>마이페이지</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
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
        td {
	        text-align: center;
	      }
	      .card-header{
	         background-color: RGB(61 31 29);
	         font-weight: bold;
	         color: white;
	      }
	      .td_middle{
	         width:430px;
	      }
	      
	      /* header 만들기 */
    	 #search {
			text-align: center;
			vertical-align : middle;
		}
			
		.topLi{
				list-style: none;
				float: left;
				padding:5px 15px;
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
      </style>
      
   </head>
   
   <body>
      
      <!-- 전체 레이아웃 -->
       <div id = "header" class="container-fluid">
		<div class="row justify-content-end">				
			<div>
				<ul>
					<li class = "topLi"><a href = "/shopping/controller/user/loginController">로그인</a></li>
					<li class = "topLi"><a href = "/shopping/controller/user/signUpController">회원가입</a></li>
					<li class = "topLi"><a href = "/shopping/controller/qna/qnaBoardController">문의게시판</a></li>
				</ul>
			</div>
		</div>
		
		<div class = "row justify-content-center align-items-center">
<<<<<<< HEAD
			<div class = "col-sm-3"><a href = "${pageContext.request.contextPath}/controller/book/bookMainController?searchType=1&categoryNo=1&subCategoryNo=1&pageNo=1"><img src = "${pageContext.request.contextPath}/resources/images/imageOfbookList/mainLogo.png" class = "w-75 h-75"/></a></div>
=======
			<div class = "col-sm-3"><a href = "#"><img src = "/shopping/resources/images/imageOfbookList/mainLogo.png" class = "w-75 h-75"/></a></div>
>>>>>>> branch 'master' of https://github.com/thddudgns79/newBookShopping.git
			<div class = "col-sm-5"><input type="text" class="form-control" placeholder="책제목/저자명/출판사/해시태그 검색"></div>
			<div class = "col-sm-2"><button class = "btn btn-primary">검색</button></div>
			<div class = "col-sm-1 pr-0"><a href = "/shopping/controller/user/cartDetailController"><img src = "/shopping/resources/images/imageOfbookList/장바구니.png" class = "rounded w-50 h-50"/></a></div>
			<div class = "col-sm-1 pl-0"><a href = "/shopping/controller/user/myPageMainController"><img src = "/shopping/resources/images/imageOfbookList/마이페이지.png" class = "rounded w-50 h-50"/></a></div>
		</div>
			
	  </div>
      <div id="wrapper">
         <div class="container-fluid">
            <div class="row border">
               <!-- 사이드바 -->
               <div id="sideMenu" class="col-3">
                  <div class="mt-5">
                     <ul class="list-group">
                        <li class="text-center list-group-item list-group-item-action"><a href = "/shopping/controller/user/myPageMainController" class="btn">내 프로필</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "/shopping/controller/user/cartDetailController" class="btn">장바구니</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "/shopping/controller/user/myLikeListController" class="btn">찜 목록</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "/shopping/controller/user/myPageReviewListController" class="btn">리뷰 목록</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "/shopping/controller/user/myQnaBoardController" class="btn">문의 목록</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "/shopping/controller/user/myPageOrderController" class="btn">주문 내역</a></li>
                     </ul>
                  </div>
               </div>
               <!-- 메인바 -->
               <div class="col-9">
                  <div class="container">
                     <div class="card mt-5" style="width:650px;">
                   <div class="row card-header  mx-auto" style="width: 648px;">
                   	  <div class="col-10">
	                      <h5>기본정보</h5>
                   	  </div>
                   	  <div class="col-2">
	                      <td><a class="btn btn-warning btn-sm" href="/shopping/controller/user/updateUserController">수정</a></td>
                   	  </div>
                   </div>
                   <div class="card-body -0">
                      <table class="table">
                         <tbody>
                           <tr>
                             <td>아이디</td>
                             <td class="td_middle">${user.user_id}</td>
                           </tr>
                           <tr>
                             <td>이름</td>
                             <td class="td_middle">${user1.user_name}</td>
                           </tr>
                           <tr>
                             <td>이메일</td>
                             <td class="td_middle">${user1.user_email}</td>
                           </tr>
                           <tr>
                             <td>생년월일</td>
                             <td class="td_middle">${user.user_birth}</td>
                             <td> </td>
                           </tr>
                           <tr>
                             <td>성별</td>
                             <td class="td_middle">${user.user_gender}</td>
                             <td> </td>
                           </tr>
                           <tr>
                             <td>전화번호</td>
                             <td class="td_middle">${user1.user_tel}</td>
                             <td> </td>
                           </tr>
                           <tr>
                             <td>가입정보</td>
                             <td class="td_middle">${user.user_date}</td>
                             <td> </td>
                           </tr>
                         </tbody>
                       </table>
                   </div> 
               </div>
               
               <div class="card mt-5" style="width:650px;">
                  <div class="card-header">
                     <h5>배송 주소 & 충전</h5>
                  </div>
                  <div class="card-body">
                     <table class="table">
                        <tbody>
                           <tr>
                              <td>주소</td>
                              <td class="td_middle">${user1.user_address}</td>
                           </tr>                     
                           <tr>
                              <td>보유 금액</td>
                              <td class="td_middle">${user.user_money}</td>
                                  <td><button class="btn btn-success btn-sm">충전</button></td>                           
                           </tr>                                          
                        </tbody>
                     </table>
                  </div>
               </div>
                   <div>
                      <button class="btn btn-secondary btn-sm text-white" style="margin-left: 90%;">회원 탈퇴</button>
                   </div>     
                        
                  </div>
               </div>
            </div>
         </div>
      </div>
      
   </body>
</html>