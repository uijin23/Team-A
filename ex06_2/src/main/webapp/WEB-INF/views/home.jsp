<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@include file="includes/header.jsp"%>
<link href="/resources/vendor/bootstrap/css/mainexam.css" rel="stylesheet">

<html>
<head>
	<title>Home</title>
</head>
<body>
	<span id="tag">${tag}</span>
	<h1>정보시스템구축및관리</h1>
	<a href="http://114.70.92.70:3000/redmine/projects/2023-a-team" target='_blank'>
		<img src="/resources/img/page.png" width="700px", height=400px/>
	</a>
	<a style="display: block" href="http://www.mokpo.ac.kr" target='_blank'>
		<img src="/resources/img/logo.png" alt="국립목표대학교" width="230px", height=60px/>
	</a>
	<P>  The time on the server is ${serverTime}. </P>
</body>
</html>