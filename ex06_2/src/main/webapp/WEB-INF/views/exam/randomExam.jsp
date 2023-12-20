<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@include file="../includes/header.jsp"%>
<link href="/resources/vendor/bootstrap/css/mainexam.css" rel="stylesheet">
<title>랜덤문제출제</title>

<html>
<head>
</head>
<body>
	<span id="tag">${tag}</span>
	<h1>랜덤문제출제</h1>	
	<ul id="board">
		<li>
			<a href="main?testnum=20220424">정보처리기사 2022년 04월 24일 </a>
		</li>
	</ul>
</body>
</html>