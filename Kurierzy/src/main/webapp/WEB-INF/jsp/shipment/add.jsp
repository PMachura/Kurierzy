<%-- 
    Document   : add
    Created on : 2016-05-28, 11:23:22
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
                    <h1><spring:message code="shipment.add"/><br></h1>
                    <p>Pleas enter a datails and submit</p>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Employee</h3>
                        </div>
                        <div class="panel-body">
                            <form:form action = "assignEmployee" modelAttribute="shipment"> 
                                <form:hidden path = "id"/>
                                <label title="${shipment.id}" >ID</label>
                                <div class ="form-group">
                                    <input class="btn btn-lg btn-success btn-block" type="submit" value="Assign employee" >
                                </div>
                            </form:form>
                        </div>
                        <div class="panel-heading">
                            <h3 class="panel-title">Shipment</h3>
                        </div>
                        <div class="panel-body">
                            <form:form modelAttribute="shipment" method="POST" action="save">
                                <form:hidden path="id"/>
                                <fieldset>
                                    <div class="form-group">
                                        <form:select path="shipmentStatus.id" items="${shipmentStatuses}" itemValue="id" itemLabel="title" />
                                    </div>
                                    <c:if test="${not empty shipment.employee}">
                                        <div class="form-group">
                                            <label>Employee: ${shipment.employee.id}</label>
                                            <form:hidden readonly="true" path="employee.id"/>
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
</html>
