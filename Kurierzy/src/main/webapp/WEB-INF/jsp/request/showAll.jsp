<%-- 
    Document   : showAll
    Created on : 2016-05-22, 05:25:04
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
                    <h1>Requests</h1>
                    <p>All requests</p>
                </div>
            </div>
        </section>

        <section class="container">
            <div class="row">
                <c:forEach items="${requests}" var="request">
                    <div class="col-sm-6 col-md-4" style="padding-bottom: 15px">
                        <div class="thumbnail">
                            <div class="caption">
                                <h3>Id: ${request.id}</h3>


                                <p>Client: <a href=" <spring:url value="/client/show?id=${request.client.id}" /> ">${request.client.email}</a></p>
                                <p>Status: ${request.requestStatus.title}
                                <p>Destination Address: ${request.city.name} ${request.destinationAddress} </p>
                                <p>Addressee Surname: ${request.addresseeSurname} </p>
                                <p>Addressee Name: ${request.addresseeName} </p>
                                <p>Weight: ${request.weight} </p>
                                <p>Shipment: <a href=" <spring:url value="/shipment/show?id=${request.shipment.id}" /> ">${request.shipment.id}</a></p>
                                <p>Employee: <a href=" <spring:url value="/employee/show?id=${request.shipment.employee.id}" /> ">${request.shipment.employee.email}</a></p>
                                <p>
                                    <form:form action="edit" method="POST">
                                        <input hidden="true" name="requestId" value="${request.id}"/>
                                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Edit"  >    
                                    </form:form> 
                                    <form:form action="delete" method="POST">
                                        <input hidden="true" name="requestId" value="${request.id}"/>
                                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Delete"  >    
                                    </form:form> 
                                </p>

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
    </body>
</html>
