<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<button class="btn btn-sm" id="check" onclick="checkId()" data-toggle="modal" data-target="#myModal" style="background-color:rgb(88,39,35);color:#ffffff; margin-left:10%;">중복확인</button>	
<c:if test="${icheck}">

	<span style="font-size:6px;">이미 존재하는 아이디 입니다.</span>

</c:if>
<c:if test="${icheck != true}">

	<span style="font-size:6px;">사용 가능한 아이디 입니다.</span>

</c:if>
