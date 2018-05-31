<%-- 1. Java Naming and Directory interface(JNDI)�� Java ���ø����̼��� ��Ʈ��ũ����
		 �̸�(name)�� �̿��Ͽ� ��ü�� ã�� ������ �� �ֵ��� �ϴ� ǥ�� API�Դϴ�.
		 
		 * JNDI�� ��� �ϸ� Java ���α׷��̳� JSP ���������� ���� ���α׷� ���� �Ǵ� �ܺο��� ������
		 �ڿ��� ���� �� �� �ֽ��ϴ�.
		 * ������ ���̽� Ŀ�ؼ� Ǯ���� ����ϰ� ��  DataSource ��ü�� ���̹� ���񽺸� ���� �����̳ʿ��� �����մϴ�.
		 
	 2. DBCP(Database Connection Pool)
	 	�����ͺ��̽��� ����� Ŀ�ؼ��� �̸� ���� Ǯ(pool) �ӿ� ������ �ΰ�
	 	�ʿ��� �� Ŀ�ؼ��� Ǯ���� ���� �ٽ� Ǯ�� ��ȯ�ϴ� ����� ���մϴ�.
	 	�� ���α׷������� �����ͺ��̽��� ȯ�漳���� ������ ���� ���� ���� XML�����̳�
	 	�Ӽ� ������ ����ؼ� �����ϰ� �̷��� ������ ������ �̸��� ����Ͽ� ȹ���ϴ� ����� ����մϴ�.
	 	
	 	* DBCP�� �̿��� ���ؼ� Ǯ�� ����ϱ� ���� ���� ��Ĺ�� DataSource�� ����ؾ� �մϴ�.
	 	context.xml(���ø����̼� ���ؽ�Ʈ�� ���õ� ������ �ϴ� ����)���Ͽ��� �� �� ������ ��ġ�� META-INF�� �����մϴ�.
	 	
	 	*DBCP ���̺귯�� : tomcat-dbcp.jar ����
	 
	 3. DataSource �̿� ���
	 	(1) JNDI Server���� lookup()�޼ҵ带 ���� DataSource��ü�� ���ɴϴ�.
	 	(2) DataSource ��ü�� getConnection()�޼ҵ带 ���ؼ� Connection Pool���� 
	 		Connection�� ȹ���մϴ�.
	 	(3) Connection ��ü�� ���� DBMS �۾��� �����մϴ�.
	 	(4) ��� �۾��� ������ DataSource��ü�� ���ؼ� Connection Pool��
	 		Connection�� �ݳ��մϴ�. --%>

<%--Connection ��ü�� JNDI�� ����ϱ� ���� ��Ű���� import�մϴ�.
	�Ϲ� ������ ���̽� �۾��� ���� import�մϴ�. --%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>

<%-- javax.sql.DataSource ��ü�� ����ϱ� ���� import �մϴ�. --%>
<%@ page import="javax.sql.*" %>

<%-- JNDI �۾��� �ϱ� ���� import �մϴ�. --%>
<%@ page import="javax.naming.*" %>
<%
	Connection conn = null;

	try{
		//context.xml�� ���ҽ��� ������ ���� (JNDI�� ������ ����)
		//jdbc/OracleDB�� �����Ͽ� Connection ��ü�� ��� �ɴϴ�.
		
		//1. JNDI�� �̿��ϱ� ���� ��ü �����մϴ�.
		Context init = new InitialContext();
		
		/*2. JNDI�� ��� �̸��� �⺻������ java:comp/env/�� ��ϵǾ� �ֽ��ϴ�.
			 Jdbc/OracleDB:JNDI ���񽺿� �����ϱ� ���� �̸��Դϴ�.
			 lookup(): ��ϵ� naming ���񽺷κ��� �ڿ��� ã������ �� ����ϴ� �޼ҵ�
			 Context ��ü�� ����Ͽ� �̸����� Resource�� ȹ���մϴ�.
		*/
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		/*
		  3. JNDI�� �̿��Ͽ� ����� Connection ��ü�� �����ɴϴ�.
		  	�� ��ü�� ���� Container�� DBCP�� ���� �����˴ϴ�.
		*/
		conn = ds.getConnection();
		
		out.println("<h3>���ؼ� Ǯ�� ����Ǿ����ϴ�.</h3>");
		conn.close();
		
	}catch(Exception e){
		out.println("<h3>���ؼ� Ǯ ���ῡ �����Ͽ����ϴ�.</h3>");
		e.printStackTrace();
	}
%>


