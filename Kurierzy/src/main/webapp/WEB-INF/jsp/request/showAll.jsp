<%@ include file="/WEB-INF/jsp/includes.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Requests</title>
</head>
<body>
<div class="custom-container">
    <section>
        <div class="jumbotron">
            <div class="container">
                <h1>Requests</h1>
                <p>All requests</p>
            </div>
        </div>
    </section>
    <section class="container">
        <c:forEach items="${requestStatuses}" var="requestStatus">
            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2> ${requestStatus.title}</h2>
                        </div>
                        <c:forEach items="${requests}" var="request">
                            <c:if test="${request.requestStatus.id == requestStatus.id}">
                                <div class="col-sm-4">
                                    <div class="caption">
                                        <h3>Id: ${request.id}</h3>
                                        <p>Client: <a
                                                href=" <spring:url value="/client/show?id=${request.client.id}" /> ">${request.client.email}</a>
                                        </p>
                                        <p>Status: ${request.requestStatus.title}
                                        <p>Destination Address: ${request.city.name} ${request.destinationAddress} </p>
                                        <p>Addressee Surname: ${request.addresseeSurname} </p>
                                        <p>Addressee Name: ${request.addresseeName} </p>
                                        <p>Weight: ${request.weight} </p>
                                        <p>Shipment: <a
                                                href=" <spring:url value="/shipment/show?id=${request.shipment.id}" /> ">${request.shipment.id}</a>
                                        </p>
                                        <p>Employee: <a
                                                href=" <spring:url value="/employee/show?id=${request.shipment.employee.id}" /> ">${request.shipment.employee.email}</a>
                                        </p>
                                        <p>
                                            <form:form action="edit" method="POST">
                                                <input hidden="true" name="requestId" value="${request.id}"/>
                                                <input type="submit" class="btn btn-lg btn-success btn-block"
                                                       value="Edit">
                                            </form:form>
                                            <form:form action="delete" method="POST">
                                                <input hidden="true" name="requestId" value="${request.id}"/>
                                                <input type="submit" class="btn btn-lg btn-danger btn-block"
                                                       value="Delete">
                                            </form:form>
                                        </p>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:forEach>
        <a href="/Kurierzy/">
            <button class="btn btn-lg btn-default btn-block">
                <span class="glyphicon  glyphicon-arrow-left"></span>
                Back to the previous page
            </button>
        </a>
    </section>
</div>
</body>
</html>
