

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
                                <sec:authorize access="hasAuthority('EMPLOYEE')">
                                    <p>
                                        <a
                                            href=" <spring:url value="/shipment/edit?id=${shipment.id}" /> "
                                            class="btn btn-primary"> Edit
                                        </a>
                                    </p>
                                </sec:authorize>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </body>
</html>
