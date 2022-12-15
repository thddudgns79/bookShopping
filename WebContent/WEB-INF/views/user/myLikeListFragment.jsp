<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<table class="table table-hover">
	<thead>
		<tr>
			<th><span>No.</span></th>
			<th><span style="padding: 40%;">책제목</span></th>
			<th><span style="padding: 30%;">저자</span></th>
			<th><span></span></th>
		</tr>
	</thead>
	<tbody>

		<c:forEach var="SelectDibDto" items="${pageList}">
			<tr>
				<td onclick="location.href='${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${SelectDibDto.book_no}'" style="cursor:pointer;"><a href="/shopping/controller/book/bookInfoController">${SelectDibDto.book_no}</a></td>
				<td onclick="location.href='${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${SelectDibDto.book_no}'" style="cursor:pointer;">${SelectDibDto.book_name}</td>

				<td onclick="location.href='${pageContext.request.contextPath}/controller/book/bookInfoController?bookNo=${SelectDibDto.book_no}'" style="cursor:pointer;">${SelectDibDto.author_name}
						외 ${SelectDibDto.authorList.size()-1}명</td>
				<td>
					<div>
						<button value="${SelectDibDto.book_no}"
							class="btn btn-primary btn-sm"
							style="background-color: rgb(88, 39, 35);" onclick="deleteDib()">삭제</button>
					</div>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" class="text-center">
				<div>
					<a href="myLikeListController?pageNo=1"
						class="btn btn-outline-primary btn-sm">처음</a>
					<c:if test="${pager.groupNo >1 }">
						<a href="myLikeListController?pageNo=${pager.startPageNo-1}"
							class="btn btn-outline-info btn-sm">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pager.startPageNo}"
						end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a href="myLikeListController?pageNo=${i}"
								class="btn btn-outline-success btn-sm">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a href="myLikeListController?pageNo=${i}"
								class="btn btn-danger btn-sm">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pager.groupNo < pager.totalGroupNo}">
						<a href="myLikeListController?pageNo=${pager.endPageNo+1}"
							class="btn btn-outline-info btn-sm">다음</a>
					</c:if>
					<a href="myLikeListController?pageNo=${pager.totalPageNo}"
						class="btn btn-outline-primary btn-sm">맨끝</a>
				</div>
			</td>
		</tr>

	</tbody>
</table>
