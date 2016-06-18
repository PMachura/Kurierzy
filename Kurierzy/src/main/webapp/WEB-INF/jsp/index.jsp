<%@ include file="/WEB-INF/jsp/includes.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity4">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome to the delivery company</title>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"><spring:message code="home"/></a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <sec:authorize access="isAnonymous()">
                        <li><a href="client/register">Register</a></li>
                        <li><a href="login">Login</a></li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <li><a href="logout">Logout</a></li>
                    </sec:authorize>
                </ul>
            </div>
        </div>
    </nav>
    <div class="jumbotron">
        <p>
            <spring:message code="home.info"/>
        </p>
    </div>
    <div class="col-sm-12">
        <div class="well"><h4>Dane: <sec:authentication property="name"/> <sec:authentication property="authorities"/>
        </h4></div>
    </div>
    <sec:authorize access="hasRole('ROLE_CLIENT')">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Dla zalogowanych klientow</h3>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <a class="list-group-item" href="request/addByClient"> Make Order</a><br>
                        <a class="list-group-item" href="client/myRequests">Show your request</a><br>
                        <a class="list-group-item" href="client/myProfile">Show profile</a><br>
                    </div>
                </div>
            </div>
        </div>
    </sec:authorize>
        <div class="row">
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Dla administratorow</h3>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <a class="list-group-item" href="employee/add">Add employee</a><br>
                        <a class="list-group-item" href="employee/showAll">Show employees</a><br>
                    </div>
                </div>
            </div>
        </div>
    </sec:authorize>
    <sec:authorize access="hasAnyRole('ROLE_FORWARDER, ROLE_ADMIN')">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Dla spedytorow</h3>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <a class="list-group-item" href="request/addByEmployee"> Add request</a><br>
                        <a class="list-group-item" href="request/showAll"> Show all request</a><br>
                        <a class="list-group-item" href="shipment/add"> Add shipment</a><br>
                        <a class="list-group-item" href="shipment/showAll"> Show all shipments</a><br>
                        <a class="list-group-item" href="vehicle/add">Add vehicle</a><br>
                    </div>
                </div>
            </div>
        </div>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_COURIER')">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Dla kurierow</h3>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <a class="list-group-item" href="employee/myShipments"> MyShipments</a><br>
                    </div>
                </div>
            </div>
        </div>
    </sec:authorize>
        </div>
</div>
</body>
</html>
