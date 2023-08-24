<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOderDAOImpl"%>
<%@page import="com.DAO.BookOrderDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Order</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: f0f1f2;">

<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@ include file="all_component/navbar.jsp"%>
	

<div class="comtainer p-3">
<h3 class="text-center text-primary ">Your Order</h3>
	<table class="table table-striped mt-3">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
		<%
		User u=(User)session.getAttribute("userobj");
		BookOderDAOImpl dao=new BookOderDAOImpl(DBConnect.getConn());
		List<Book_Order> blist=dao.getBook(u.getEmail());
		for(Book_Order b : blist){
			%>
			<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<td><%=b.getUserName()%></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPaymentType()%></td>
				
			</tr>
			
			
			<%
		}
		
		%>
		
			
		</tbody>
	</table>
	</div>
</body>
</html>