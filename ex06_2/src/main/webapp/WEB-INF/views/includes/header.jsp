<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>        
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   	<script>
    	window.onload = function() {
            document.getElementById("examBtn").onclick = function() {
                fn_spread("examRandom");
                fn_spread("examNormal");
            }
        }
        
        function fn_spread(id){
            var getID = document.getElementById(id);
            getID.style.display=(getID.style.display=='block') ? 'none' : 'block';
        }
        
        function search() {
        	if (window.event.keyCode == 13) {
        		searchWeb(document.getElementById('searchV').value);
        	}
        }
        
        function searchWeb(query) {
        	var qUrl = "http://localhost:8080/exam/serach?q="+query;
        	window.location.href = qUrl;
    	}
	</script>
</head>

<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="localhost:8080">${title}</a>
            </div>
            
            <!-- /.navbar-header -->
            <ul class="nav navbar-top-links navbar-right">
            	<c:if test="${loginStatus eq 'false'}">
	                <li class="dropdown">
	                    <a class="dropdown-toggle" data-toggle="dropdown" href="/customLogin">로그인</a>                    
	                </li>
	            </c:if>
            	<c:if test="${loginStatus eq 'true'}">
    		        <li class="dropdown">
		                <form role="form" method='post' action="/customLogout">
							<fieldset>
								<input id="logout" type="submit" value="로그아웃"/>
							</fieldset>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
	                </li>
	             </c:if>
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input id="searchV" type="text" onkeyup="search()" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                    	<li>
                            <a href="http://localhost:8080/"><i class="fa fa-dashboard fa-fw"></i>홈</a>
                        </li>
                        <li>                        
						    <button id="examBtn"><i class="fa fa-dashboard fa-fw"></i>문제출제</button>
                            <a id="examNormal" href="/exam/main" style="display: none;"><i class="fa fa-dashboard fa-fw"></i>유형문제출제</a>
                            <a id="examRandom" href="/exam/random" style="display: none;"><i class="fa fa-dashboard fa-fw"></i>랜덤문제출제</a>
                        </li>
                        <li>
                            <a href="/exam/note"><i class="fa fa-dashboard fa-fw"></i>오답노트</a>
                        </li>
                        <li>
                            <a href="/board/list"><i class="fa fa-dashboard fa-fw"></i>커뮤니티</a>
                        </li>
                        <li>
                            <a href="/board/register"><i class="fa fa-dashboard fa-fw"></i>글쓰기</a>
                        </li>
                   </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
        
       <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
       <script src="/resources/js/jquery.min.js"></script>
       