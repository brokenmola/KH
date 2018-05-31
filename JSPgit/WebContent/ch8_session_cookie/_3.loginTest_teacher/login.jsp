<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	boolean isIDShow = false;
	String id = "";
	
	Cookie[] cookies = request.getCookies();
	if(cookies !=null ){
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("id")){
				isIDShow = true;
				id=cookies[i].getValue();
			}
		}
	}
%>
<html>
<head>
<title>쿠키를 이용한 화면 설정 예제</title>
<style>
  body{margin:10px auto;  width:400px}
  fieldset{width:100%; padding-top:20px; padding-left:20px}
  .length{width:150px}
  div{width:100px;float:left}
</style>
<script src="../../js/jquery-3.3.1.js" ></script>
<script src="../../js/ch8_3.js"></script>
<script>
  $(function(){
	 
//채우세요
	  var isIDShow = <%=isIDShow %>;
		if(isIDShow){
			$("#id").val('<%=id %>');
			$("#id + input").attr('checked', 'checked');
		}
	  
  })
</script>
</head>
<body>
 <fieldset>
	<form action="loginprocess.jsp" method="post">
	<div>ID:</div>	 
	    <input type="text" name="id"  id="id"  class="length">
	    <input type="checkbox" name="idstore" 
	            value="store">ID 기억하기<br>
         <div>password:</div>
         <input type="password" name="pass"  class="length" id="pass"><br>
         <input type="submit" value="전송">
	</form>
  </fieldset>	
</body>
</html>
