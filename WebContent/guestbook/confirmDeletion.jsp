<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 메세지 상태확인</title>
</head>
<body>
<form action="deleteMessage.jsp" method="post">
	<input type="hidden" name="messageId" value="${param.messageId }">
	메세지를 삭제하시려면 암호를 입력하세요:<br>
	암호:<input type="password" name="password"><br>
	<input type="submit" value="메세지 삭제하기">
</form>
</body>
</html>