<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Users">

    <h1>Users</h1>

    <form method="POST" action="${pageContext.request.contextPath}/Users">

        <!-- Butoane sus -->
        <div class="mb-3">

            <!-- Add User (exemplu, rămâne cum l-ai avut) -->
            <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
                <a href="${pageContext.request.contextPath}/AddUser"
                   class="btn btn-primary btn-lg">
                    Add User
                </a>
            </c:if>

            <!-- Invoice DOAR pentru INVOICING -->
            <c:if test="${pageContext.request.isUserInRole('INVOICING')}">
                <button class="btn btn-secondary btn-lg" type="submit">
                    Invoice
                </button>
            </c:if>

        </div>

        <!-- Lista utilizatori -->
        <div class="container text-center">

            <c:forEach var="user" items="${users}">
                <div class="row mb-2 align-items-center">

                    <!-- Checkbox DOAR pentru INVOICING -->
                    <c:if test="${pageContext.request.isUserInRole('INVOICING')}">
                        <div class="col-1">
                            <input type="checkbox"
                                   name="user_ids"
                                   value="${user.id}" />
                        </div>
                    </c:if>

                    <div class="col">${user.username}</div>
                    <div class="col">${user.email}</div>

                </div>
            </c:forEach>

        </div>

    </form>

    <!-- Invoices – DOAR pentru INVOICING -->
    <c:if test="${pageContext.request.isUserInRole('INVOICING') and not empty invoices}">
        <h2>Invoices</h2>

        <c:forEach var="username" items="${invoices}" varStatus="status">
            ${status.index + 1}. ${username}
            <br/>
        </c:forEach>
    </c:if>

</t:pageTemplate>
