<%@page import="member.memberVO"%>
<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
	
		memberVO vo = new memberVO();
		
		vo.setCustno(Integer.parseInt(request.getParameter("number")));
		vo.setCustname(request.getParameter("mname"));
		vo.setPhone(request.getParameter("phone"));
		vo.setAddress(request.getParameter("address"));
		vo.setJoindate(request.getParameter("join"));
		vo.setGrade(request.getParameter("grade"));
		vo.setCity(request.getParameter("city"));
		
		
		memberDAO dao = memberDAO.GetInstance();
		dao.updatemember(vo);
	
		response.sendRedirect("addmenber.jsp");
		
		//받아온 값 확인 코드
		int custno = Integer.parseInt(request.getParameter("number"));
		String name = request.getParameter("mname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("join");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
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