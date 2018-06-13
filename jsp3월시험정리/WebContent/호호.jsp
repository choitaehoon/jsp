<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exam4</title>
</head>
<body>
   <%
   String number=request.getParameter("number");
   String cmd = request.getParameter("cmd");
   if(number==null){
      number="0";
   }
   int num=Integer.parseInt(number);
   if(cmd==null){
      cmd="확인";
   }
   else if(cmd.equals("확인")){
      num++;
   }   
   %>
   
   <div class="container">
      <form action="호호.jsp">
         <div class="form-group">
            <label>number1:</label> <input type="text" name="number"
               class="form-control" value=<%= num %> />
         </div>
            <input type="submit" class="btn btn-primary" name="cmd" value="확인">
      </form>
   </div>
</body>
</html>