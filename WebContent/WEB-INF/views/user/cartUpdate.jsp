<%@ page language="java" contentType="text/html; charset= UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
									<c:if test="${cartBoard.checked}">
									<input type = "checkbox" class="checkOne" name="checkOne" onclick = "getTotalPrice()" checked/>
									</c:if>
									<c:if test="${!cartBoard.checked}">
									<input type = "checkbox" class="checkOne" name="checkOne" onclick = "getTotalPrice()" />
									</c:if>
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
					</div>