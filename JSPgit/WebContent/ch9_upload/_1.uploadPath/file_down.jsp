<%--ServletContext을 이용한 예제 --%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=euc-kr"%>
    <%--html화면에서 jsp페이지의 공백 없애는 JSP코드 --%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	String fileName = request.getParameter("file_name");
	System.out.println("fileName =" + fileName);
	
	String savePath = "upload";
	//서블릿의 실행 환경 정보를 담고 있는 객체를 리턴합니다
	//(application 내장 객체를 리턴합니다.)
	ServletContext context = pageContext.getServletContext();
	String sDownloadPath = context.getRealPath(savePath);
	//위 두 문장을 한 문장으로 나타내면 다음과 같습니다.
	//String sDouwnloadPath = application.getRealPath(savePath);
	
	//String sFilePath = sDownloadPath + "\\" + fileName;
	//"\" 추가하기 위해 "\\" 사용 합니다.
	String sFilePath = sDownloadPath + "/" + fileName;
	System.out.println(sFilePath);
	
	byte b[] = new byte[4096];
	
	//sFilePath에 있는 파일의 MimeType을 구해옵니다.
	String sMimeType = context.getMimeType(sFilePath);
	System.out.println("sMimeType>>>" + sMimeType);
	
	/*
		Content-Type: 전송되는 Content가 어떤 유형인지 알려주는 목적을 가지고 있습니다.
		text/html, image/png, application/octet-stream 등의 값을 가집니다.
		Content-Type을 총해서 브라우저는 해당 데이터를 어떻게 처리해야 할 지 판단할 수 있게 됩니다.
		예) - image/png : 브라우저는 해당 컨텐트를 이미지로써 간주하게 됩니다.
			-application/octet-stream : 미확인 Binary 정보를 의미하며, 이 경우
			브라우저는 파일을 다운로드하는  형태로 등장합니다.
			-text/javascript : 브라우저는 Content를 Jacascript문서로 취급하게 됩니다.
	*/
	
	/*
	-octet-stream은 8비트로 된 일련의 데이터를 뜻합니다
	-지정되지 않은 파일 형식을 의미합니다.
	*/
	if(sMimeType == null)
		sMimeType = "application/octet-stream";
	response.setContentType(sMimeType);
	
	/*
		- 이 부분이 한글 파일명이 깨지는 것을 방지해 줍니다.
		- getBytes(캐릭터셋) : 자바 내부에 관리되는 유니코드 문자열을
		인자로 지정된 캐릭터셋이 바이트 배열로 반환하는 메소드입니다.
		- String(byte[] bytes. Character charset)
		new String(바이트배열, 캐릭터셋) 생성자 : 해당 바이트 배열을 주어진 캐릭터 셋으로 스트링을 만드는 생성자입니다.
	*/
	
	String sEncoding = new String(fileName.getBytes("euc-kr"), "ISO-8859-1");
	System.out.println(sEncoding);
	
	/*
		-Content-Disposition: Content가 어떻게 처리되어야 하는지 나타냅니다
		1) Content-Disposition:
			inline : 브라우저가 Content를 즉시 출력해야 함을 나타냅니다. 이미지인 경우 브라우저 내에서 즉시
						출력하ㅕ, 문서인 경우 텍스트로 출력합니다
		2) Content-Disposition:
			attachment : 브라우저는 해당 Content를 처리하지 않고, 다운로드하게 됩니다.
	*/
	response.setHeader("Content-Disposition","attachment; fielname= " + sEncoding);
		
	/*
		response.setHeader("Content-Disposition","inline; filename= " +sEncoding);
	*/
	
	ServletOutputStream so = response.getOutputStream();
	BufferedOutputStream out2 = null;
	BufferedInputStream in  = null;
	try{
		//웹 브라우저로의 출력 스트림 생성합니다.
		in = new BufferedInputStream(new FileInputStream(sFilePath));
		out2 = new BufferedOutputStream(so);
		int numRead;
		//read(b,0,b.length) : 바이트 배열 b의 0번 부터 b.length까지
		
		while((numRead=in.read(b,0,b.length))!=-1){
			out2.write(b,0,numRead);
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(out2 != null){
				out2.flush();
				out2.close();
			}
			if(in !=null){
				in.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>