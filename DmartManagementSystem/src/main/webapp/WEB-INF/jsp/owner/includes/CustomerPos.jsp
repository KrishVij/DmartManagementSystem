<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!Doctype html>
<html>
<head>
    <title> Customer POS</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>
<jsp:include page="CustomerNavbar.jsp" />

<div class = "card"> <b> Order Details </b> </div>
<div class = "card">
    <label> Item's Ordered: </label>
    <input type="text" name="productName" value="${product.productName}" required>
</div>
</body>
</html>