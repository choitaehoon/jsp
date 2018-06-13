<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css">
<style>
table {
	border-collapse: collapse;
}

td {
	padding: 5px;
	border: solid 1px gray;
}
</style>
</head>
<body>
	<div class="container">
		<% request.setCharacterEncoding("EUC-KR");%>
		<form action="jsp3_text3.jsp">
			<h3>텍스트 입력폼 03</h3>
			<div class="form-group">
				<label>text1:</label> <input type="text" class="form-control"
					name="text1" value="hello" />
			</div>
			<div class="form-group">
				<label>text2:</label> <input type="text" class="form-control"
					name="text2" value="world" />
			</div>
			<div class="form-group">
				<label>time:</label> <input type="text" class="form-control"
					name="time"
					value='<%=new SimpleDateFormat("HH:mm:ss").format(new Date())%>' />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary" name="cmd" value="확인">
			</div>
		</form>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Parameter Name</th>
					<th>Parameter Value</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>text1</td>
					<td><%=request.getParameter("text1") == null ? "값 있다1 " : request.getParameter("text1") %></td>
				</tr>
				<tr>
					<td>text2</td>
					<td><%=request.getParameter("text2") == null ? "값 있다2"  : request.getParameter("text2") %></td>
				</tr>
				<tr>
					<td>time</td>
					<td><%=request.getParameter("time")%></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>