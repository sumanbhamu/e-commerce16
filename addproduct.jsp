<%@include file="adminhome.jsp"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<title>Add product</title>
 <style>
 th{padding: 5px;}
 </style>
</head>
<body>

	<form:form method="POST" action="addprod" commandName="product"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td><h2>Add Product</h2></td>
			</tr>
			<tr>
				<td><form:label path="prod_name">Product Name</form:label></td>
				<td><form:input path="prod_name" /></td>
			</tr>
			
				<tr>
				<td><form:label path="prod_price">Price</form:label></td>
				<td><form:input path="prod_price" /></td>
			</tr>
			
			<tr>
				<td><form:label path="quantity">Quantity</form:label></td>
				<td><form:input path="quantity" /></td>
			</tr>
		

			<!--  select:dropdown, items:collection ,itemValue: name to item-->
			<tr>
				<td>Category</td>
				<td><form:select path="cat_id"
						items="${categoryList}" itemValue="cat_id" itemLabel="cat_id">
					</form:select></td>
			</tr>
			
			<tr>
				<td >Supplier</td>
				<td><form:select path="supplier_id"
						items="${supplierList}" itemValue="supplier_id" itemLabel="supplier_id">
					</form:select></td>
			</tr>
			
			<tr>
				<td ><form:label path="img">Select Image:</form:label></td>

				<td><form:input type="file" path="img" /></td>
			</tr>
			<tr>
				<td style="text-align: center;"><input
					type="submit" value="Submit" style="color: green; font-size: 15pt;" /></td>
				<td><input type="reset" value="Cancel"
					style="color: red; font-size: 15pt" /></td>

			</tr>
		</table>
	</form:form>
	
	<h2>Product List</h2>
	
	<!-- core tags ,if or choose  ,$-expression language -->
	
	 <c:if test="${!empty productList}">
	<table>
	<tr>
	<th>Product Id</th>
	<th>ProductName</th>
	<!-- <th>Product Description</th> -->
	<th>Price</th>
	<th>Quantity</th>
	<th>Category Id</th>
	<th>Supplier Id</th>
	<th>Edit</th>
	<th>Delete</th>
	</tr>
	
	
	 <c:forEach items="${productList}" var="product">
	<tr>
	<td>${product.prod_id}</td>
	<td>${product.prod_name}</td>
	<%-- <td>${product.description}</td> --%>
	<td>${product.prod_price}</td>
	<td>${product.quantity}</td>
	<td>${product.category.cat_id}</td>
	<td>${product.supplier.supplier_id}</td>
	<td><a href="c:url value='editproducts${product.prod_id}'/>">Edit</a></td>
	<td><a href="c:url value='deleteproduct${product.prod_id}'/>">Delete</a></td>
	</tr>
	</c:forEach>
	
	
	</table>
	</c:if>
	<center><a href="adminhome">Back</a></center>
	
</body>
</html>
