<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%
Class.forName("org.mariadb.jdbc.Driver");
out.print("드라이버 로딩성공");
String url="jdbc:mysql://localhost:3307/javadb";
String user="root";
String pass="123456";
Connection conn = DriverManager.getConnection(url, user, pass);
out.print("=====>"+conn);
String query="select * from member";
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(query);
while(rs.next()){
	String memberid = rs.getString(1);
	String password = rs.getString(2);
	String name = rs.getString(3);
	String email = rs.getString(4);
	out.print("<BR>" +memberid+" : "+password +" : "+name+":"+email);
}
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