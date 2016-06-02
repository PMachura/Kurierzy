<%-- 
    Document   : show
    Created on : 2016-05-22, 11:08:44
    Author     : Przemek
--%>

<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1><spring:message code="client.showRequests"/><br></h1>
                    <p></p>
                </div>
            </div>
        </section>

        <div class="container">
            <table class="table">
                <thead class="thead-inverse">
                    <tr>
                        <th>Id</th>
                        <th>Adresse Surname</th>
                        <th>Adresse Name</th>
                        <th>Destination</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${client.requests}" var="request">
                        <tr>
                         
                            <td>
                                <form:form action="myRequest" method="POST">
                                    <input hidden="true" name="requestId" value="${request.id}"/>
                                    <input type="submit" value="${request.id}"      
                                </form:form>
                            </td>
                            <td>${request.addresseeSurname}</td>
                            <td>${request.addresseeName}</td>
                            <td>${request.city.name}</td>
                            <td>${request.requestStatus.title}</td>
                           
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>
</html>
