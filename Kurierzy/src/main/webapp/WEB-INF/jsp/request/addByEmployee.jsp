<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<html>
    <head>
        <title>Orders</title>
    </head>
    <body>
        <div class="custom-container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <c:choose>
                        <c:when test="${edit}">
                            <h1><spring:message code="request.edit"/><br></h1>
                        </c:when>
                        <c:otherwise>
                            <h1> <spring:message code="request.make"/><br></h1>
                        </c:otherwise>
                    </c:choose>
                    <p>Pleas enter a datail of order and submit</p>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">

                        <div class="panel-heading">
                            <h3 class="panel-title">Client</h3>
                        </div>
                        <div class="panel-body">
                            <form:form action = "assignClient"> 
                                <input hidden="true" name="shipmentId" value="${request.shipment.id}"/>
                                <input hidden="true" name="clientId"   value="${request.client.id}"/>
                                <input hidden="true" name="requestId" value="${request.id}"/>
                                <div class ="form-group">
                                    <input class="btn btn-lg btn-success btn-block" type="submit" value="assignClient" >
                                </div>
                            </form:form>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Shipment</h3>
                        </div>
                        <div class="panel-body">
                            <form:form action = "assignShipment"> 
                                <input hidden="true" name="shipmentId" value="${request.shipment.id}"/>
                                <input hidden="true" name="clientId"   value="${request.client.id}"/>
                                <input hidden="true" name="requestId" value="${request.id}"/>
                                <div class ="form-group">
                                    <input class="btn btn-lg btn-success btn-block" type="submit" value="assignShipment" >
                                </div>
                            </form:form>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Order</h3>
                        </div>
                        <div class="panel-body">
                            <form:form modelAttribute="request" method="POST" action="save">

                                <fieldset>
                                    <form:hidden path="id" />
                                    <c:choose>
                                        <c:when test="${not empty request.client}">
                                            <h4>
                                                <a href=" <spring:url value="/client/show?id=${request.client.id}" /> ">
                                                    Client: ${request.client.email}
                                                </a>
                                                <form:hidden path="client.id" /> 
                                            </h4>
                                        </c:when>
                                        <c:otherwise>
                                            <h4>Client: No client</h4>
                                        </c:otherwise>
                                    </c:choose>
                                            
                                    <c:choose>
                                        <c:when test="${not empty request.shipment}">
                                            <h4>
                                                <a href=" <spring:url value="/shipment/show?id=${request.shipment.id}" /> ">
                                                    Shipment: ${request.shipment.id}
                                                </a>
                                                <form:hidden path="shipment.id" />
                                            </h4>
                                        </c:when>
                                        <c:otherwise>
                                            <h4>Shipment: No shipment assigned</h4>
                                        </c:otherwise>
                                    </c:choose>        
                                    <br>
                                    
                                    <div class="form-group">
                                        <form:input path="destinationAddress" placeholder="Destination Address" required="true" cssClass="form-control" />
                                        <form:errors path="destinationAddress"/>
                                    </div>
                                    
                                    <div class="form-group">
                                        <form:select items="${cities}" path="city.id" itemValue="id" itemLabel="name" cssClass="form-control"></form:select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <form:input path="addresseeName" placeholder="Addresse Name" required="true" cssClass="form-control"/>
                                        <form:errors path="addresseeName"/>
                                    </div>
                                    
                                    <div class="form-group">
                                        <form:input path="addresseeSurname" placeholder="Addressee Surname" required="true" cssClass="form-control"/>
                                        <form:errors path="addresseeSurname"/>
                                    </div>
                                    
                                    <div class="form-group">
                                        <form:input path="weight" placeholder="weight" type="text" required="true" cssClass="form-control"/>
                                        <form:errors path="weight"/>
                                    </div>
                                    
                                    <div class ="form-group">
                                        <form:select path="requestStatus.id" items="${requestStatuses}" itemValue="id" itemLabel="title" cssClass="form-control"/>
                                    </div>
                                    
                                <input name="addType" value="employee" hidden="hidden" />
                                <input class="btn btn-lg btn-success btn-block" type="submit" value="Save">
                            </fieldset>
                        </form:form>
                    </div>
                </div>
                    <c:choose>
                        <c:when test="${edit}">
                            <a href="/Kurierzy/request/showAll">
                                <button class="btn btn-lg btn-default btn-block"> 
                                <span class="glyphicon  glyphicon-arrow-left"> </span> 
                                Back to the previous page
                                </button>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="/Kurierzy/">
                                <button class="btn btn-lg btn-default btn-block"> 
                                <span class="glyphicon  glyphicon-arrow-left"> </span> 
                                Back to the previous page
                                </button>
                            </a>
                        </c:otherwise>
                    </c:choose>
            </div>
        </div>
    </div>
        </div>
    </body>
</html>