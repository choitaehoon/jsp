<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
table {
	border-collapse: collapse;
}
td { padding: 5px; border: solid 1px gray; }
</style>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	<div class="container">
	<h1>request parameter</h1>
		<table class="table table bordered">
			<tr>
				<td>parameter Name</td>
				<td>parameter Value</td>
			</tr>
			<tr>
				<td>param1</td>
				<td><%= request.getParameter("param1") %></td>
			</tr>
			<tr>
				<td>param2</td>
				<td><%= request.getParameter("param2") %></td>
			</tr>
			<tr>
				<td>cmd</td>
				<td><%= request.getParameter("cmd") %></td>
			</tr>
			<tr>
				<td>method</td>
				<td><%= request.getMethod() %></td>
			</tr>
		</table>
	</div>
</body>
</html>