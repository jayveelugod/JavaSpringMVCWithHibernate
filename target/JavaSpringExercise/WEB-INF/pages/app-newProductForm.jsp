<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New/Edit Product</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
*[role="form"] {
    max-width: 500px;
    padding: 15px;
    margin: 0 auto;
    background-color: #f3f3f3;
    border-radius: 0.3em;
}

*[role="form"] h2 {
    margin-left: 5em;
    margin-bottom: 1em;
}
</style>
</head>
<body>
    <div align="center" class="container">
    <h1>Add/Edit Product</h1>
        <form:form action="saveProduct" method="post" modelAttribute="product" class="form-horizontal" role="form">
        	<div class="form-group">
        		 <label for="name" class="col-sm-3 control-label">Product Name</label>
              	 <div class="col-sm-9">
               		<form:input path="name" cssClass="form-control"/>
                </div>
            </div>
        	<div class="form-group">
               <label for="description" class="col-sm-3 control-label">Product Description</label>
               <div class="col-sm-9">
               		<form:input path="description" cssClass="form-control"/>
                </div>
            </div>
            <div class="form-group">
               <label for="price" class="col-sm-3 control-label">Price</label>
               <div class="col-sm-9">
               		<form:input path="price" cssClass="form-control" type="number"/>
                </div>
            </div>
        	<div class="form-group">
               <label for="categoryPath" class="col-sm-3 control-label">Category Path</label>
               <div class="col-sm-9">
               		<form:input path="categoryPath" cssClass="form-control"/>
                </div>
            </div>
            <div class="form-group">
               <label for="available" class="col-sm-3 control-label">Available</label>
               <div class="col-sm-9">
               		<form:input path="available" cssClass="form-control" type="number"/>
                </div>
            </div>
            <div class="form-group">
               <label for="categoryID" class="col-sm-3 control-label">Product Category</label>
               <div class="col-sm-9">
               		<form:select  path="categoryID" cssClass="form-control">
				    <form:option value="0"> --SELECT--</form:option>
				    <form:options items="${listCategory}"></form:options>
				  </form:select>
                </div>
            </div>
            
            <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary btn-block">Save</button>
                    </div>
            </div>
            <div class="form-group">
			 	<div class="col-sm-9 col-sm-offset-3">
                     	<a href="app-home" class="btn-danger btn btn-block" role="button">Cancel</a>
                </div>        
  			</div>
        </form:form>
    </div>
</body>
</html>