<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Billing Page</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class = "BillingPage">
    <span>Product Name</span>
    <select name = "Products">
        <c:forEach var = "Product" items="${Product}">
            <option>${Product.productName}</option>
        </c:forEach>
    </select>
</div>
</body>
</html>

