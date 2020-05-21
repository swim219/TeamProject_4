<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
ItemBean itemBean = new ItemBean();

String a = itemBean.getName();
Timestamp b = itemBean.getWriteTime();
String c = itemBean.getEndTime();
int d = itemBean.getStartPrice();
int e = itemBean.getMaxPrice();
int f = itemBean.getDeliveryPrice();
String g = itemBean.getContent();
String h = itemBean.getCategory();
String i = itemBean.getThumbnail();
%>

상품명: <%=a %><br>
등록일시: <%=b %><br>
마감일시: <%=c %><br>
시작가: <%=d %><br>
낙찰가: <%=e %><br>
배송비: <%=f %><br>
상품설명: <%=g %><br>
카테고리: <%=h %><br>
썸네일 파일명: <%=i %><br>
</body>
</html>