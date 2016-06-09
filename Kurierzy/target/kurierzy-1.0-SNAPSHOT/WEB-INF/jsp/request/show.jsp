

<%@ include file="/WEB-INF/jsp/includes.jsp"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1><spring:message code="request.show" /></h1>

                </div>
            </div>
        </section>

        <section class="container">
            <div class="row">

                <div class="col-sm-6 col-md-4" style="padding-bottom: 15px">
                    <div class="thumbnail">
                        <div class="caption">


                            <div class ="container">
                                <h3>ID ${request.id}</h3>
                                <p>Addressee Surname: ${request.addresseeSurname} </p>
                                <p>Addressee Name: ${request.addresseeName} </p>
                                <p>Destination Address: ${request.city.name} ${request.destinationAddress} </p>                                                      
                                <p>Weight: ${request.weight} </p>
                                <p>Price: ${request.price} </p>
                                <p>Status: ${request.requestStatus.title} 
                                <sec:authorize access="hasAuthority('EMPLOYEE')">
                                    <p>
                                        <a
                                            href=" <spring:url value="/request/edit?id=${request.id}" /> "
                                            class="btn btn-primary"> Edit
                                        </a>
                                    </p>
                                </sec:authorize>
                            </div>
                            
                            <!-- DANE DOTYCZACE SHIPMENTU      -->
                            <div class ="container">
                                <c:choose>
                                    <c:when test="${not empty request.shipment}">
                                        <sec:authorize access="hasAuthority('CLIENT')"> 
                                            <h3>

                                                <form:form action="myShipment" method="POST">
                                                    <input hidden="true" name="shipmentId" value="${request.shipment.id}"/>
                                                    <input type="submit" value="Shipment ${request.shipment.id}" >    
                                                </form:form>   

                                            </h3> 
                                        </sec:authorize>
                                        <p> Shipment status: ${request.shipment.shipmentStatus.title} </p>
                                        <p>
                                            <a
                                                href=" <spring:url value="/employee/show?id=${request.shipment.employee.id}" /> "> 
                                                Courier: ${request.shipment.employee.email}
                                            </a>
                                        </p>
                                    </c:when>
                                    <c:otherwise>
                                        <h3>  No shipment assigned </h3>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <!-- DANE DOTYCZACE SHIPMENTU  KONIEC    -->
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </body>
</html>
