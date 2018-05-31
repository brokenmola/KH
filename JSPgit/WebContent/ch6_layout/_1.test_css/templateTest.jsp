<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<link href="../../css/ch5-2.css" rel="stylesheet" type="text/css">
</head>
	<%
		String pagefile = request.getParameter("page");
		if(pagefile == null){
			pagefile = "newitem";
		}
	%>
<body>
	<div id="header">
		<h1>상품 목록입니다.</h1>
	</div>
	<div id="navigation">
		<jsp:include page="top.jsp"/><br><br>
	</div>
	
	<div id="wrap">
		<div id="aside">
			<jsp:include page="left.jsp"/>
		</div>
	</div>
	<div id="session">
		<jsp:include page='<%=pagefile + ".jsp" %>'/>
	</div>
	<div id="footer">
		<jsp:include page="bottom.jsp"/>
	</div>
</body>
</html>