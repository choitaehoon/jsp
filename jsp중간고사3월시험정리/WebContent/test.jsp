<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body form label {
	margin-right: 20px;
}

table.table {
	width: 500px;
}

thead tr {
	background-color: #eee;
}
</style>
</head>
<body>
	<%
		String c1 = request.getParameter("checkbox");
		String r1 = request.getParameter("radio2");
		String r2 = request.getParameter("radio3");
	
		String checkbox = "true".equals(c1) ? "checked" : "";
		
		String radio_1 = "남".equals(r1) ? "checked" : "";
		String radio_2 = "여".equals(r1) ? "checked" : "";
		
		String radio2_1 = "A".equals(r2) ? "checked" : "";
		String radio2_2 = "B".equals(r2) ? "checked" : "";
		String radio2_3 = "AB".equals(r2) ? "checked" : "";
		String radio2_4 = "O".equals(r2) ? "checked" : "";
	%>
	<div class="container">
	<form>
	<h3>checkbox</h3>
		<div class ="checkbox">
			<label>
			<input type="checkbox" name="checkbox" value="true" <%=checkbox%>>
			동의 하십니까?
			</label>
		</div>
		<hr />
	<h3>radio - 성별은?</h3>
		<div class="radio">
			<label>
			<input type="radio" name="radio2" value="남" <%= radio_1 %>>남자<br/>
			<input type="radio" name="radio2" value="여" <%= radio_2 %>>여자
			</label>
		</div>
		<hr/>
	<h3>radio - 혈액형은?</h3>
		<div class="radio">
		<label>
			<input type="radio" name="radio3" value="A" <%= radio2_1 %>>A형<br/>
			<input type="radio" name="radio3" value="B" <%= radio2_2 %>>B형<br/>
			<input type="radio" name="radio3" value="AB" <%= radio2_3 %>>AB형<br/>
			<input type="radio" name="radio3" value="O" <%= radio2_4 %>>O형<br/>
		</label>
		</div>
	<input type ="submit" name="cmd"  class="btn btn-primary" value="확인">
	</form>
	<hr/>
	<h2>request parameter</h2>
	
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Parameter Name</th>
				<th>Parameter Value</th>
			</tr>
		</thead>
		<tr>
			<td>checkbox1</td>
			<td><%= c1 %></td>
		</tr>
		<tr>
			<td>radio1</td>
			<td><%= r1 %></td>
		</tr>
		<tr>
			<td>radio2</td>
			<td><%= r2 %></td>
		</tr>
	</table>
	</div>
</body>
</html>