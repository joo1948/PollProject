<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#FFFFCC">
<center>
	<h1>투표 프로그램</h1>
	<hr width="80%">
	<h3>설문작성</h3>
	<hr width="80%">
	<form method="post" action="insertPollPro.jsp">
		<table border="1">
			<tr>
				<td>질문</td>
				<td colspan=2><input type=text name=question size=50></td>
			</tr>
			<tr>
				<td rowspan="6">항목</td>
				<td>1: <input type=text name=answer1></td>
				<td>2: <input type=text name=answer2></td>
			</tr>
			<tr>
				<td>3: <input type=text name=answer3></td>
				<td>4: <input type=text name=answer4></td>
			</tr>
			<tr>
				<td>시작일</td>
				<td><select name="strdateY">
					<option value="2019">2019
					<option value="2020">2020
				</select>년 
				<select name="strdateM">
					<% for (int i = 1; i <= 12; i++){
						out.println("<option value=" + i + ">" + i);
					}%>
				</select>월
				<select name="strdateD">
					<% for (int i = 1; i <= 31; i++){
						out.println("<option value=" + i + ">" + i);
					}%>
				</select>일</td>
			</tr>
			<tr>
				<td>종료일</td>
				<td><select name="enddateY">
					<option value="2019">2019
					<option value="2020">2020
				</select>년 
				<select name="enddateM">
					<% for (int i = 1; i <= 12; i++){
						out.println("<option value=" + i + ">" + i);
					}%>
				</select>월
				<select name="enddateD">
					<% for (int i = 1; i <= 31; i++){
						out.println("<option value=" + i + ">" + i);
					}%>
				</select>일</td>
			</tr>
			<tr>
				<td>복수투표</td>
				<td><input type=radio name="type" value=1 checked>yes 
				<input type=radio name="type" value=0>no</td>
			</tr>
			<tr>
				<td colspan=2><input type=submit value=작성하기>
				<input type=reset value=다시쓰기>
				<input type=button value=리스트 onClick="javascript:location.href='pollList.jsp'" ></td>
			</tr>
		</table>
	</form> 	
</center>
</body>
</html>