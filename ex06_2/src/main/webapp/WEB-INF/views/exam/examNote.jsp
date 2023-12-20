<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@include file="../includes/header.jsp"%>
<link href="/resources/vendor/bootstrap/css/mainexam.css" rel="stylesheet">
<title>오답노트</title>

<html>
<head>
</head>
<body>
	<span id="tag">${tag}</span>
	<h1>오답노트</h1>
	<div id="blackBoard">
		<h4>${questNum}. ${quest}</h4>
      	<c:if test="${questionImg ne 'null'}">
			<img src="${questionImg}" alt="문제"/>
		</c:if>
		<ul>
			<li><button id="a1" value="1">${a1}</button></li>
			<li><button id="a2" value="2">${a2}</button></li>
			<li><button id="a3" value="3">${a3}</button></li>
			<li><button id="a4" value="4">${a4}</button></li>
		</ul>
	</div>
</body>
</html>