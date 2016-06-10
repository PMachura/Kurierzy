

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
                                <h3>ID ${shipment.id}</h3>
                                <p> Shipment status: ${shipment.shipmentStatus.title} </p>
                                <p> Current City: ${shipment.currentCity.name} </p>
                                <p> Next City: ${shipment.nextCity.name} </p>
                                <p>
                                    <a
                                        href=" <spring:url value="/employee/show?id=${shipment.employee.id}" /> "> 
                                        Courier: ${shipment.employee.email}
                                    </a>
                                </p> 
                                <sec:authorize access="hasAuthority('MANAGER')">
                                    <form:form action="edit" method="POST">
                                        <input hidden="true" name="shipmentId" value="${shipment.id}"/>
                                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Edit"  >    
                                    </form:form> 
                                    <form:form action="delete" method="POST">
                                        <input hidden="true" name="shipmentId" value="${shipment.id}"/>
                                        <input type="submit" class="btn btn-lg btn-success btn-block" value="DELETE"  >    
                                    </form:form> 
                                </sec:authorize>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </body>
</html>
