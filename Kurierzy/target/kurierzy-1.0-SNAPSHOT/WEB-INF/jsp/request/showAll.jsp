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
                                <h3>${request.id}</h3>
                                
                                
                                <p>Client: ${request.client.email} </p>
                                <p>Status: ${request.requestStatus.title}
                                <p>Destination Address: ${request.city.name} ${request.destinationAddress} </p>
                                <p>Addressee Surname: ${request.addresseeSurname} </p>
                                <p>Addressee Name: ${request.addresseeName} </p>
                                <p>Weight: ${request.weight} </p>
                                <p>Shipment: ${request.shipment.id} ${request.shipment.employee.email}
                                <p>
                                    <a
                                        href=" <spring:url value="/request/edit?id=${request.id}" /> "
                                        class="btn btn-primary"> Edit
                                    </a>
                                </p>

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
    </body>
</html>
