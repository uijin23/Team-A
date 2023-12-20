<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@include file="../includes/header.jsp"%>
<link href="/resources/vendor/bootstrap/css/mainexam.css" rel="stylesheet">
<title>검색결과</title>

<html>
<head>
<style>
#board > li {
	padding:5px;
}
</style>
</head>
<body>
	<span id="tag">${tag}</span>
	<div style="padding: 10px">
		<h3 style="color: #0fd; text-size: 24px;display: inline;">"${searchV }"</h3>&nbsp;
		<h1 style="display: inline;">검색결과</h1>
	</div>
	
	<p style="padding: 10px">검색결과 <b>${searchResNum}</b>개를 찾았습니다.</p>
	<ul id="board" style="padding: 10px">
		<c:forEach var="res" items="${searchRes}" varStatus="status">
			<li><c:out value="${res}" /></li>
		</c:forEach>		
	</ul>
</body>
</html>