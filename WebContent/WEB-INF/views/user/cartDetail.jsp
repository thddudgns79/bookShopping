<%@ page language="java" contentType="text/html; charset= UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>마이페이지 장바구니</title>
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
         
         #wrapper, #header{
            width : 1150px;
            margin : 0px auto;
         }
         /* 헤더파트 시작 */
         #search {
			text-align: center;
			vertical-align : middle;
	      }
		  .topLi{
				list-style: none;
				float: left;
				padding: 5px 15px;
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
			/* 헤더파트 끝 */
	      td {
	        text-align: center;
	      }
	      .card-header{
	         background-color:RGB(88 39 35);
	         font-weight: bold;
	      }
	      #cartList{
	      	border:none;
	      }
	      .td_middle{
	         width:430px;
	      }
	         
         img {
         	width : 75%;
         	height : 75%;
         }
         .buyButton{
         	background-color:RGB(248 249 250);
         	border-color: RGB(61 31 29);
 			color: RGB(61 31 29));
         
         }
         .buyButton:hover{
           background-color: RGB(61 31 29);
  		   color: RGB(248 249 250);
         }
         .qtyButton{
         	background-color: RGB(61 31 29);
         	color: RGB(248 249 250);
         	width: 25px; 
         }
         input[type = "checkbox"]{
         	width: 25px; 
         	height: 25px;
         }
         #totalPrice{
         	font-size: 110%;
         }
		</style>

          <script>
	       
       		   $(document).ready( function(){
       			$("input[name='checkOne']").prop("checked", true);
	             getTotalPrice();
       		   }); 
       		  
       		   //총 가격 산출
       		   function getTotalPrice(){
       			var totalPrice = 0;
	           	 $("input[name='checkOne']:checked").each(function(){
	           		 var aBookPrice = parseInt($(this).next().next().next().val());
	           		 var qty = parseInt($(this).next().next().val());
	           		 totalPrice += aBookPrice * qty;
	           	 });
	           	 $("#totalPrice").text(totalPrice);
	           	countCheckBox();
       		   }
       		   
          	
   			/* 전체 체크 or 전체 취소 */
	    	  function allCheck(){
	    		  if($("#checkAll").is(':checked')==true){
	    			  $("input[name='checkOne']").prop("checked", true);
	    		  } else{
						$("input[name='checkOne']").prop("checked", false);
					}
				getTotalPrice();
			  }
    	  	
   			/* 체크박스 개수  = 전체 체크박스 개수, 전체체크 선택 
   			체크박스 개수 < 전체 체크박스 개수, 전체체크  해제 */
   			function countCheckBox(){
   				let allLen = $("input[name='checkOne']").length;
				let checkedLen = $("input[name='checkOne']:checked").length;
   				if(allLen == checkedLen) {
   					$("#checkAll").prop("checked", true);
   				} else{
   					$("#checkAll").prop("checked", false);
   				}
   			}
   			
   			
			//+ or - 버튼 클릭시 가격 및 수량 변화
			function changeQuantity(){
				let quantity;
				let bookNo;
				if($(event.target).val() == "plus"){
					quantity  = parseInt($(event.target).next().val()) + 1 ;
					bookNo = parseInt($(event.target).next().next().val());
				} else {
					quantity  = parseInt($(event.target).prev().prev().val()) - 1 ;
					bookNo = parseInt($(event.target).prev().val());
				}
				if(1 <= quantity && quantity <= 99 ){
					var url = "" + "/shopping/controller/user/UpdateCartQtyController?bookQty=" + quantity +"&bookNo=" + bookNo;
					var checkedBoxes = $("input[name='checkOne']:checked");
					checkedBoxes.each(function(){
						url += "&checkedBookNo=" + $(this).next().val();
					});
					$.ajax({
						url: url,
						type:"get",
						success:function(result){
							$("#cartList").html(result);
							getTotalPrice();
						}
					});
				}
			
			}
			
			
			//한 책 상품 삭제
			function deleteABook(){
				/* bookno 받아오는 자리 */
				let bookno = $(event.target).val();
				console.log(bookno);
				var url = "/shopping/controller/user/DeleteACartController?bookNo="+bookno
				var checkedBoxes = $("input[name='checkOne']:checked");
				checkedBoxes.each(function(){
					url += "&checkedBookNo=" + $(this).next().val();
				});
				
				$.ajax({
					url:url,
					type:"get",
					success:function(result){
						$("#cartList").html(result);
						getTotalPrice();
					}
				});
			}
			
			//전체 삭제하기
			function entireDelete(){
					console.log("entireDelete은 실행");
				$.ajax({
					url:"/shopping/controller/user/DeleteEntireCartController",
					type:"get",
					success:function(result){
						$("#cartList").html(result);
					}
				});
			}
			
			//구매하기
			function buyCartList(){
				let url = "/shopping/controller/book/bookOrderController?";
				let checkedBox = $("input[name='checkOne']:checked");

				 if(checkedBox.length == 0){
					alert("상품을 체크해주세요.");
				}
				else{
					checkedBox.each(function(i){
						var bookNo = $(this).next().val();
						var bookQty = $(this).next().next().val();
						if(i == 0){
							url += "bookNo=" + bookNo;
					} else{
							url += "&bookNo=" + bookNo;
						}
						url += "&bookQty=" + bookQty; 
					});
					
					location.href = url;
				}
							
			}
			
			
			
      </script>

   </head>
   <body>
      
      <!-- 전체 레이아웃 -->
      <div id = "header" class="container-fluid mb-5">
			<div class="row justify-content-end">						
				<ul style="text-align:center;">
					<c:if test="${userDto == null}">
						<li class = "topLi"><a href = "${pageContext.request.contextPath}/controller/user/loginController"><span>로그인</span></a></li>
					</c:if>
					<c:if test="${userDto != null}">
						<li class = "topLi"><a href = "${pageContext.request.contextPath}/controller/user/logoutController"><span>로그아웃</span></a></li>
					</c:if>
					<li class = "topLi"><a href = "${pageContext.request.contextPath}/controller/user/signUpController"><span>회원가입</span></a></li>
					<li class = "topLi"><a href = "${pageContext.request.contextPath}/controller/qna/qnaBoardController"><span>문의게시판</span></a></li>
					<li class = "topLi"><a href = "${pageContext.request.contextPath}/controller/admin/bookCreateController"><span>상품 등록</span></a></li>
				</ul>
			</div>
			
			<div class = "row justify-content-center align-items-center">
				<div class = "col-sm-3"><a href = "${pageContext.request.contextPath}/"><img src = "${pageContext.request.contextPath}/resources/images/imageOfBook/mainLogo.png" class = "w-75 h-75"/></a></div>
				<div class = "col-sm-5"><input type="text" class="form-control" placeholder="책제목/저자명/출판사/해시태그 검색"></div>
				<div class = "col-sm-2"><button class = "btn btn-primary">검색</button></div>
				<div class = "col-sm-1 pr-0"><a href = "${pageContext.request.contextPath}/controller/user/cartDetailController"><img src = "${pageContext.request.contextPath}/resources/images/imageOfBook/장바구니.png" class = "rounded w-50 h-50"/></a></div>
				<div class = "col-sm-1 pl-0"><a href = "${pageContext.request.contextPath}/controller/user/myPageMainController"><img src = "${pageContext.request.contextPath}/resources/images/imageOfBook/마이페이지.png" class = "rounded w-50 h-50"/></a></div>
			</div>
			
		</div>
      <div id="wrapper">
         <div class="container-fluid">
            <div class="row">
               <!-- 사이드바 -->
               <div id="sideMenu" class="col-3">
                  <div class="mt-5">
                     <ul class="list-group">
                        <li class="text-center list-group-item list-group-item-action"><a href = "${pageContext.request.contextPath}/controller/user/myPageMainController" class="btn">내 프로필</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "${pageContext.request.contextPath}/controller/user/cartDetailController" class="btn">장바구니</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "${pageContext.request.contextPath}/controller/user/myLikeListController" class="btn">찜 목록</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "${pageContext.request.contextPath}/controller/user/myPageReviewListController" class="btn">리뷰 목록</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "${pageContext.request.contextPath}/controller/user/myQnaBoardController" class="btn">문의 목록</a></li>
                        <li class="text-center list-group-item list-group-item-action"><a href = "${pageContext.request.contextPath}/controller/user/myPageOrderController" class="btn">주문 내역</a></li>
                     </ul>
                  </div>
               </div>

               <!-- 메인바 -->
               <div class="col-9">
			   	<div id = "cartList" class = "card mt-5">
					<div class = "card-header container-fluid">
						<div class = "row align-items-center">
							<div class = "col-sm-1"><input id="checkAll" type = "checkbox" onclick = "allCheck()"/></div>
							<div class = "col-sm-9" style=" color: white;"><h3>장바구니(${cartListSize})</h3></div>
							<div class = "col-sm-2"><button onclick="entireDelete()" class = "btn btn-sm buyButton">전체삭제</button></div>
						</div>
					</div>
					<div class = "card-body">
						<c:forEach var = "cartBoard" items="${cartList}">
							<div class = "item row align-items-center">
								<div class = "col-sm-1">
									<input type = "checkbox" class="checkOne" name="checkOne" onclick = "getTotalPrice()"/>
		                            <input type="hidden" name="bookNo" value="${cartBoard.book_no}">
		                            <input type="hidden" name="bookQty" value="${cartBoard.cart_qty}">
		                            <input type="hidden" name="aBookPrice" value="${cartBoard.book_price}">
								</div>
								<div class = "col-sm-9">
									<div class = "container-fluid">
										<div class = "row align-items-center">
											<div class = "col-sm-4 pr-0 pl-0">
												<c:if test="${cartBoard.fileName != null}">
					                                 <p>
					                                    <span>
					                                      <img src = "${pageContext.request.contextPath}/controller/book/DownloadAttachController?reqType=1&bookNo=${cartBoard.book_no}" width = "100"/>
					                                    </span> <br/>
					                                 </p>
					                            </c:if>
											</div>
											<div class = "col-sm-8 pl-0 pr-0">
												<h6 class = "mb-3">${cartBoard.book_name}</h6>
												<div class = "mb-3"><span style = "font-size : 13px"><b>${cartBoard.book_price}</b><span>원</span></span></div>
												<div class = "btn-group mb-3">
													<div class = "btn-group mr-2 ml-3">
							                           <button class = "btn btn-sm qtyButton" onclick="changeQuantity()" value="plus">+</button>
							                           <input type="text" value = "${cartBoard.cart_qty}" readonly style="text-align:center; width :20px" class = "cartQty"/>
							                           <input type="hidden" name="bookNo" value="${cartBoard.book_no}">
							                           <button class = "btn btn-sm qtyButton" onclick="changeQuantity()" value="minus">-</button>
							                         </div>
												</div>
												<div class = "mb-3"><span style = "font-size : 16px">총 가격 : </span><span style = "font-size : 16px"><b>${cartBoard.b_c}</b><span>원</span></span></div>
											</div>
										</div>
									</div>
								</div>
								<div class = "col-sm-2" style = "align-items : center">
									<div><a class = "btn btn-sm mb-3 buyButton" href = "${pageContext.request.contextPath}/controller/book/bookOrderController?bookNo=${cartBoard.book_no}&bookQty=${cartBoard.cart_qty}">바로구매</a></div>
									<div><button onclick="deleteABook()" class = "btn btn-sm buyButton" value="${cartBoard.book_no}">삭제</button></div>
								</div>
							</div>	
							<hr/>
						</c:forEach>
						<div class = "item row align-items-center">
							<div class = "col-sm-6"></div>
							<div class = "col-sm-3">
								<span style="display: inline-block;" class = "font-weight-bold">총 금액 : </span><span id="totalPrice" class = "ml-5 font-weight-bold" ></span>
							</div>
							<div class = "col-sm-1">
								<span>원</span>
							</div>
							<div class = "col-sm-2">
								<button onclick="buyCartList()" class = "btn btn-md mb-1 buyButton" style="display:inline-block;;">주문하기</button>
							</div>
						</div>
					</div> <!-- card-body 여기서 끝남 -->
			    </div>
               </div>
            </div>
         </div>
      </div>
    
   </body>
</html>

