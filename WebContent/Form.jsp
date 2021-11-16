<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>회원 정보</h1><br>
		<p>
			<b>이름: <%=name %></b><br>
			<b>나이: <%=age %></b><br>
			<b>성별: <%=gender %></b><br>
			<b>취미: <%
						for(int i=0; i<hobbyArray.length; i++) {
							out.print(hobbyArray[i]);
							if(i!=hobbyArray.length-1) {
								out.print(",");
							} else {
								out.print(".");
							}
						}
					%>
			</b>
	
		</p>	

</div>



</body>
</html>