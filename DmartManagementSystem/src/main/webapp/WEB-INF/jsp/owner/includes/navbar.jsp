<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="navbar">
    <div>
        <span style="font-size: 18px; font-weight: bold; margin-right: 25px;">Kirana Owner Panel</span>
        <a href="<c:url value='/Dashboard'/>">Dashboard</a>
        <a href="<c:url value='/Products'/>">Products</a>
        <a href="<c:url value='/Orders'/>">Orders</a>
        <a href="<c:url value='/Pos'/>">Walk-in Billing</a>
    </div>
    <div>
        <form action="<c:url value='/logout'/>" method="post" style="display:inline;">
            <c:if test="${not empty _csrf}">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </c:if>
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>
    </div>
</div>

<div class="container" style="margin-top: 10px; margin-bottom: 0;">
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-error">${errorMessage}</div>
    </c:if>
</div>