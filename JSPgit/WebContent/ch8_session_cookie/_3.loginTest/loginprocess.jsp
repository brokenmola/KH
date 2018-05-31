<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

</head>
<body>
	<%
		String storedId = application.getInitParameter("ID");
		String storedPass = application.getInitParameter("Pass");
		
		String inputId = request.getParameter("id");
		String inputPass = request.getParameter("pass");
		
		//저장된 아이디와 비밀번호가 일치하는 경우
		if(inputId.equals(storedId) && inputPass.equals(storedPass)){
			session.setAttribute("id", inputId);
		%>
			<script>
				var id="<%=inputId %>" + "님 환영합니다.";
				alert(id);
			</script>
			<h3>로그인에 성공했습니다.</h3>
			<div><a href="loginCheck.jsp">로그인 체크</a></div>
		<%
			String IDStore = request.getParameter("idCheck");
			Cookie cookie = new Cookie("id", request.getParameter("id"));
			
			if(IDStore != null && IDStore.equals("store")){
				cookie.setMaxAge(2 * 60);
				response.addCookie(cookie);
				out.println("<a href='login.jsp'>로그인 화면 다시 보기</a>");
			} else {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		} else if(inputId.equals(storedId)){	//아이디만 일치하는 경우
		%>
			<script>
				alert("패스워드가 다릅니다.");
				history.go(-1);	//location.href="login.jsp";
			</script>	
		<%
		} else {
		%>
			<script>
				alert('로그인 아이디가 다릅니다.');
				history.go(-1);
			</script>
		<%
		}
	
%>
</body>
</html>