<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to the delivery company</title>
    </head>

    <body>
        <h1>Welcome to the delivery company</h1><br/>
        USER<spring:message code="client"/>: <sec:authentication property="name"/> <sec:authentication property="authorities"/><br>



        <sec:authorize access="isAnonymous()">
            <a href="client/register">Register</a><br>
            <a href="login">Login</a><br>
        </sec:authorize>

        <sec:authorize access="isAuthenticated()">
            <a href="logout">Logout</a><br>  
            <a href="request/make"> Make Order</a><br>
            
        </sec:authorize>

            <a href="request/showAll"> Show all request</a><br>
            <a href="shipment/show"> Show all shipment</a><br>
            <a href="test/view">Test view</a><br>

        <sec:authorize access="hasRole('ROLE_ADMIN')">  </sec:authorize>

    </body>
</html>
