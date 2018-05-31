<%-- tag 디렉티브 : JSP페이지의 page 디렉티브와 동일합니다.
	 page 디렉티브 JSP 페이지에 대한 설정 정보 등을 명시하는 것처럼 
	 tag 디렉티브는 태그 파일의 정보를 명시합니다.
	 
	 body-content 속성 : 몸체 내용의 종류를 입력합니다.
	 
	 body-content="empty" :  태그 파일이 나타내는 커스텀 태그의 몸체 내용이 없다고 표시합니다.
	 예) <tf:_1now/> 사용해야 합니다.
	 만약 <tf:_1now> 하하 <tf:_1now/> 사용하면 에러 발생합니다
	 
	 pageEncoding="euc-kr" : 태그 파일의 소스 코드 인코딩을 알맞게 지정합니다.
	 
--%>
<%@ tag body-content="empty" pageEncoding="euc-kr"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="date" class="java.util.Date"/>


<fmt:formatDate value="${date }" type="both" timeStyle="long" dateStyle="long"/>
