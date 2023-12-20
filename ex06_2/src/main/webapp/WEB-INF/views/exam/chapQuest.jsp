<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@include file="../includes/header.jsp"%>
<link href="/resources/vendor/bootstrap/css/mainexam.css" rel="stylesheet">
<title>문제출제</title>
<script>
	window.onload = function() {
	    document.getElementById("prev").onclick = function() { 	
	    	var testnum = Number(getQueryParam('testnum'));
	    	window.location.href = "http://localhost:8080/exam/main?testnum="+testnum;
	    }				
		
	    document.getElementById("prevQ").onclick = function() {
	    	var question = Number(getQueryParam('quest'));
	    	var testnum = Number(getQueryParam('testnum'));
			var chap = Number(getQueryParam('chap'));
	    	
	    	if (question > 1) {
				window.location.href = "http://localhost:8080/exam/main?testnum="+testnum+"&chap="+chap+"&quest="+(question-1);				
			} else {
				alert("첫 번째 문제입니다.");
			}
	    }	
	    
	    document.getElementById("nextQ").onclick = function() {
	    	var question = Number(getQueryParam('quest'));
	    	var testnum = Number(getQueryParam('testnum'));
			var chap = Number(getQueryParam('chap'));

			if (question==0) {question=1}
	    	if (question==100) {
				alert("마지막 문제입니다.")
			} else if (question <= 100) {
				window.location.href = "http://localhost:8080/exam/main?testnum="+testnum+"&chap="+chap+"&quest="+(question+1);				
			} 
	    }
	    
	    document.getElementById("a1").onclick = function() {
	    	sendAnswer(1);
	    }
	    document.getElementById("a2").onclick = function() {
	    	sendAnswer(2);
	    }
	    document.getElementById("a3").onclick = function() {
	    	sendAnswer(3);
	    }
	    document.getElementById("a4").onclick = function() {
	    	sendAnswer(4);
	    }
	}
	
	function sendAnswer(questN) {
    	var question = Number(getQueryParam('quest'));
    	var testnum = Number(getQueryParam('testnum'));
		var chap = Number(getQueryParam('chap'));
		var qUrl = "http://localhost:8080/exam/answer?testnum="+testnum+"&chap="+chap+"&quest="+question+"&questN="+questN;
		$.ajax({
	         type : "get",
	         url : qUrl,
	         success : function (answer) {
	            alert(answer);
	         },
	         error : function () {
	            alert("error!");
	         }
	     });
	}
	
	function getQueryParam(param) {
		var params = new URLSearchParams(window.location.search);
		return params.get(param);
	}
</script>

<html>
<head>
</head>
<body>
	<span id="tag">${tag}</span>
	<h1> ${questType}</h1>
	
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
	<button id="prev" value="이전으로">이전으로</button>
	<button id="prevQ" value="이전문제">이전문제</button>
	<button id="nextQ" value="다음문제">다음문제</button>
</body>
</html>