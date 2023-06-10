<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Test</title>
</head>
<body>
<c:forEach var="account" items="${roles}">
<table>
<tr>
<td>${account.id}</td>
<td>${account.roleName}</td>
</tr>
</table>

</c:forEach>
</body>
</html>