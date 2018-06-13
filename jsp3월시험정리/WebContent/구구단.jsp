<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

</head>
<body>

	<%
		int count=1;
	%>
	
	<table border=1>
	<% for(int i=0; i<2; ++i) {%>
		<tr>
			<% for (int j=1; j<5; ++j){ %>
				<td>4 X <%= count %> = <%= count++*4 %> </td>
			<%} %>
		</tr>	
	<%} %>
	</table>
	
</body>
</html>