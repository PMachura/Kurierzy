<%-- 
    Document   : show
    Created on : 2016-05-22, 11:08:44
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
                    <h1>Shipments</h1>
                    <p>All shipments</p>
                </div>
            </div>
        </section>

        <section class="container">
            <c:forEach items="${shipments}" var="shipment">
                <div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
                    <div class="thumbnail">
                        <div class="caption">
                            <h3>Id: ${shipment.id}</h3>
                            <p>Employee: <a href="employee/show?id=${shipment.employee.id}"> ${shipment.employee.email} </a> </p>
                            <p>Status: ${shipment.shipmentStatus.title}
                            <p> Current City: ${shipment.currentCity.name} </p>
                            <p> Next City: ${shipment.nextCity.name} </p>
                            <p>
                                <a
                                    href=" <spring:url value="/shipment/edit?id=${shipment.id}" /> "
                                    class="btn btn-primary"> Edit
                                </a>
                                    
                            </p>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </section>
    </body>
</html>
