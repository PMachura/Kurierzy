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
                    <h1><spring:message code="employee.showAll"/><br></h1>
                    <p></p>
                </div>
            </div>
        </section>

        <div class="container">
            <table class="table">
                <thead class="thead-inverse">
                    <tr>
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Surname</th>
                        <th>Email</th>
                        <th>City</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${employees}" var="employee">
                        <tr>
                            <td><a href="show?id=${employee.id}">${employee.id}</a></td>
                            <td>${employee.name}</td>
                            <td>${employee.surname}</td>
                            <td>${employee.email}</td>
                            <td>${employee.city.name}</td>

                            <c:if test="${assignToShipment}">
                                <td>
                                    <form:form action="/Kurierzy/shipment/add">
                                        <input value="${shipment.id}" name="shipmentId">
                                        <input value="${employee.id}" name="employeeId">
                                        <input class="btn btn-lg btn-success btn-block" type="submit" value="AssignToShipment">
                                    </form:form>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>
</html>
