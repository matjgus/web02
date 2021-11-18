<%@page import="guestbook.service.ServiceException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="guestbook.service.DeleteMessageService" %>
<%@page import="guestbook.service.ServiceException" %>
<%
int messageId=Integer.parseInt(request.getParameter("messageId"));
String password=request.getParameter("password");
boolean invalidPassword=false;
try{
	DeleteMessageService deleteservice= DeleteMessageService.getInstance();
	deleteservice.deleteMessage(messageId, password);
} catch(ServiceException ex){
	invalidPassword=true;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(!invalidPassword){ %>
메세지를 삭제하였습니다.
<%}else{ %>
입력한 암호가 올바르지 않습니다. 암호를 확인해주세요.
<%} %>

글번호(${param.messageId})와 비밀번호(${param.password })
</body>
</html>