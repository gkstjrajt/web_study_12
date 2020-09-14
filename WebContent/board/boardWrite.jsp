<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#add').on("click", function(){
			var newBoard = {
				name: $('#name').val(),
				pass: $('#pass').val(),
				email: $('#email').val(),
				title: $('#title').val(),
				content: $('#content').val()
			};
			$.ajax({
				type: "post",
				url: "boardWrite.do",
				cache: false,
				data: JSON.stringify(newBoard),
				complete: function(data){
					alert("추가되었습니다. > " + data);
					window.location.href="boardList.do";
				}
				
			});
		});
	});
</script>
<link rel="stylesheet" href="css/shopping.css">
</head>
<body>
<div id = "wrap" align="left">
	<h1>게시글 등록</h1>
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name = "name" id="name"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name = "pass" id="pass"></td>
			</tr>
			<tr>
				<th>메일주소</th>
				<td><input type="text" name = "email" id="email"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name = "title" id="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="80" name="content" id="content"></textarea></td>
			</tr>
		</table>
		<button id="add">등록</button>
		<input type="reset" value="다시작성">
		<input type="button" value="로비" onclick="location.href = 'boardList.do'">
</div>
</body>
</html>