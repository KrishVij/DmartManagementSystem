<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Owner Dashboard - Kirana Store</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>
<div style="flex: 1;">
    <div class="card">
        <h3>Add New Product</h3>
        <form action="<c:url value='/Products/save'/>" method="post">
            <c:if test="${not empty _csrf}">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </c:if>

            <div class="form-group">
                <label>Product Name</label>
                <input type="text" name="productName" required value = "${product.productName}">
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
                <input type="number" step="0.01" name="pricePerUnit" required min="0" value = "${product.pricePerUnit}">
            </div>

            <div class="form-group">
                <label>Initial Stock Quantity</label>
                <input type="number" name="stockQuantityLeft" required min="0" value = "${product.stockQuantityLeft}">
            </div>

            <div class="form-group">
                <label>Low Stock Warning Level</label>
                <input type="number" name="lowStockThreshold" value="5" required min="1">
            </div>

            <button type="submit" class="btn btn-primary" style="width: 100%;">Save Product</button>
        </form>
    </div>
</div>
</body>