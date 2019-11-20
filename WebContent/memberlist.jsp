<%@page import="java.sql.Date"%>
<%@page import="member.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록 조회/수정</title>
<link rel="stylesheet" href="style.css?after">
</head>
<body>
	<div id="wrap">
	
		<header id="header" class="clearfix">
			<div class="head">
				<h1>쇼핑몰 회원관리</h1>	<h2>ver 1.0</h2>
			</div>
			<nav class="nav">
				<ul class="clearfix">
					<li><a href="addmenber.jsp">회원 등록</a></li>
					<li><a href="memberlist.jsp">회원목록 조회/수정</a></li>
					<li><a href="sallist.jsp">회원매출조회</a></li>
					<li><a href="main.html">홈으로.</a></li>
				</ul>
			</nav>
		</header>
		
		<section id="content">
			<div class="maincont">
				<h2>회원목록 조회/수정</h2>
			</div>
			<div class="cont">
				<table class="cent">
					<tr>
						<td class="mno">회원번호</td>
						<td class="mname">회원성명</td>
						<td class="phone">전화번호</td>
						<td class="adress">주소</td>
						<td class="join">가입일자</td>
						<td class="class">고객등급</td>
						<td class="city">거주지역</td>
					</tr>
					
					<%
						request.setCharacterEncoding("UTF-8");
						
						memberDAO dao = memberDAO.GetInstance();
						ArrayList<memberVO> list = dao.readMembers();
						
						for(memberVO member : list){
					%>
					
					<tr>
						<td><a href="updatemember.jsp?num=<%= Integer.toString(member.getCustno()) %>"><%= Integer.toString(member.getCustno()) %></a></td>
						<td><%= member.getCustname() %></td>
						<td><%= member.getPhone() %></td>
						<td><%= member.getAddress() %></td>
						<td><%= member.getJoindate() %></td>
						<td><%= member.getGrade() %></td>
						<td><%= member.getCity() %></td>
					</tr>
					
					<%
						}
					%>
				</table>
			</div>
		</section>
		
		<footer id="footer">
			HRDKOREA Copyrightⓒ2016 All right reserved. Human Resources Development Service of Korea.
		</footer>
	</div>
</body>
</html>