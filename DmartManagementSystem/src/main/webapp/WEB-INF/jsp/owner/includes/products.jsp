<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Management - Kirana Store</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

<jsp:include page="navbar.jsp" />

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

        <!-- Create Product Side Card -->
        <div style="flex: 1;">
            <div class="card">
                <h3>Add New Product</h3>
                <form action="<c:url value='/Products/save'/>" method="post">
                    <c:if test="${not empty _csrf}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </c:if>

                    <div class="form-group">
                        <label>Product Name</label>
                        <input type="text" name="productName" required placeholder="e.g. Fortune Oil 1L">
                    </div>

                    <div class="form-group">
                        <label>Category</label>
                        <select name="category" required>
                            <option value="">Select Category</option>
                            <option value="Grains & Pulses">Grains & Pulses</option>
                            <option value="Oils & Ghee">Oils & Ghee</option>
                            <option value="Dairy & Bakery">Dairy & Bakery</option>
                            <option value="Snacks & Beverages">Snacks & Beverages</option>
                            <option value="Personal Care">Personal Care</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Unit</label>
                        <select name="unit" required>
                            <option value="kg">kg</option>
                            <option value="litre">litre</option>
                            <option value="packet">packet</option>
                            <option value="piece">piece</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Price Per Unit (₹)</label>
                        <input type="number" step="0.01" name="pricePerUnit" required min="0">
                    </div>

                    <div class="form-group">
                        <label>Initial Stock Quantity</label>
                        <input type="number" name="stockQuantityLeft" required min="0">
                    </div>

                    <div class="form-group">
                        <label>Low Stock Warning Level</label>
                        <input type="number" name="lowStockThreshold" value="5" required min="1">
                    </div>

                    <button type="submit" class="btn btn-primary" style="width: 100%;">Save Product</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>