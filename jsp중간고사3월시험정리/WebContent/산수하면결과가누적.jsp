<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
input.form-control {
	width: 200px;
}

select.form-control {
	width: 70px;
}
</style>
</head>

<body>
	<%
		String number1 = request.getParameter("number1") == null ? "0" : request.getParameter("number1");
		String number2 = request.getParameter("number2") == null ? "0" : request.getParameter("number2");
		String number3 = request.getParameter("number3") == null ? "0" : request.getParameter("number3");
		
		int a = Integer.parseInt(number1);
		int b = Integer.parseInt(number2);
		int c = Integer.parseInt(number3);
		int sum =0;
		
		String cmd = request.getParameter("cmd") == null ? "" : request.getParameter("cmd");
		if(cmd.equals("+"))
		{
			sum = a+b;
			c += sum;
		}
		else if(cmd.equals("-"))
		{
			sum = a-b;
			c -= sum;
		}
		else if(cmd.equals("*"))
		{
			sum = a*b;
			c *= sum;
		}
		else if(cmd.equals("/"))
		{
			sum = a/b;
			c /=sum;
		}
	%>
	<div class="container">
		<form method="get">
			<h1>select 01</h1>
			<div class="form-group">
				<label>number1:</label> <input type="text" name="number1"
					class="form-control" value="<%= number1 %>" />
			</div>
			<div class="form-group">
				<label>operator:</label> <select name="cmd" class="form-control">
					<option value="+">+</option>
					<option value="-">-</option>
					<option value="*">*</option>
					<option value="/">/</option>
				</select>
			</div>
			<div class="form-group">
				<label>number2:</label> 
				<input type="text" name="number2" class="form-control" value="<%= number2 %>" />
			</div>
			
			<div class="form-group">
				<label>number3:</label>
				<input type="text" class="form-control" name="number3" value="<%= c %>">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">확인</button>
			</div>
		</form>
	</div>
</body>
</html>