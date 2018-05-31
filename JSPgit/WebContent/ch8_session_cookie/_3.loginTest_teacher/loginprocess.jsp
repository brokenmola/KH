<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
  <head>
    <title>로그인 처리</title>
   </head>
   <style>
     body {
	      text-align: center
      }
    </style> 
     <body>   
  <%
	String storedID = application.getInitParameter("ID");
	String storedPW = application.getInitParameter("Pass");

	String inputID = request.getParameter("id");
	String inputPW = request.getParameter("pass");

	//저장된 아이디와 비밀번호가 일치하는 경우
	if (inputID.equals(storedID) 
			              && inputPW.equals(storedPW)) {
		session.setAttribute("id", inputID);
  %>
	  <script>      
        var id="<%=inputID%>" + "님 환영합니다.";
        alert(id);
      </script>
	     로그인에 성공했습니다.
	  <br><br>
	  <a href="loginCheck.jsp"> 로그인 체크</a>

  <%
		String IDStore = request.getParameter("idstore");
		Cookie cookie = new Cookie("id", 
				             request.getParameter("id"));

		//ID 기억하기를 체크한 경우
		if (IDStore != null && IDStore.equals("store")) {
		//cookie.setMaxAge(60 * 60 * 24);//쿠키의 유효시간을 24시간으로 설정합니다.
				cookie.setMaxAge(2*60);
				//클라이언트로 쿠키값을 전송합니다.
				response.addCookie(cookie);
				out.println("<a href='login.jsp'>로그인 화면 다시 보기</a>");
		} else {
				cookie.setMaxAge(0);
				response.addCookie(cookie);			    
		}
	} else if (inputID.equals(storedID)) { //아이디만 일치하는 경우
  %>
	<script>
      alert("패스워드가 다릅니다.");    
       history.go(-1); // location.href="login.jsp";
     </script>
  <%
	} else {//아이디가 다른 경우
  %>
	   <script>
          alert("로그인 ID가 다릅니다.");
           history.go(-1); //location.href="login.jsp";
       </script>
  <%
	}
  %>
</body>
</html>
