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
                    <h1>Shipments</h1>
                    <p>All shipments</p>
                </div>
            </div>
        </section>

        <div class="container">
            <table class="table">
                <thead class="thead-inverse">
                    <tr>
                        <th></th>
                        <th>Id</th>
                        <th>Employee</th>
                        <th>Status</th>
                        <th>City</th>
                        <th>Next City</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${shipments}" var="shipment">
                        <tr>
                            <td>
                                <form:form action="/Kurierzy/request/addByEmployee">
                                    <input hidden="true" name ="requestId" value="${requestId}">
                                    <input hidden="true" name ="clientId" value ="${clientId}">
                                    <input hidden="true" value="${shipment.id}" name="shipmentId">
                                    <input class="btn-primary" type="submit" value="Assign to order">
                                </form:form>
                            </td>
                            <td>${shipment.id}</td>
                            <td><a href="employee/show?id=${shipment.employee.id}"> ${shipment.employee.email} </a></td>
                            <td>${shipment.shipmentStatus.title}</td>
                            <td> Current City: ${shipment.currentCity.name} </td>
                            <td> Next City: ${shipment.nextCitny.name} </td>
                            <td>${client.city.name}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <form:form action="/Kurierzy/request/addByEmployee">
                <input hidden="true" value="${shipmentId}" name="shipmentId">
                <input hidden="true" value="${requestId}" name="requestId">
                <input hidden="true" value="${clientId}" name="clientId">
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
