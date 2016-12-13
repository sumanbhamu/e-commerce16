<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="adminhome.jsp"%>
<html>
<head>
<title>supplier Page</title>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}
</style>
</head>
<body>
	<h1>Add a supplier</h1>

	<form:form action="addsup" commandName="supplier">
		<table>
			<c:if test="${!empty supplier.supplier_name}">
				<tr>
					<td><form:label path="supplier_id">
				ID
			</form:label></td>
					<td><form:input path="supplier_id" readonly="true" size="8"
							disabled="true" /> <form:hidden path="supplier_id" /></td>
				</tr>
			</c:if>
			<tr>
				<td><form:label path="supplier_name">
				Supplier Name
			</form:label></td>
				<td><form:input path="supplier_name" /></td>
			</tr>
			<tr>
				<td><form:label path="supplier_address">
			supplier_address
			</form:label></td>
				<td><form:input path="supplier_address" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty supplier.supplier_name}">
						<input type="submit" value="Edit supplier" />
					</c:if> <c:if test="${empty supplier.supplier_name}">
						<input type="submit" value="Add supplier" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<br>
	<h3>suppliers List</h3>
	<c:if test="${!empty supplierList}">
		<table class="tg">
			<tr>
				<th width="80">supplier ID</th>
				<th width="120">supplier Name</th>
				<th width="120">supplier Address</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
			</tr>
			<c:forEach items="${supplierList}" var="supplier">
				<tr>
					<td>${supplier.supplier_id}</td>
					<td>${supplier.supplier_name}</td>
					<td>${supplier.supplier_address}</td>
					<td><a
						href="<c:url value='/editsupplier${supplier.supplier_id}' />">Edit</a></td>
					<td><a
						href="<c:url value='/deletesupplier${supplier.supplier_id}' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>


