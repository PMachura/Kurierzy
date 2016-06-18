<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add shipment</title>
    </head>
    <body>
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1><spring:message code="shipment.add"/><br></h1>
                    <p>Pleas enter a datails and submit</p>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <sec:authorize access="hasRole('ROLE_FORWARDER')">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Employee</h3>
                        </div>
                        
                        <div class="panel-body">
                            <form:form action = "assignEmployee" modelAttribute="shipment"> 
                                <input hidden="true" name="shipmentId" value="${shipment.id}" /> 
                                <input hidden="true" name="employeeId" value="${shipment.employee.id}" />
                                <input class="btn btn-lg btn-success btn-block" type="submit" value="Assign employee" >
                            </form:form>
                        </div>
                        
                    </div>
                    </sec:authorize>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Shipment ${shipment.id}</h3>
                        </div>
                        <div class="panel-body">
                            <form:form modelAttribute="shipment" method="POST" action="save">
                                <form:hidden path="id"/>
                                <fieldset>
                                    <div class="form-group">
                                        <div>
                                            <labal class="control-label">
                                                Status:
                                            </labal>
                                            <form:select path="shipmentStatus.id" items="${shipmentStatuses}" itemValue="id" itemLabel="title" cssClass="form-control" />
                                        </div>
                                        <div>
                                            <labal class="control-label">
                                                CurrentCity:
                                            </labal>
                                            <form:select path="currentCity.id" items="${cities}" itemValue="id" itemLabel="name" cssClass="form-control" />
                                        </div>
                                        <div>
                                            <labal class="control-label">
                                                NextCity: 
                                            </labal>
                                           <form:select path="nextCity.id" items="${cities}" itemValue="id" itemLabel="name" cssClass="form-control" />
                                        </div>
                                    </div>
                                    <c:if test="${not empty shipment.employee}">
                                        <div class="form-group">
                                            Employee: ${shipment.employee.email}
                                            <form:hidden readonly="true" path="employee.id"/>
                                        </div>
                                    </c:if>
                                    <input class="btn btn-lg btn-success btn-block" type="submit" value="Save">
                                </fieldset>
                            </form:form>
                        </div>
                    </div>
                        <c:choose>
                        <c:when test="${edit}">
                            <%--<sec:authorize access="hasRole('ROLE_COURIER')">--%>
                                <a href="/Kurierzy/shipment/show?id=${shipment.id}&back=${back}">
                                <button class="btn btn-lg btn-default btn-block"> 
                                <span class="glyphicon  glyphicon-arrow-left"> </span> 
                                Back to the previous page
                                </button>
                            </a>
                            <%--</sec:authorize>--%>
                            <%--<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_FORWARDER')">--%>
<!--                                <a href="/Kurierzy/shipment/showAll">
                                <button class="btn btn-lg btn-default btn-block"> 
                                <span class="glyphicon  glyphicon-arrow-left"> </span> 
                                Back to the previous page
                                </button>
                            </a>-->
                            <%--</sec:authorize>--%>
                            
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
    </body>
</html>
