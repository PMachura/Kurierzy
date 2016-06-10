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
                            <td><a href="/Kurierzy/employee/show?id=${employee.id}">${employee.id}</a></td>
                            <td>${employee.name}</td>
                            <td>${employee.surname}</td>
                            <td>${employee.email}</td>
                            <td>${employee.city.name}</td>


                            <td>
                                <form:form action="/Kurierzy/shipment/add" >
                                    <input hidden="true" value="${shipmentId}" name ="shipmentId">
                                    <input hidden="true" value="${employee.id}" name="employeeId">
                                    <input class="btn-primary " type="submit" value="AssignToShipment">
                                </form:form>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <form:form action="/Kurierzy/shipment/add">
                <input hidden ="true" value="${shipmentId}" name="shipmentId">
                <input hidden= "true" value="${employeeId}" name="employeeId">
                <div class="input-prepend">

                    <button class="btn btn-lg btn-default btn-block" type="submit"> 
                        <span class="glyphicon  glyphicon-arrow-left"> </span> 
                        Backt to the previous page

                    </button>

                </div>

            </form:form>
        </div>

    </body>
</html>
