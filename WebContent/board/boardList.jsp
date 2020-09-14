<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
</head>
<body>
<div>
	<h1>방문객 목록</h1>
	<table class = "list">
		<thead>
			<th>번호</th><th>성함</th><th>메일주소</th><th>제목</th><th>내용</th><th>대여횟수</th><th>대여일</th>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
				<tr>
					<td id=num>${list.num}</td>
					<td id=name>${list.name}</td>
					<td id=email>${list.email}</td>
					<td id=title>${list.title}</td>
					<td id=content>${list.content}</td>
					<td id=readCount>${list.readCount}</td>
					<td id=writeDate>${list.writeDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<td><a href="boardWrite.do">게시글 등록</a></td>
</div>
</body>
</html>