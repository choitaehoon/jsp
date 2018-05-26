<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, exam.*"%>
<%
	String[] s = request.getParameterValues("categoryId");
	if(s == null)
		s = new String[0];
	int[] categoryId = new int[s.length];
	String checkA = request.getParameter("check") == null ? null : "checked";
	
	String check1 = "";
	String check2 = "";
	String check3 = "";
	String check4 = "";
	String check5 = "";
	
	for(int i=0; i<s.length; ++i)
	{
		if(s[i].equals("0"))
			check1 = "checked";
		else if(s[i].equals("1"))
			check2 = "checked";
		else if(s[i].equals("3"))
			check3 = "checked";
		else if(s[i].equals("4"))
			check4 = "checked";
		else
			check5 = "checked";
	}

	// 테스트하기
	String[] check = new String[s.length];
	for(int i=0; i<s.length; ++i)
		check[i] = s[i].equals(String.valueOf(i)) ? "checked" : "";
	
	for(int i=0; i<categoryId.length; ++i)
		categoryId[i] = s[i].equals("0") ? 0 : Integer.parseInt(s[i]);
	
	List<Book> list = new ArrayList<Book>();
	
	if(s.length == 0)
		list = BookDAO.findByAll();
	else
		for(int i=0; i<categoryId.length; ++i)
	{
		if(categoryId[i] == 0)
			list = BookDAO.findByAll();
		else
			list.addAll(BookDAO.findBycategoryId(categoryId[i]));
	}
	
%>
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
thead th {
	background-color: #eee;
}

table.table {
	width: 700px;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>카테고리별목록</h1>
		<form class="form-inline">
			<div class="form-group">
			조회 하시겠습니까? <input type="checkbox" name="check" <%= checkA %>>
			</div>
			<br/>
			<div class="form-group">
				<label>카테고리</label>
				<input type="checkbox" name="categoryId" <%= check1 %> value="0">전체
				<input type="checkbox" name="categoryId" <%= check2 %> value="1" >소설
				<input type="checkbox" name="categoryId" <%= check3 %> value="3" >경제
				<input type="checkbox" name="categoryId" <%= check4 %> value="4" >과학
				<input type="checkbox" name="categoryId" <%= check5 %> value="5" >역사
			</div>
			<button type="submit" class="btn btn-primary">조회</button>
		</form>
		<table class="table table-bordered table-condensed">
			<thead>
				<tr>
					<th>학번</th>
					<th>제목</th>
					<th>작가</th>
					<th>장르</th>
					<th>가격</th>
					<th>출판사</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Book book : list) {
				%>
				<tr>
					<td><%= book.getId() %></td>
					<td><%= book.getTitle() %></td>
					<td><%= book.getAuthor() %></td>
					<td><%= book.getCategoryName() %></td>
					<td><%= book.getPrice() %></td>
					<td><%= book.getPublisher() %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>