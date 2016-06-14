<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request</title>
    </head>
    <body>
        <div class="custom-container">
            
            <section>
                <div class="jumbotron">
                        <h1>Request</h1>
                </div>
            </section>

            <section class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-4" style="padding-bottom: 15px">
                        <div class="thumbnail">
                            <div class="caption">
                                <!--<div class ="container">-->
                                    <h3>ID ${request.id}</h3>
                                    <p>Addressee Surname: ${request.addresseeSurname} </p>
                                    <p>Addressee Name: ${request.addresseeName} </p>
                                    <p>Destination Address: ${request.city.name} ${request.destinationAddress} </p>                                                      
                                    <p>Weight: ${request.weight} </p>
                                    <p>Price: ${request.price} </p>
                                    <p>Status: ${request.requestStatus.title} 
                                    <sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_FORWARDER')">
                                        <p>
                                            <a href=" <spring:url value="/request/edit?id=${request.id}"/>">
                                                <button type="button" class="btn btn-success btn-block">
                                                    Edit
                                                </button>
                                            </a>
                                        </p>
                                    </sec:authorize>
                                <!--</div>-->

                                <!-- DANE DOTYCZACE SHIPMENTU      -->
                                <!--<div class ="container">-->
                                    <c:choose>
                                        <c:when test="${not empty request.shipment}">
                                            <sec:authorize access="hasRole('ROLE_CLIENT')"> 
                                                <h3>
                                                    <form:form action="myShipment" method="POST">
                                                        <input hidden="true" name="shipmentId" value="${request.shipment.id}"/>
                                                        <button type="submit" class="btn btn-success btn-block" >Shipment ${request.shipment.id}</button>    
                                                    </form:form>   
                                                </h3> 
                                            </sec:authorize>
                                            <p> Shipment status: ${request.shipment.shipmentStatus.title} </p>
                                            <p>
                                                Courier:
                                                <a href=" <spring:url value="/employee/show?id=${request.shipment.employee.id}" /> "> 
                                                     ${request.shipment.employee.email}
                                                </a>
                                            </p>
                                        </c:when>
                                        <c:otherwise>
                                            <h3>  No shipment assigned </h3>
                                        </c:otherwise>
                                    </c:choose>
                                <!--</div>-->
                                <!-- DANE DOTYCZACE SHIPMENTU  KONIEC    -->
                            </div>
                        </div>
                    </div>
                    <sec:authorize access="hasRole('ROLE_CLIENT')">
                        <a href="/Kurierzy/client/myRequests">
                            <button class="btn btn-lg btn-default btn-block"> 
                                <span class="glyphicon  glyphicon-arrow-left"> </span> 
                                Back to the previous page
                            </button>
                        </a>
                    </sec:authorize>               
                </div>
            </section>
        </div>
    </body>
</html>
