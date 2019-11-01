<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Poll.DBconnection"
    import="Poll.PollBean"
    import="Poll.PollDBbean"
    import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% 	request.setCharacterEncoding("utf-8");
	PollBean pb = new PollBean();
	PollDBbean pdb = new PollDBbean();
	int active = 0;
	String sdate = request.getParameter("strdateY") + pdb.addZero(request.getParameter("strdateM")) + pdb.addZero(request.getParameter("strdateD"));
	String edate = request.getParameter("enddateY") + pdb.addZero(request.getParameter("enddateM")) + pdb.addZero(request.getParameter("enddateD"));
	pb.setSdate(sdate);
	pb.setEdate(edate);
	
	pb.setQuestion(request.getParameter("question"));
	pb.setAnswer1(request.getParameter("answer1"));
	pb.setAnswer2(request.getParameter("answer2"));
	pb.setAnswer3(request.getParameter("answer3"));
	pb.setAnswer4(request.getParameter("answer4"));
	pb.setType(Integer.parseInt(request.getParameter("type")));
	pb.setActive(active);
	int result = pdb.insertPoll(pb);
	
	String msg = "설문 추가에 실패하셨습니다.";
	String url = "pollInsert.jsp";
	if(result == 1){
		msg = "설문 추가에 성공하셨습니다.";
		url = "pollList.jsp";
	}
%>
<script>
	alert("<%= msg%>")
	location.href("<%= url%>")
</script>
<body>
설문 등록이 완료되었습니다.
</body>
</html>