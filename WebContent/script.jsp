<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="abc.jsp" method="post">
	<table>
		<tr>
			<td>이름 : </td>
			<td>
				<input type="text" name="name">
			</td>
		</tr>
		
		<tr>
			<td>나이 : </td>
			<td>
				<input type="text" name="age">
			</td>
		</tr>
		
		<tr>
			<td>성별</td>
			<td>
				<select name="gender">
					<option value="남자">남</option>
					<option value="여자">여</option>
				</select>
			</td>
		</tr>
	</table>
	<input type="submit" onclick="move();">
	</form>
<br>
	<button onclick="gohtml()">연결</button>
<br>
<br>
	<button onclick="popup()">선택</button>
&nbsp;
	<button onclick="warn()">오류</button>
	
	<script type="text/javascript">
	
		function move() {
			location.href="./abc.jsp"
		}
		
		function gohtml() {
			location.href="./aaa.html"
		}
		
		function popup() {
			var cont = confirm("aaa로 넘어가겠습니까?")
			
			if(cont){
				location.href="./aaa.html"
			}
			else{
				return false;
			}
		}
		
		function warn() {
			alert("잘못된 선택입니다.")
		}
		
	</script>
</body>
</html>