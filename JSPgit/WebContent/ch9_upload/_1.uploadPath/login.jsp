<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page trimDirectiveWhitespaces="false" %>
<%--
	���� �� ������ �ҽ� ���⸦ ���ϴ�.
	html �±� �������� �ٹٲ� ���� ���ڰ� �ֽ��ϴ�.
	�̰��� �����ϱ� ���� trimDirectiveWhitespaces="true"���� �����մϴ�.
	JSP�������� ���� ��� ���������� ��Ƽ�곪
	��ũ��Ʈ�� �ִ� �κ��� ��������
	ǥ�õǴ� ���� ���� ����� ���Ե��� �ʵ��� �մϴ�.
 --%>
    
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
<title>��Ű�� �̿��� ȭ�� ���� ����</title>
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
	 
//ä�켼��
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
	            value="store">ID ����ϱ�<br>
         <div>password:</div>
         <input type="password" name="pass"  class="length" id="pass"><br>
         <input type="submit" value="����">
	</form>
  </fieldset>	
</body>
</html>
