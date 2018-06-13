<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

</head>
<body>
	<%
		String[] s = {"호날두","최태훈","메시","다비드실바","살라"};
		int [] a = {30,24,31,28,23};
	%>
	
	<table border=1>
		<tr>
				<td rowspan="6">소프트웨어공학과</td>
				<td>이름</td>
				<td>학번</td>
		</tr>
		
		<% for(int i=0; i<5; ++i){%> 
			<tr>
				<td><%=s[i] %></td>
				<td><%=a[i] %></td>
			</tr>
		<%} %>
	</table>
	
</body>
</html>

