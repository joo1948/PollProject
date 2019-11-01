<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Poll.DBconnection"
    import="Poll.PollBean"
    import="Poll.PollDBbean"
    import="java.sql.*"
    import="javax.sql.*"
    import="java.util.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% request.setCharacterEncoding("utf-8");
	PollDBbean pdb = new PollDBbean();
	Vector<PollBean> pollList = pdb.selectAll();
%>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br/>
		<h2>등록된 설문 리스트</h2>
		<hr width=600>
		<table border=1 width=600>
			<tr>
				<td width=10 align=center><b>번호</b></td>
				<td width=100 align=center><b>질문</b></td>
				<td width=20 align=center><b>설문 여부</b></td>
			</tr>
			<tr>
<%			for(int i = 0; i < pollList.size(); i++){
				PollBean poll = pollList.get(i);
				out.println("<tr>");
				out.println("<td><b>" + poll.getNum() + "</b></td>");
				out.println("<td><a href=''>" + poll.getQuestion() + "</td>");
				if(poll.getActive() == 0){
					out.println("<td>설문 불가</td>");
				} else {
					out.println("<td>설문 가능</td>");
				}
			}
%>
		</table>
	</div>
</body>
</html>