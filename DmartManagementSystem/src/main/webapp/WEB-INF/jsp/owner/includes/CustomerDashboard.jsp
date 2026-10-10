<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard - Kirana Store</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

<jsp:include page="CustomerNavbar.jsp" />

<div class="container">
    <div style="display: flex; gap: 20px;">
        <!-- Product List Table -->
        <div style="flex: 2;">
            <h2>Inventory Items</h2>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price/Unit</th>
                    <th>Stock</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="prod" items="${products}">
                    <tr>
                        <td>${prod.productId}</td>
                        <td><strong>${prod.productName}</strong></td>
                        <td>${prod.category}</td>
                        <td>₹<fmt:formatNumber value="${prod.pricePerUnit}" type="number" minFractionDigits="2"/> / ${prod.pricePerUnit}</td>
                        <td>${prod.stockQuantityLeft}</td>
                        <td>
                            <c:choose>
                                <c:when test="${prod.stockQuantityLeft <= 0}">
                                    <span class="badge badge-danger">Out of Stock</span>
                                </c:when>
                                <c:when test="${prod.stockQuantityLeft <= 18}">
                                    <span class="badge badge-warning">Low Stock</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-success">In Stock</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="<c:url value='/Products/edit?id=${prod.productId}'/>" class="btn btn-warning">Edit</a>
                            <a href="<c:url value='/Products/delete?id=${prod.productId}'/>" class="btn btn-warning">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>