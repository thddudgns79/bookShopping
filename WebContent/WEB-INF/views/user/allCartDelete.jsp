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
							<div class = "item row align-items-center">
								<div class = "col-sm-1"></div>
								<div class = "col-sm-9">
									<div class = "container-fluid">
										<div class = "row align-items-center">
											<b  style="text-align: center; color:gray; margin-left: 35%;">장바구니에 담긴 상품이 없습니다.</b>
										</div>
									</div>
								</div>
								<div class = "col-sm-2" style = "align-items : center"></div>
							</div>	
							<hr/>
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