<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.ConnectionProvider" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="guestbook.dao.MessageDao" %>
<%@ page import="guestbook.model.Message" %>
<%
Connection conn=ConnectionProvider.getConnection();
MessageDao mdao=MessageDao.getInstance();
Message message=new Message();
message.setGuestName("홍길동");
message.setPassword("1234");
message.setMessage("방명록 첫번째 글 남깁니다.");
int r=mdao.insert(conn, message);
out.print("===>"+r);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>