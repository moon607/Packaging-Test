<%@page import="member.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑 회원 정보 수정</title>

<link rel="stylesheet" href="style.css?after">
<script type="text/javascript">
	function updatemember() {
			document.frm.action = "updatememberpro.jsp";
			document.frm.submit();
			alert("회원수정이 완료 되었습니다.");
	}
	
	function memberlist() {
		location.href = "memberlist.jsp";
	}
</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

/*
memberDAO dao = memberDAO.GetInstance();
memberVO vo = dao.member(request.getParameter("num"));
*/

String number = request.getParameter("num");


%>

	<div id="wrap">
		<header id="header">
			<div class="head">
				<h1>쇼핑몰 회원관리</h1>	<h2>ver 1.0</h2>
			</div>
			<nav class="nav">
				<ul>
					<li><a href="addmenber.jsp">회원 등록</a></li>
					<li><a href="memberlist.jsp">회원목록 조회/수정</a></li>
					<li><a href="sallist.jsp">회원매출조회</a></li>
					<li><a href="main.html">홈으로.</a></li>
				</ul>
			</nav>
		</header>
		
		<section id="content">
			<div class="maincont">
				<h2>홈쇼핑 회원 정보 수정</h2>
			</div>
			<div class="cont">
			<form action="updatememberpro.jsp" method="post" id="frm" name="frm">
				<table>
					<tr>
						<td class="cent">회원번호</td>
						<td>
							<input type="text" name="number" value="<%= number %>" size="15px;">
						</td>
					</tr>
					
					<tr>
						<td class="cent">회원성명</td>
						<td class="inputbox">
							<input type="text" id="aneme" name="mname" size="15px;">
						</td>
					</tr>
					
					<tr>
						<td class="cent">회원연락처</td>
						<td class="inputbox">
							<input type="text" name="phone" size="20px;">
						</td>
					</tr>
					
					<tr>
						<td class="cent">회원주소</td>
						<td class="inputbox">
							<input type="text" name="address" size="30px;">
						</td>
					</tr>
					
					<tr>
						<td class="cent">가입일자</td>
						<td class="inputbox">
							<input type="text" name="join" size="15px;">
						</td>
					</tr>
					
					<tr>
						<td class="cent">고객등급 (A:VIP, B:일반, C:사원)</td>
						<td class="inputbox">
							<input type="text" name="grade" size="15px;">
						</td>
					</tr>
					
					<tr>
						<td class="cent">도시코드</td>
						<td class="inputbox">
							<input type="text" name="city" size="15px;">
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="cent">
							<input type="button" onclick="updatemember();" value="수정">
							<input type="button" onclick="memberlist();" value="조회">
						</td>
					</tr>
				</table>
			</form>
			</div>
		</section>
		
		<footer id="footer">
			HRDKOREA Copyrightⓒ2016 All right reserved. Human Resources Development Service of Korea.
		</footer>
	</div>
</body>
</html>