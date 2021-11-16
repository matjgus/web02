<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String name=request.getParameter("name");
int age=Integer.parseInt(request.getParameter("age"));
String gender=request.getParameter("gender");
String hobby=request.getParameter("hobby");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보 페이지 입니다.</h1>

<div>
	<h1>회원 정보</h1><br>
		<p>
			<b>이름: <%=name %></b><br>
			<b>나이: <%=age %></b><br>
			<b>성별: <%=gender %></b><br>
			<b><p>취미:<%=hobby %></p></b><br>
			<b>취미는 <%
					String[] hobbys = request.getParameterValues("hobby");
					if(hobbys != null) {
						for (int i = 0; i < hobbys.length; i++) {
			%>
				<%= hobbys[i] %>
			<%
						}
					}
			%>
			</b>
	
		</p>	

</div>


</body>
</html>