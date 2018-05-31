<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h2><%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String jumin1 = request.getParameter("jumin1");
		String jumin2 = request.getParameter("jumin2");
		String email = request.getParameter("email");
		String domain = request.getParameter("domain");
		String sel = request.getParameter("sel");
		String gender = request.getParameter("gender");
		String g = "";
		String[] hobby = request.getParameterValues("hobby");
		String post1 = request.getParameter("post1");
		String post2 = request.getParameter("post2");
		String intro = request.getParameter("intro");
		out.println("아이디 : " + id + "<br>");
		out.println("비밀번호 : " + pass + "<br>");
		out.println("주민번호 : " + jumin1
				+ " - " + jumin2 + "<br>");
		if(sel.equals("")){
			out.println("e-mail : " + email + "@" + domain + "<br>");
		} else {
			out.println("e-mail : " + email + "@" + sel + "<br>");
		}
		if(gender.equals("m")){
			g = "남자";
		} else {
			g = "여자";
		}
		out.println("성별 : " + g + "<br>");
		for(int i = 0; i < hobby.length; i++){
			out.println("취미 : " + hobby[i] + "<br>");
		}
		out.println("우편번호 : " + post1 + " - " + post2 + "<br>");
		out.println("자기소개 : " + intro + "<br>");
		
	%></h2>
</body>
</html>