<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*, exam.Student"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body { font-family: 굴림체; }
        input.form-control { width: 200px; }
        select.form-control { width: 200px; }
    </style>
</head>
<%
    String strID = "";
    String studentNumber = "";
    String name = "";
    String strYear = "";

    int departmentId =0;

    String 에러메시지 = null;



    request.setCharacterEncoding("UTF-8");
    if (request.getMethod().equals("POST")) {
    	
        strID = request.getParameter("strID");
        studentNumber = request.getParameter("studentNumber");
        name = request.getParameter("name");
        strYear = request.getParameter("strYear");

        if (strID == null || strID.length() == 0)
            	에러메시지 = "사용자 아이디를 입력하세요";
        else if (studentNumber == null || studentNumber.length() == 0)
        	    에러메시지 = "학번을 입력하세요";
        else if (name == null || name.length() == 0)
        	    에러메시지 = "이름을 입력하세요";
        else if (strYear == null || strYear.length() == 0)
         	   에러메시지 = "학년을 입력하세요";
        else {
            Student student = new Student(Integer.parseInt(strID), studentNumber, name, departmentId, Integer.parseInt(strYear));
            session.setAttribute("student", student);
            response.sendRedirect("student_success.jsp");
            return;
        }
    }
%>
<body>

<div class="container">

    <h1>학생등록</h1>
    <hr/>

    <form method="post">
        <div class="form-group">
            <label>ID</label>
            <input type="text" class="form-control" name="strID" value="<%= strID%>"/>
        </div>
        <div class="form-group">
            <label>학번</label>
            <input type="text" class="form-control" name="studentNumber" value="<%= studentNumber%>"/>
        </div>
        <div class="form-group">
            <label>이름</label>
            <input type="text" class="form-control" name="name" value="<%= name%>"/>
        </div>
        <div class="form-group">
            <label>학과</label>
            <select class="form-control" name="departmentId">
                <option value="1">소프트웨어공학과</option>
                <option value="2">컴퓨터공학과</option>
                <option value="3">정보통신공학과</option>
                <option value="4">글로컬IT공학과</option>
            </select>
        </div>
        <div class="form-group">
            <label>학년</label>
            <input type="text" class="form-control" name="strYear" value="<%= strYear%>"/>
        </div>

        <button type="submit" class="btn btn-primary">
            <i class="glyphicon glyphicon-ok"></i> 저장
        </button>
    </form>

    <hr/>
    <% if (에러메시지 != null) { %>
    <div class="alert alert-danger">
        로그인 실패: <%= 에러메시지 %>
    </div>
    <% } %>
</div>
</body>
</html>