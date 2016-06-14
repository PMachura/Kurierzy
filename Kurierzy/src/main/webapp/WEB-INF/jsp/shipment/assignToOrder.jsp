<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Shipment</title>
    </head>
    <body>
        <div class="custom-container">
            
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
                            <th>Id</th>
                            <th>Employee</th>
                            <th>Status</th>
                            <th>Current City</th>
                            <th>Next City</th>
                            <th>Assign</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${shipments}" var="shipment">
                            <tr>
                                <td>${shipment.id}</td>
                                <td>${shipment.employee.email}</td>
                                <td>${shipment.shipmentStatus.title}</td>
                                <td>${shipment.currentCity.name} </td>
                                <td>${shipment.nextCity.name} </td>
                                <td>
                                    <form:form action="/Kurierzy/request/addByEmployee">
                                        <input hidden="true" name ="requestId" value="${requestId}">
                                        <input hidden="true" name ="clientId" value ="${clientId}">
                                        <input hidden="true" value="${shipment.id}" name="shipmentId">
                                        <input class="btn btn-primary btn-block" type="submit" value="Assign to order">
                                    </form:form>
                                </td>
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
        </div>
    </body>
</html>
