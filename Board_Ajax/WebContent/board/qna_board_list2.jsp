<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			
		    <c:if test="${b.BOARD_RE_LEV != 0}">  <%--  ����� ��� --%>
				<c:forEach var="a" begin="0" 
				           end="${b.BOARD_RE_LEV*2}" step="1">
				&nbsp; 	
				</c:forEach>			
			��
			</c:if>  
			 
			<c:if test="${b.BOARD_RE_LEV == 0}">  <%-- ������ ��� --%>
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
		
