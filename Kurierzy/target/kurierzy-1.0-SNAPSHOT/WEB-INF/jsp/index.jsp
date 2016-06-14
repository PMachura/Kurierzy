<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"   xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity4">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to the delivery company</title>
    </head>
    <body>
        <div class="custom-container">
            <h1><spring:message code="home"/></h1>   
            <spring:message code="home.info"/><br><br>

            <h4>Dane: <sec:authentication property="name"/> <sec:authentication property="authorities"/></h4> 

            <br><h4>Dla niezalogowanych</h4>
            <sec:authorize access="isAnonymous()">
                <a href="client/register">Register</a><br>
                <a href="login">Login</a><br>
            </sec:authorize>
                    
            <sec:authorize access="isAuthenticated()">
                <a href="logout">Logout</a><br> 
            </sec:authorize>

            <br><h4>Dla zalogowanych klientow</h4>
            <sec:authorize access="hasRole('ROLE_CLIENT')">
                <a href="request/addByClient"> Make Order</a><br>
                <a href="client/myRequests">Show your request</a><br>
                <a href="client/myProfile">Show profile</a><br>
            </sec:authorize>

            <br><h4>Dla administratorow</h4>           
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <a href="employee/add">Add employee</a><br>
                <a href="employee/showAll">Show employees</a><br>           
            </sec:authorize>

            <br><h4>Dla spedytorow</h4>
            <sec:authorize access="hasAnyRole('ROLE_FORWARDER, ROLE_ADMIN')">
                <a href="request/addByEmployee"> Add request</a><br>
                <a href="request/showAll"> Show all request</a><br>
                <a href ="shipment/add"> Add shipment</a><br>
                <a href="shipment/showAll"> Show all shipments</a><br>
                <a href="vehicle/add">Add vehicle</a><br>
            </sec:authorize>

            <br><h4>Dla kurierow</h4>    
            <sec:authorize access="hasRole('ROLE_COURIER')">
                <a href="employee/myShipments"> MyShipments</a><br>
            </sec:authorize>
        </div>
    </body>
</html>