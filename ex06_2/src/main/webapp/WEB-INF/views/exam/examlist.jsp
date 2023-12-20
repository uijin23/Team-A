<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@include file="../includes/header.jsp"%>
<link href="/resources/vendor/bootstrap/css/mainexam.css" rel="stylesheet">
<title>문제출제</title>

<html>
<head>
</head>
<body>
	<span id="tag">${testnumtag}</span>
	<h1>문제출제</h1>
	
	<ul id="board">
		<li>
			<a href="/exam/main?testnum=${testnum}&chap=1">1.소프트웨어 설계</a>
		</li>
		<li>
			<a href="/exam/main?testnum=${testnum}&chap=2&quest=21">2.소프트웨어 개발</a>
		</li>
		<li>
			<a href="/exam/main?testnum=${testnum}&chap=3&quest=41">3.데이터베이스 구축</a>
		</li>
		<li>
			<a href="/exam/main?testnum=${testnum}&chap=4&quest=61">4.프로그래밍 언어 활용</a>
		</li>
		<li>
			<a href="/exam/main?testnum=${testnum}&chap=5&quest=81">5.정보시스템 구축관리</a>
		</li>				
	</ul>
	
</body>
</html>