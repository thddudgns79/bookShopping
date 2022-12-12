<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<table class="table table-sm table-bordered">
	<c:forEach var="reviewDto" items="${pageList}">
		<div class="review card">
			<div class="card-header container-fluid">
				<div class="row">
					<div class="col-10">
						<a href="../book/bookInfo.html"> <span>${reviewDto.review_no}. ${reviewDto.book_name}</span></a>
		
						<!-- <span>thddudgns79</span> |  -->
						<span>${reviewDto.review_date}</span> | <span>평점 :
							${reviewDto.review_score}점</span>
					</div>
					<div>
						<a class="btn btn-primary  btn-sm mb-2 mr-3"
							style="background-color: rgb(88, 39, 35);"
							href="/shopping/controller/user/myPageReviewListController">수정</a>
					</div>
					<div>
							<button value="${reviewDto.review_no}" class="btn btn-primary btn-sm"  
							style="background-color: rgb(88, 39, 35);" 
							onclick="deleteReview()">삭제</button>
					</div>
				</div>
			</div>
			<div class="card-body">
				<p class="font-weight-normal" style="font-size: 13px;">
					${reviewDto.review_content}</p>
			</div>
		</div>
	</c:forEach>

	<tr>
		<td class="text-center">
			<div>
				<a href="myPageReviewListController?pageNo=1"
					class="btn btn-outline-primary btn-sm">처음</a>
				<c:if test="${pager.groupNo >1 }">
					<a
						href="myPageReviewListController?pageNo=${pager.startPageNo-1}"
						class="btn btn-outline-info btn-sm">이전</a>
				</c:if>
				<c:forEach var="i" begin="${pager.startPageNo}"
					end="${pager.endPageNo}">
					<c:if test="${pager.pageNo != i}">
						<a href="myPageReviewListController?pageNo=${i}"
							class="btn btn-outline-success btn-sm">${i}</a>
					</c:if>
					<c:if test="${pager.pageNo == i}">
						<a href="myPageReviewListController?pageNo=${i}"
							class="btn btn-danger btn-sm">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${pager.groupNo < pager.totalGroupNo}">
					<a
						href="myPageReviewListController?pageNo=${pager.endPageNo+1}"
						class="btn btn-outline-info btn-sm">다음</a>
				</c:if>
				<a
					href="myPageReviewListController?pageNo=${pager.totalPageNo}"
					class="btn btn-outline-primary btn-sm">맨끝</a>
			</div>
		</td>
	</tr>
</table>
						