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
input.form-control {
   width: 200px;
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
   request.setCharacterEncoding("UTF-8");
   String abc = request.getParameter("time") == null ? "0" : request.getParameter("time");
   int time = Integer.parseInt(abc);
   String cmd = request.getParameter("cmd") == null ? "값넘기기" : request.getParameter("cmd");
   if(cmd.equals("확인"))
	   time = time+1;
   %>
   
   <div class="container">
      <form action="abc.jsp">
         <div class="form-group">
            <label>number1:</label> <input type="text" class="form-control"
               name="time"
               value=<%=request.getParameter("time") == null ? 0 : time%> />
         </div>
         <div class="form-group">
            <input type="submit" class="btn btn-primary" name="cmd" value="확인">
         </div>
      </form>
   </div>
</body>
</html>