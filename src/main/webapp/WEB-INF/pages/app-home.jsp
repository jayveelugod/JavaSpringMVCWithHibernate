<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Spring MVC</title>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="//cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
<script>
$(document).ready(function() {
    $('#productListTable').DataTable({
    	columnDefs: [
    		   { orderable: false, targets: -1 }
    		]
    });
} );

function formSubmit() {
	document.getElementById("logoutForm").submit();
}
</script>
</style>
</head>
<body>
	<div style="max-width: 75%; margin: 0 auto;">
		<div>
			<div style="display: inline-block">
				<h1>Product List</h1>
				<a href = "app-newProduct" class="btn btn-primary" role="button">Add Product</a>
			</div>
			<div style="display: inline-block; float: right; margin-top: 20px;">
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<span style ="font-size: 15px">
					User : ${pageContext.request.userPrincipal.name} | <a
						href="javascript:formSubmit()"> Logout</a>
					</span>
				</c:if>	
			</div>
		</div>
		
		<br><br>
		<table id="productListTable" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>Name</th>
				<th>Description</th>
				<th>Price</th>
				<th>Category Path</th>
				<th>Available</th>
				<th>Category</th>
				<th style="width: 150px;">Action</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="product" items="${listProduct}">
				<tr>
					<td>${product.name}</td>
					<td>${product.description}</td>
					<td>${product.price}</td>
					<td>${product.categoryPath}</td>
					<td>${product.available}</td>
					<td>${product.categoryName}</td>
					<td>
						<a href="editProduct?id=${product.productID}" class="btn btn-success" role="button">Edit</a>
						<a href="deleteProduct?id=${product.productID}" class="btn btn-danger" role="button">Delete</a>
					</td>
				</tr>
			</c:forEach>
        </tbody>
    </table>
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	</div>
</body>
</html>