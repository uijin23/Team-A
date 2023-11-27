<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<ul>
	<li>GetMapping</li>
	<li><a href="http://localhost:8080/board/list">http://localhost:8080/board/list</a></li>
	<li><a href="http://localhost:8080/board/get">http://localhost:8080/get</a></li>
	<li><a href="http://localhost:8080/accessError">http://localhost:8080/accessError</a></li>
	<li><a href="http://localhost:8080/customLogout">http://localhost:8080/customLogout</a></li>
	<li><a href="http://localhost:8080/uploadForm">http://localhost:8080/uploadForm</a></li>
	<li><a href="http://localhost:8080/uploadAjax">http://localhost:8080/uploadAjax</a></li>
	<li><a href="http://localhost:8080/display">http://localhost:8080/display</a></li>	
	<li><a href="http://localhost:8080/board/register">http://localhost:8080/register</a></li>
	<li><a href="http://localhost:8080/customLogin">http://localhost:8080/customLogin</a></li>
	</br></br>
	
	<li>GetMapping value</li>
	<li><a href="http://localhost:8080/board/getAttachList">@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)</a></li>
	<li><a href="http://localhost:8080/replies/{rno}">@GetMapping(value = "/{rno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })</a></li>
	<li><a href="http://localhost:8080/replies/pages/{bno}/{page}">@GetMapping(value = "/pages/{bno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,}</a></li>
	<li><a href="http://localhost:8080/download">@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)</a></li>
	</br></br>
	
	<li>PostMapping</li>
	<li><a href="http://localhost:8080/board/register">http://localhost:8080/register</a></li>
	<li><a href="http://localhost:8080/board/remove">http://localhost:8080/remove</a></li>
	<li><a href="http://localhost:8080/uploadFormAction">http://localhost:8080/uploadFormAction</a></li>
	<li><a href="http://localhost:8080/deleteFile">http://localhost:8080/deleteFile</a></li>
	<li><a href="http://localhost:8080/board/modify">http://localhost:8080/modify</a></li>
	<li><a href="http://localhost:8080/customLogout">http://localhost:8080/customLogout</a></li>
	</br></br>
	
	<li>PostMapping value</li>
	<li><a href="http://localhost:8080/replies/new">@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })</a></li>
	<li><a href="http://localhost:8080/uploadAjaxAction">@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)</a></li>
	</br></br>
	
	<li>DeleteMapping</li>
	<li><a href="http://localhost:8080/replies/{rno}">@DeleteMapping("/{rno}")</a></li>
	</br></br>
	
</ul>
</body>
</html>