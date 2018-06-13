<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>

	<div class="container">
		<h1>텍스트 입력폼 01</h1>
		<form action="jsp3_text1ing.jsp" method="get">
			<h4>text1:</h4>
			<input type="text" name="param1" value="아무것이나 입력하세요1">	
			<h4>text2:</h4>
			<input type="text" name="param2" value="아무것이나 입력하세요2"><br/>
			<input type="submit" name="cmd" class="btn btn-primary" value="확인">	
			<input type="button"  class="btn btn-default" value="취소">	
		</form>
	</div>
	
</body>
</html>