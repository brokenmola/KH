<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>MVC �Խ���</title>
	<link href="css/list.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-3.0.0.js"></script>
	 <script src="./js/list.js">    </script>
	  <script>
	   $(function(){
		   $("#viewcount").val("${limit}").prop("selected", true);
	   });	    
	 </script> 
</head>
<body>
<%@ include file="/board/header.jsp" %>
<!-- �Խ��� ����Ʈ -->

<table>
<!-- ���ڵ尡 ������ --><!-- core ���̺귯�� ��� -->
<c:if test="${listcount > 0 }">
	<tr>
		<th colspan="3">MVC �Խ��� - list</th>
		<th colspan="2">
			<font size=2>�� ���� : ${listcount }</font>
		</th>
	</tr>
	<tr>
		<th width="8%"><div>��ȣ</div></th>
		<th  width="50%"><div >����</div></th>
		<th width="14%"><div >�ۼ���</div></th>
		<th  width="17%"><div >��¥</div></th>
		<th  width="11%"><div >��ȸ��</div></th>
	</tr>		
	<c:set var="num" value="${listcount-(page-1)*limit}"/>	
	<c:forEach var="b" items="${boardlist}">	
	<tr>
	  <td>
		<c:out value="${num}"/><%-- num ��� --%>		
		<c:set var="num" value="${num-1}"/>	<%-- num = num - 1 �ǹ�--%>	
	  </td>
	  <td>
	     <div>			
			<%-- �亯�� ����տ� ���� ó�� �κ� 
			      BOARD_RE_LEV, BOARD_RE_LEV, BOARD_NUM, 
			      BOARD_SUBJECT, BOARD_NAME, BOARD_DATE, 
			      BOARD_READCOUNT : property �̸� --%>
		    <c:if test="${b.BOARD_RE_LEV != 0}">  <!--  ����� ��� -->
				<c:forEach var="a" begin="0" 
				           end="${b.BOARD_RE_LEV*2}" step="1">
				&nbsp; 	
				</c:forEach>			
			��
			</c:if>  
			 
			<c:if test="${b.BOARD_RE_LEV == 0}">  <!-- ������ ��� -->
				&nbsp; �� 
			</c:if> 			
			
			<a href="./BoardDetailAction.bo?num=${b.BOARD_NUM}">
				${b.BOARD_SUBJECT}
			</a>
			</div>
		</td>
		<td>
			<div>${b.BOARD_NAME}</div>
		</td>
		<td>
			<div>${b.BOARD_DATE}</div>
		</td>	
		<td>
			<div>${b.BOARD_READCOUNT}</div>
		</td>
	</tr>
	</c:forEach>
	
	<tr class="h30 lime center btn">
		<td colspan=5>			
			<c:if test="${page <= 1 }">
				����&nbsp;
			</c:if>
			<c:if test="${page > 1 }">			
				 <a href="./BoardList.bo?page=${page-1}">����</a>&nbsp;
			</c:if>
					
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					${a}
				</c:if>
				<c:if test="${a != page }">
					<a href="./BoardList.bo?page=${a}">${a}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${page >= maxpage }">
				&nbsp;���� 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="./BoardList.bo?page=${page+1}">&nbsp;����</a>
			</c:if>
		</td>
	</tr>
	</c:if>
</table>
<table>
	<!-- ���ڵ尡 ������ -->
	<c:if test="${listcount == 0 }">
	   <tr>
		<td colspan="4">MVC �Խ���</td>
		<td style="text-align:right">
			<font size=2>��ϵ� ���� �����ϴ�.</font>
		</td>
	  </tr>
	</c:if>
	  <tr>
		<td colspan="4" style="text-align:right">
	   		<a href="./BoardWrite.bo">[�۾���]</a>
		</td>
		<td>
		  <select id="viewcount">
	   		   <option value="3">3�� ����</option>
	   		   <option value="5">5�� ����</option>
	   		   <option value="7">7�� ����</option>
	   		   <option value="10" selected>10�� ����</option>
	   		</select>
		</td>
	</tr>
</table>
</body>
</html>