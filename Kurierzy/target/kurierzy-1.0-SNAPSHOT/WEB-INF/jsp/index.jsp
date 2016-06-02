<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"   xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity4">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to the delivery company</title>
    </head>

    <body>
        <h1><spring:message code="home"/></h1>   
        <spring:message code="home.info"/><br>
        
        <br><p>Dane klienta: <sec:authentication property="name"/>    <sec:authentication property="authorities"/></p> 


       <br><p>Dla niezalogowanych</p>
        <sec:authorize access="isAnonymous()">
            <a href="client/register">Register</a><br>
            <a href="login">Login</a><br>
        </sec:authorize>

       <br><p>Dla zalogowanych klientow</p>
        <sec:authorize access="isAuthenticated()">          
            <a href="logout">Logout</a><br>  
            <a href="request/addByClient"> Make Order</a><br>
            <a href="client/myRequests">Show your request</a><br>
            <a href="client/myProfile">Show profile</a><br>
            <a href="client/editMyProfile">Edit your profile</a><br>
        </sec:authorize>

        <br><p>Dla pracownikow, narazie nie ma weryfikacji</p>
            <a href="request/showAll"> Show all request</a><br>
            <a href ="shipment/add"> Add shipment</a><br>
            <a href="shipment/show"> Show all shipment</a><br>
            
            <a href="employee/add">Add employee</a><br>
            <a href="employee/showAll">Show employees</a><br>
            <a href="vehicle/add">Add vehicle</a><br>
                
            <a href="request/addByEmployee"> Add request</a><br>
            
            
            
            
            <br><p>Dla testow</p>
            <a href="test/view">Test view</a><br>
            <a href="test/pushUser">PushUser</a><br>
                
                
                
        <sec:authorize access="hasAnyAuthority('USER,CLIENT')"> </sec:authorize>
        <sec:authorize access="hasRole('CLIENT')"> user </sec:authorize>
    </body>
</html>
