<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- string2.jsp -->
<%
	// 전달된 정보(파라메터)를 저장
	System.out.println("string2.jsp 실행");

	// ajax - data 속성값은 파라메터 형태로 처리
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
	System.out.println("name : " +name);
	System.out.println("age : " +age);
%>

<!-- 출력하는 (화면에 보여지는) 형태를 success(data)로 전달 -->
<h2> <%=name %>님 환영합니다.</h2>
<h2> <%=name %>님의 나이는 <%=age %> 입니다.</h2>
