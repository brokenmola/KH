<%--ServletContext�� �̿��� ���� --%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=euc-kr"%>
    <%--htmlȭ�鿡�� jsp�������� ���� ���ִ� JSP�ڵ� --%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	String fileName = request.getParameter("file_name");
	System.out.println("fileName =" + fileName);
	
	String savePath = "upload";
	//������ ���� ȯ�� ������ ��� �ִ� ��ü�� �����մϴ�
	//(application ���� ��ü�� �����մϴ�.)
	ServletContext context = pageContext.getServletContext();
	String sDownloadPath = context.getRealPath(savePath);
	//�� �� ������ �� �������� ��Ÿ���� ������ �����ϴ�.
	//String sDouwnloadPath = application.getRealPath(savePath);
	
	//String sFilePath = sDownloadPath + "\\" + fileName;
	//"\" �߰��ϱ� ���� "\\" ��� �մϴ�.
	String sFilePath = sDownloadPath + "/" + fileName;
	System.out.println(sFilePath);
	
	byte b[] = new byte[4096];
	
	//sFilePath�� �ִ� ������ MimeType�� ���ؿɴϴ�.
	String sMimeType = context.getMimeType(sFilePath);
	System.out.println("sMimeType>>>" + sMimeType);
	
	/*
		Content-Type: ���۵Ǵ� Content�� � �������� �˷��ִ� ������ ������ �ֽ��ϴ�.
		text/html, image/png, application/octet-stream ���� ���� �����ϴ�.
		Content-Type�� ���ؼ� �������� �ش� �����͸� ��� ó���ؾ� �� �� �Ǵ��� �� �ְ� �˴ϴ�.
		��) - image/png : �������� �ش� ����Ʈ�� �̹����ν� �����ϰ� �˴ϴ�.
			-application/octet-stream : ��Ȯ�� Binary ������ �ǹ��ϸ�, �� ���
			�������� ������ �ٿ�ε��ϴ�  ���·� �����մϴ�.
			-text/javascript : �������� Content�� Jacascript������ ����ϰ� �˴ϴ�.
	*/
	
	/*
	-octet-stream�� 8��Ʈ�� �� �Ϸ��� �����͸� ���մϴ�
	-�������� ���� ���� ������ �ǹ��մϴ�.
	*/
	if(sMimeType == null)
		sMimeType = "application/octet-stream";
	response.setContentType(sMimeType);
	
	/*
		- �� �κ��� �ѱ� ���ϸ��� ������ ���� ������ �ݴϴ�.
		- getBytes(ĳ���ͼ�) : �ڹ� ���ο� �����Ǵ� �����ڵ� ���ڿ���
		���ڷ� ������ ĳ���ͼ��� ����Ʈ �迭�� ��ȯ�ϴ� �޼ҵ��Դϴ�.
		- String(byte[] bytes. Character charset)
		new String(����Ʈ�迭, ĳ���ͼ�) ������ : �ش� ����Ʈ �迭�� �־��� ĳ���� ������ ��Ʈ���� ����� �������Դϴ�.
	*/
	
	String sEncoding = new String(fileName.getBytes("euc-kr"), "ISO-8859-1");
	System.out.println(sEncoding);
	
	/*
		-Content-Disposition: Content�� ��� ó���Ǿ�� �ϴ��� ��Ÿ���ϴ�
		1) Content-Disposition:
			inline : �������� Content�� ��� ����ؾ� ���� ��Ÿ���ϴ�. �̹����� ��� ������ ������ ���
						����Ϥ�, ������ ��� �ؽ�Ʈ�� ����մϴ�
		2) Content-Disposition:
			attachment : �������� �ش� Content�� ó������ �ʰ�, �ٿ�ε��ϰ� �˴ϴ�.
	*/
	response.setHeader("Content-Disposition","attachment; fielname= " + sEncoding);
		
	/*
		response.setHeader("Content-Disposition","inline; filename= " +sEncoding);
	*/
	
	ServletOutputStream so = response.getOutputStream();
	BufferedOutputStream out2 = null;
	BufferedInputStream in  = null;
	try{
		//�� ���������� ��� ��Ʈ�� �����մϴ�.
		in = new BufferedInputStream(new FileInputStream(sFilePath));
		out2 = new BufferedOutputStream(so);
		int numRead;
		//read(b,0,b.length) : ����Ʈ �迭 b�� 0�� ���� b.length����
		
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