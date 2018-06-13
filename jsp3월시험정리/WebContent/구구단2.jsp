<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	table { border-collapse: collapse; }
	td { padding: 5px; border: solid 1px gray; }
</style>

</head>
<body>

	<table>
	<%for(int i=1; i<10; ++i) {%>
		<tr>
			<%for(int j=2; j<10; j++) {%>
				<td><%=j %> X <%=i %> = <%=j*i %></td>
			<%} %>
		</tr>
	<% } %>
	</table>
	
</body>
</html>