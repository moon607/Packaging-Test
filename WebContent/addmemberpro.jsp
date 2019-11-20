<%@page import="member.memberDAO"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록 처리 화면</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
	
		int custno = Integer.parseInt(request.getParameter("number"));
		String name = request.getParameter("mname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("join");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		
		memberDAO dao = memberDAO.GetInstance();
		int rs = dao.addmember(custno, name, phone, address, joindate, grade, city);
	
		response.sendRedirect("addmenber.jsp");
	%>
	
	
	<%= custno %>
	<%= name %>
	<%= phone %>
	<%= address %>
	<%= joindate %>
	<%= grade %>
	<%= city %>
</body>
</html>