<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Owner Dashboard - Kirana Store</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container">
    <h2>Overview</h2>

    <!-- Top Metrics -->
    <div class="grid-4">
        <div class="card">
            <h3>Today's Sales</h3>
            <div class="value">₹<fmt:formatNumber value="${todaySales}" type="number" minFractionDigits="2"/></div>
        </div>
        <div class="card">
            <h3>Pending Orders</h3>
            <div class="value">${pendingOrdersCount}</div>
        </div>
        <div class="card">
            <h3>Low Stock Items</h3>
            <div class="value" style="color: #dc2626;">${lowStockCount}</div>
        </div>
        <div class="card">
            <h3>Total Products</h3>
            <div class="value">${totalProductsCount}</div>
        </div>
    </div>

    <!-- Incoming Orders Section -->
    <div style="margin-top: 30px;">
        <h3>Pending Online Orders</h3>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Date/Time</th>
                    <th>Amount</th>
                    <th>Payment</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty pendingOrders}">
                        <c:forEach var="order" items="${pendingOrders}">
                            <tr>
                                <td>#${order.id}</td>
                                <td>${order.customer.name}<br><small>${order.customer.phone}</small></td>
                                <td><fmt:formatDate value="${order.orderDate}" pattern="dd MMM, hh:mm a"/></td>
                                <td>₹<fmt:formatNumber value="${order.totalAmount}" type="number" minFractionDigits="2"/></td>
                                <td>${order.paymentType}</td>
                                <td><span class="badge badge-warning">${order.status}</span></td>
                                <td>
                                    <form action="<c:url value='/owner/orders/update-status'/>" method="post" style="display:inline;">
                                        <c:if test="${not empty _csrf}">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        </c:if>
                                        <input type="hidden" name="orderId" value="${order.id}">
                                        <input type="hidden" name="status" value="CONFIRMED">
                                        <button type="submit" class="btn btn-success">Confirm</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="7" style="text-align: center; color: #64748b;">No pending online orders right now.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>