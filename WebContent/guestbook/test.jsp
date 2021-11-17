<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.ConnectionProvider" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="guestbook.dao.MessageDao" %>
<%@ page import="guestbook.model.Message" %>
<%@ page import="java.util.List" %>

<%
Connection conn=ConnectionProvider.getConnection();
MessageDao mdao=MessageDao.getInstance();

/*
int r=mdao.delete(conn,2);
out.print("====>"+r);
*/

/*
List<Message> li = mdao.selectList(conn, 1, 3);
for(Message m : li){
	out.print(m.getId()+"<br>");
	out.print(m.getGuestName()+"<br>");
	out.print(m.getPassword()+"<br>");
	out.print(m.getMessage()+"<br>");
	out.print("==================<br>");
}
*/
/*
int count = mdao.selectCount(conn);
out.println("===> " + count);
*/
/*
Message message=mdao.select(conn,3);
out.print(message.getId()+"<br>");
out.print(message.getGuestName()+"<br>");
out.print(message.getPassword()+"<br>");
out.print(message.getMessage()+"<br>");
*/

/*Message message=new Message();
message.setGuestName("김철수");
message.setPassword("1234");
message.setMessage("반갑습니다.");
int r=mdao.insert(conn, message);
out.print("===>"+r); */
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