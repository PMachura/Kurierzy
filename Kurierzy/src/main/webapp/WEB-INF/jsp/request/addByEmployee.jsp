<%-- 
    Document   : make
    Created on : 2016-05-21, 14:03:16
    Author     : Przemek
--%>

<%@ include file="/WEB-INF/jsp/includes.jsp"%>

<html>
    <head>


        <title>Produkty</title>
    </head>
    <body>
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
                        <c:if test="${edit}" >
                            <div class="panel-heading">
                                <h3 class="panel-title">Shipment</h3>
                            </div>
                            <div class="panel-body">
                                <form:form action = "assignShipment" modelAttribute="request"> 
                                    <form:hidden path = "id"/>
                                    <div class ="form-group">
                                        <input class="btn btn-lg btn-success btn-block" type="submit" value="linkShipment" >
                                    </div>
                                </form:form>
                            </div>

                        </c:if>

                        <div class="panel-heading">
                            <h3 class="panel-title">Order</h3>
                        </div>
                        <div class="panel-body">
                            <form:form modelAttribute="request" method="POST" action="save">

                                <fieldset>
                                    <form:hidden path="id" />
                                    <form:hidden path="client.id" />
                                    <div class="form-group">
                                        <form:input path="destinationAddress" placeholder="Destination Address" required="true" /><form:errors path="destinationAddress"/><br/>
                                    </div>
                                    <div class="form-group">
                                        <form:select items="${cities}" path="city.id" itemValue="id" itemLabel="name"></form:select>
                                        </div>
                                        <div class="form-group">
                                        <form:input path="addresseeName" placeholder="Addresse Name" required="true" /><form:errors path="addresseeName"/><br/>
                                    </div>
                                    <div class="form-group">
                                        <form:input path="addresseeSurname" placeholder="Addressee Surname" required="true" /><form:errors path="addresseeSurname"/><br/>
                                    </div>
                                    <div class="form-group">
                                        <form:input path="weight" placeholder="weight" type="text" required="true" /><form:errors path="weight"/><br/>
                                    </div>
                                    <c:if test="${edit}" >
                                        <c:if test="${not empty request.shipment}">
                                            <div class="form-group">
                                                <label>Shipment: ${request.shipment.id}</label>
                                                <form:hidden readonly="true" path="shipment.id"/>
                                            </div>
                                        </c:if>
                                        <div class ="form-group">
                                            <form:select path="requestStatus.id" items="${requestStatuses}" itemValue="id" itemLabel="title" />
                                        </div>
                                    </c:if>
                                    <input class="btn btn-lg btn-success btn-block" type="submit" value="Save">
                                </fieldset>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>






