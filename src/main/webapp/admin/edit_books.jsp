
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="navbar.jsp"%>

	<div class="container ">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}
							<p>
								<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}
							<p>
								<c:remove var="failedMsg" scope="session" />
						</c:if>		
						
					<% 	
					
						int id=Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
						BookDtls b=dao.getBookById(id);
						
						%>

						<form action="../editbooks" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" name="bname" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=b.getBookName()%>">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" name="author" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"value="<%=b.getAuthor()%>">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									type="number" name="price" class="form-control"
									id="exampleInputEmail1" value="<%=b.getPrice()%>">
							</div>
							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="status" class="form-control">
									<% if("Active".equals(b.getStatus())) {
										%>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
									<% 
									}else{%>
									
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%}
									%>		
									
									
								</select>
							</div>
							<button type="submit" class="btn btn-primary">Update</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 40px">
		<%@ include file="footer.jsp"%></div>
</body>
</html>